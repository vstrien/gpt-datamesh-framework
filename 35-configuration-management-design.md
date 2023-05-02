Configuration Management within an SQL database can be designed with a set of tables to store configuration details related to your data processing pipeline. Here's an example of the tables and their T-SQL scripts:

1. `ConfigurationCategory` table: Stores the categories of configurations.

```sql
CREATE TABLE ConfigurationCategory (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(255) NOT NULL
);
```

2. `ConfigurationItem` table: Stores the individual configuration items.

```sql
CREATE TABLE ConfigurationItem (
    ItemID INT PRIMARY KEY IDENTITY(1,1),
    CategoryID INT FOREIGN KEY REFERENCES ConfigurationCategory(CategoryID),
    ItemKey NVARCHAR(255) NOT NULL,
    ItemValue NVARCHAR(MAX) NOT NULL,
    Description NVARCHAR(1000) NULL
);
```

3. `ConfigurationVersion` table: Stores the versions of the configurations.

```sql
CREATE TABLE ConfigurationVersion (
    VersionID INT PRIMARY KEY IDENTITY(1,1),
    ItemID INT FOREIGN KEY REFERENCES ConfigurationItem(ItemID),
    VersionNumber INT NOT NULL,
    ItemValue NVARCHAR(MAX) NOT NULL,
    EffectiveDate DATETIME NOT NULL,
    ExpirationDate DATETIME NULL
);
```

These tables will help you manage configuration data related to your data processing pipeline. The `ConfigurationCategory` table stores categories for organizing configuration items, while the `ConfigurationItem` table stores individual configuration entries with their values. The `ConfigurationVersion` table is useful for tracking changes in configuration values over time and managing configuration versioning.

You can extend this design based on your specific requirements, such as adding more tables or columns to store additional configuration details, or including constraints and indexes for better data integrity and performance.