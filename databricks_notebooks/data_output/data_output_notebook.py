# Import required libraries
import datetime

# Import the base notebook with common utility functions
# %run /path/to/your/base_notebook

# Set up your storage paths for the output data
output_data_storage_path = "your_output_data_storage_path"
invalid_data_storage_path = "your_invalid_data_storage_path"

# Assume that you've already created and populated the 'valid_records_dict' and 'invalid_records_dict' dictionaries from the Data Quality Notebook
# valid_records_dict = ...
# invalid_records_dict = ...

# Write valid and invalid records to the appropriate storage paths
for rule_id, valid_records in valid_records_dict.items():
    output_path = f"{output_data_storage_path}/{rule_id}_{datetime.datetime.now().strftime('%Y%m%d_%H%M%S')}"
    valid_records.write.parquet(output_path)
    log(f"Stored valid records for rule {rule_id} at {output_path}")

for rule_id, invalid_records in invalid_records_dict.items():
    output_path = f"{invalid_data_storage_path}/{rule_id}_{datetime.datetime.now().strftime('%Y%m%d_%H%M%S')}"
    invalid_records.write.parquet(output_path)
    log(f"Stored invalid records for rule {rule_id} at {output_path}")