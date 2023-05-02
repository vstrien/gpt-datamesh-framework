# Import required libraries
from pyspark.sql.functions import col

# Import the base notebook with common utility functions
# %run /path/to/your/base_notebook

# Fetch the metadata for data quality rules
data_quality_rules_metadata = fetch_metadata("<jdbc_url>", "<jdbc_user>", "<jdbc_password>", "DataQualityRules")

# Assume that you've already created and populated the 'executed_transformations' dictionary from the Data Transformation Notebook
# executed_transformations = ...

# Function to apply a data quality rule
def apply_data_quality_rule(rule_metadata, input_dataframes):
    rule_id = rule_metadata["RuleID"]
    rule_type = rule_metadata["Type"]
    configuration = json.loads(rule_metadata["Configuration"])

    input_dataframe = input_dataframes[configuration["input_dataset"]]
    output_dataframe = None
    valid_records = None

    if rule_type == "filter":
        condition = configuration["condition"]
        valid_records = input_dataframe.filter(expr(condition))
        output_dataframe = input_dataframe.subtract(valid_records)
    else:
        raise ValueError(f"Unsupported data quality rule type: {rule_type}")

    return rule_id, valid_records, output_dataframe

# Apply data quality rules based on the metadata
valid_records_dict = {}
invalid_records_dict = {}
for rule in data_quality_rules_metadata:
    rule_id, valid_records, invalid_records = apply_data_quality_rule(rule, executed_transformations)
    valid_records_dict[rule_id] = valid_records
    invalid_records_dict[rule_id] = invalid_records
    log(f"Applied data quality rule {rule_id}: {valid_records.count()} valid records, {invalid_records.count()} invalid records")

# Now the 'valid_records_dict' and 'invalid_records_dict' dictionaries contain the valid and invalid records based on the data quality rules