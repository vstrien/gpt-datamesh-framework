To create a data processing framework in Azure Databricks, you can use a combination of components such as notebooks, libraries, and jobs. The framework should be modular, reusable, and configurable to adapt to various data processing and integration scenarios. Here are some key components to consider:

1. Modular Notebooks: Develop a set of notebooks that encapsulate specific data processing and integration functionalities. These notebooks should be modular and focused on individual tasks like data ingestion, data transformation, data quality checks, and data output.

2. Base Notebook: Create a base notebook that contains common utility functions and configurations, such as reading metadata from the Azure SQL Database, handling exceptions, logging, and generating Spark DataFrames based on metadata. Import this base notebook into your other notebooks using the `%run` magic command.

3. Data Ingestion Notebook: Develop a notebook for data ingestion that reads data from various sources based on the metadata and creates Spark DataFrames. Handle different data source types (e.g., file, database, API) and formats (e.g., CSV, JSON, Parquet).

4. Data Transformation Notebook: Create a notebook for data transformation that reads transformation metadata and applies the specified transformations (e.g., aggregation, join, filter) to the input DataFrames. Use the Spark DataFrame API or SQL to perform the transformations.

5. Data Quality Notebook: Develop a notebook for data quality checks that reads data quality rule metadata and applies the specified checks (e.g., completeness, uniqueness, consistency) to the DataFrames. Log any data quality issues and handle them based on your requirements (e.g., discard, flag, or correct invalid data).

6. Data Output Notebook: Create a notebook for data output that writes the transformed and validated DataFrames to the specified destinations (e.g., ADLSgen2, Delta Lake, Synapse Analytics). Handle different output formats and storage options based on the metadata.

7. Orchestrator Notebook: Develop an orchestrator notebook that reads the metadata, identifies the dependencies and execution order, and invokes the appropriate notebooks using the `%run` magic command. This notebook is responsible for orchestrating the entire data processing and integration workflow.

8. Libraries: Utilize built-in and external libraries to enhance your data processing capabilities. Some popular libraries include Delta Lake for reliable data storage, Koalas for a pandas-like API, and PyArrow for efficient data interchange.

9. Jobs: Create Databricks jobs to schedule and automate the execution of your notebooks. You can set up jobs to run periodically or trigger them using Azure Data Factory pipelines.

By using these components, you can build a flexible and extensible data processing framework in Azure Databricks that adapts to various data processing and integration scenarios based on the metadata stored in your Azure SQL Database.