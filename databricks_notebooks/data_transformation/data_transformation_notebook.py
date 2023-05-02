# Import required libraries
from pyspark.sql.functions import col, expr
import datetime

# Import the base notebook with common utility functions
# %run /path/to/your/base_notebook

# Fetch the metadata for transformations and transformation dependencies
transformations_metadata = fetch_metadata("<jdbc_url>", "<jdbc_user>", "<jdbc_password>", "Transformations")
dependencies_metadata = fetch_metadata("<jdbc_url>", "<jdbc_user>", "<jdbc_password>", "TransformationDependencies")

# Assume that you've already created and populated a 'dataframes' dictionary from the Data Ingestion Notebook
# dataframes = ...

# Add your storage path for processed data
processed_data_storage_path = "your_processed_data_storage_path"

# Function to apply a transformation
def apply_transformation(transformation_metadata, input_dataframes):
    transformation_id = transformation_metadata["TransformationID"]
    transformation_type = transformation_metadata["Type"]
    configuration = json.loads(transformation_metadata["Configuration"])

    input_dataframe = input_dataframes[configuration["input_dataset"]]
    output_dataframe = None

    if transformation_type == "filter":
        condition = configuration["condition"]
        output_dataframe = input_dataframe.filter(expr(condition))
    elif transformation_type == "select":
        columns = configuration["columns"]
        output_dataframe = input_dataframe.select(*[col(c) for c in columns])
    elif transformation_type == "join":
        second_dataframe = input_dataframes[configuration["second_dataset"]]
        join_type = configuration["join_type"]
        join_condition = expr(configuration["condition"])
        output_dataframe = input_dataframe.join(second_dataframe, join_condition, join_type)
    elif transformation_type == "aggregate":
        groupby_columns = configuration["groupby_columns"]
        agg_functions = configuration["agg_functions"]
        output_dataframe = input_dataframe.groupBy(*[col(c) for c in groupby_columns]).agg(expr(agg_functions))
    else:
        raise ValueError(f"Unsupported transformation type: {transformation_type}")

    return transformation_id, output_dataframe

# Function to recursively apply transformations based on dependencies
def apply_transformations_recursively(transformation_id, input_dataframes, executed_transformations):
    if transformation_id in executed_transformations:
        return executed_transformations[transformation_id]

    transformation_metadata = next(t for t in transformations_metadata if t["TransformationID"] == transformation_id)
    dependent_transformations = [d["DependsOnTransformationID"] for d in dependencies_metadata if d["TransformationID"] == transformation_id]

    for dependent_transformation_id in dependent_transformations:
        input_dataframes[dependent_transformation_id] = apply_transformations_recursively(dependent_transformation_id, input_dataframes, executed_transformations)

    transformed_dataframe_id, transformed_dataframe = apply_transformation(transformation_metadata, input_dataframes)
    executed_transformations[transformed_dataframe_id] = transformed_dataframe
    return transformed_dataframe

# Apply transformations based on the metadata
executed_transformations = {}
for transformation in transformations_metadata:
    transformation_id = transformation["TransformationID"]
    if transformation_id not in executed_transformations:
        transformed_dataframe = apply_transformations_recursively(transformation_id, dataframes, executed_transformations)
        log(f"Applied transformation {transformation_id}")
        
        # Store the processed data in the specified storage path
        output_path = f"{processed_data_storage_path}/{transformation_id}_{datetime.datetime.now().strftime('%Y%m%d_%H%M%S')}"
        transformed_dataframe.write.parquet(output_path)
        log(f"Stored processed data for transformation {transformation_id} at {output_path}")

# Now the 'executed_transformations' dictionary contains the transformed DataFrames based on the metadata