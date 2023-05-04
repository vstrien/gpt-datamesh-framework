CREATE TABLE ConfigurationCategory (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(255) NOT NULL
);

CREATE TABLE ConfigurationItem (
    ItemID INT PRIMARY KEY IDENTITY(1,1),
    CategoryID INT FOREIGN KEY REFERENCES ConfigurationCategory(CategoryID),
    ItemKey NVARCHAR(255) NOT NULL,
    ItemValue NVARCHAR(MAX) NOT NULL,
    Description NVARCHAR(1000) NULL
);

CREATE TABLE ConfigurationVersion (
    VersionID INT PRIMARY KEY IDENTITY(1,1),
    ItemID INT FOREIGN KEY REFERENCES ConfigurationItem(ItemID),
    VersionNumber INT NOT NULL,
    ItemValue NVARCHAR(MAX) NOT NULL,
    EffectiveDate DATETIME NOT NULL,
    ExpirationDate DATETIME NULL
);