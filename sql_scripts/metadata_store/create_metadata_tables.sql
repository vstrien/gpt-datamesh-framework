CREATE TABLE DataSources (
    DataSourceID INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(255) NOT NULL,
    Type NVARCHAR(255) NOT NULL,
    ConnectionString NVARCHAR(MAX) NOT NULL,
    Format NVARCHAR(255) NOT NULL
);

CREATE TABLE DataSets (
    DataSetID INT PRIMARY KEY IDENTITY,
    DataSourceID INT FOREIGN KEY REFERENCES DataSources(DataSourceID),
    Name NVARCHAR(255) NOT NULL,
    [Schema] NVARCHAR(MAX) NOT NULL
);

CREATE TABLE Transformations (
    TransformationID INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX),
    Type NVARCHAR(255) NOT NULL,
    Configuration NVARCHAR(MAX) NOT NULL
);

CREATE TABLE TransformationDependencies (
    DependencyID INT PRIMARY KEY IDENTITY,
    TransformationID INT FOREIGN KEY REFERENCES Transformations(TransformationID),
    DependsOnTransformationID INT FOREIGN KEY REFERENCES Transformations(TransformationID)
);

CREATE TABLE DataQualityRules (
    RuleID INT PRIMARY KEY IDENTITY,
    DataSetID INT FOREIGN KEY REFERENCES DataSets(DataSetID),
    Name NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX),
    Type NVARCHAR(255) NOT NULL,
    Configuration NVARCHAR(MAX) NOT NULL
);

CREATE TABLE TransformationDataSets (
    TransformationDataSetID INT PRIMARY KEY IDENTITY,
    TransformationID INT FOREIGN KEY REFERENCES Transformations(TransformationID),
    DataSetID INT FOREIGN KEY REFERENCES DataSets(DataSetID),
    Role NVARCHAR(255) NOT NULL
);