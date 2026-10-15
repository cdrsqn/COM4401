
CREATE TABLE EmployeeRoles (
  RoleID INT PRIMARY KEY,
  RoleName VARCHAR(50) NOT NULL,
  StaffCount INT NOT NULL,
  BudgetPerUnit DECIMAL(8,2) NOT NULL
  
);
CREATE TABLE WorkstationBuilds (
  BuildID INT PRIMARY KEY,
  RoleID INT,
  BuildName VARCHAR(100) NOT NULL,
  Source VARCHAR(50) NOT NULL,
  FOREIGN KEY (RoleID) REFERENCES EmployeeRoles(RoleID)

);
CREATE TABLE Reccomendations (
  ReccomendationID INT PRIMARY KEY,
  RoleID INT,
  Justification TEXT NOT NULL,
  Compromise TEXT NOT NULL,
  Approved BOOLEAN NOT NULL,
  EthicalNotes TEXT NOT NULL,
  FOREIGN KEY (RoleID) REFERENCES EmployeeRoles(RoleID)

);
CREATE TABLE BuildItems (
  ItemID INT PRIMARY KEY,
  BuildID INT,
  HarwareCategory VARCHAR(50) NOT NULL,
  ItemName VARCHAR(100) NOT NULL,
  Specification VARCHAR(150) NOT NULL,
  Cost DECIMAL(8,2) NOT NULL,
  FOREIGN KEY (BuildID) REFERENCES WorkstationBuilds(BuildID)

);
INSERT INTO EmployeeRoles
(RoleID, RoleName, StaffCount, BudgetPerUnit)
VALUES
(1, 'Architect/CAD Designer', 5, 2500.00);


INSERT INTO WorkstationBuilds
(BuildID, RoleID, BuildName, Source)
VALUES
(1, 1, 'Architect Workstation', 'Buildscores.com');


INSERT INTO BuildItems
(ItemID, BuildID, HarwareCategory, ItemName, Specification, Cost)
VALUES
(1, 1, 'CPU', 'AMD Ryzen 7 9700X', 'https://www.amd.com/en/products/processors/desktops/ryzen/9000-series/amd-ryzen-7-9700x.html', 344.99 ),
(2, 1, 'Motherboard', 'MSI X870 MAG TOMAHAWK WIFI AM5 DDR5 ATX', 'https://uk.msi.com/Motherboard/MAG-X870-TOMAHAWK-WIFI/Specification', 229.99 ),
(3, 1, 'RAM', 'Crucial Pro Overclocking 32GB (2x16) DDR5 6400 CL32 Black ', 'https://uk.crucial.com/memory/ddr5/cp2k16g64c32u5b', 436.58 ),
(4, 1, 'Storage', 'Western Digital WD_BLACK SN7100 2TB SSD M.2-2280 PCIe 4.0 x4 NVMe', 'https://www.sandisk.com/en-gb/products/ssd/internal-ssd/wd-black-sn7100-nvme-internal-ssd?sku=WDS200T4X0E-00CJA0', 259.96 ),
(5, 1, 'GPU', 'Gigabyte AERO OC GeForce RTX 5060 Ti 8GB GDDR7 ', 'https://www.gigabyte.com/uk/Graphics-Card/GV-N506TAERO-OC-8GD', 428.99),
(7, 1, 'Case', 'HYTE X50 ATX Mid Tower White with Tempered Glass Side Panel ', 'HYTE X50 ATX Mid Tower White with Tempered Glass Side Panel ', 91.99),
(8, 1, 'Keyboard', 'Logitech K780 Wireless Slim Keyboard ', 'https://www.logitech.com/en-gb/shop/p/k780-multi-device-wireless-keyboard', 69.99),
(9, 1, 'Mouse', 'HyperX Pulsefire Haste 2 Core Black ', 'https://uk.hyperx.com/products/hyperx-pulsefire-haste-2-core-wireless-gaming-mouse', 27.99),
(10, 1, 'Webcam', 'Logitech C270 720p Webcam ', 'https://www.logitech.com/en-gb/shop/c/webcams', 17.98),
(11, 1, 'PSU', 'Asus TUF Gaming 1200G Black 1200W Fully Modular 80+ Gold Certified ', 'https://www.asus.com/uk/motherboards-components/power-supply-units/tuf-gaming/tuf-gaming-1200g/techspec/', 229.45),
(12, 1, 'cooling', 'Thermalright Assassin X 120 Refined SE Air 120mm Black / Silver ', 'https://www.thermalright.com/product/assassin-x-120-refined-se/', 15.00 );



