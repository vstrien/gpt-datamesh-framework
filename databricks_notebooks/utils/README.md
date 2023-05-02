After creating the `data_processing_utils.py` module, you can import the functions in your notebooks using the `%run` magic command, assuming you've stored the file in a location accessible by Databricks:

```python
# Import the utility functions from the data_processing_utils module
%run /path/to/your/data_processing_utils
```

Alternatively, if you have packaged the module as an egg or wheel package and installed it in your Databricks workspace, you can use the standard Python `import` statement:

```python
# Import the utility functions from the data_processing_utils module
from data_processing_utils import fetch_metadata, log, handle_error, generate_dataframe
```

With these utility functions in a separate Python module, you can maintain the code in a centralized location, making it easier to update and manage. You can add more utility functions to this module as needed, or even create multiple modules for different purposes.

Using this approach, you can keep your notebooks clean and focused on the specific tasks they are designed to perform while reusing the utility functions across different notebooks in your data processing pipeline.