INSERT INTO Reccomendations
(ReccomendationID, RoleID, Justification, Compromise, Approved, EthicalNotes)
VALUES
(1, 1, 'The AMD Ryzen 7 9700x core sticks to the budget split and also has 8 cores with 5.5ghz speed boost clock, which is a suitable speed therefore it will smoothly operate the key tasks such as rendering or 3D modelling. The MSI X870 MAG TOMAHAWK WIFI AM5 DDR5 ATX motherboard can easily  withstand the ryzen CPU used, includes a lot of input ports for several different types, for any external work for example from home. Also features a heavy duty power system and also speedy PCIe 5.0 graphics and SSD. This specific RAM is Ultra-fast, at a pace of 6400 CL32, with a moderately high storage of 32GB. Also having the lowest latency out of contender memories, therefore running multiple programs or tasks will not be a complication. The chosen storage is also great, Two terabytes of storage over direct, fast PCIe connection, providing low latency when for example saving or opening projects. The PCIe 4.0 ports provide a well-placed component, with again, the connection being right at the heart. The GPU would be the most important component to spend some more money out of the budget on for a increased quality. High core count of 4068. Although only 8GB, projects can be extracted for work from home stations etc. The GPU especially needed for running rendering and 3D models as that would be the main task for the workstation daily, and this unit is exceptionally high power for its price.  A perfectly standard and comparatively powerful supply. A 1200w supply with full modularity and is 80+ Gold certified. It is a good choice because for a slightly above average price,comparatively of PSUs you get a powerful machine which will help to manage the running of the design programs. It is relatively cheap for a large case, and also allows a large GPU space of 430mm, which is compatible with the chosen GPU. Aesthetics wise, it is not insanely high ranking, however it allows easy construction. Reason is they dont exactly need a fancy keyboard which has aesthetically pleasing sound or colours. The keyboard has a good latency and is a slim design which can provide more space on the workstation for wireless drawing pads. A simple mouse, which has a good connection of wireless 2.4ghz. its comparatively lightweight, suitable for ambidextrous users. The webcam is a simple, design, with a 720p resolution. That is enough for the employees', 'yes', TRUE, '?' );


SELECT*from EmployeeRoles;

SELECT RoleName, BudgetPerUnit FROM EmployeeRoles;

SELECT RoleName, BudgetPerUnit, BudgetPerUnit > 1000 AS Over1000
FROM EmployeeRoles;

SELECT RoleName, StaffCount
FROM EmployeeRoles
ORDER BY StaffCount DESC;

SELECT ItemID, HarwareCategory, ItemName, Specification, Cost
FROM BuildItems
WHERE BuildID = 1;

SELECT COUNT(*) AS ItemCount
FROM BuildItems
WHERE BuildID = 1;

SELECT SUM(Cost) AS TotalHardwareCost
FROM BuildItems
WHERE BuildID = 1;

SELECT wb.BuildID, wb.BuildName, SUM(bi.Cost) AS TotalHardwareCost
FROM WorkstationBuilds AS wb
JOIN BuildItems AS bi ON bi.BuildID = wb.BuildID
GROUP BY wb.BuildID, wb.BuildName
ORDER BY TotalHardwareCost DESC;

SELECT wb.BuildName, er.RoleName
FROM WorkstationBuilds AS wb
JOIN EmployeeRoles AS er ON wb.RoleID = er.RoleID;

SELECT bi.ItemName, wb.BuildName, er.RoleName
FROM BuildItems AS bi
JOIN WorkstationBuilds AS wb ON bi.BuildID = wb.BuildID
JOIN EmployeeRoles AS er ON wb.RoleID = er.RoleID;










