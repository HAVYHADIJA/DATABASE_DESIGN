
-- Supplier Table
CREATE TABLE Supplier (
    Supplier_ID INT PRIMARY KEY,
    Supplier_Name VARCHAR(100),
    Contact VARCHAR(50),
    Email VARCHAR(100),
    Country VARCHAR(50),
    Shipping_Cost DECIMAL(10, 2)
);

-- Vehicle Table
CREATE TABLE Vehicle (
    vehicle_ID INT PRIMARY KEY,
    Make VARCHAR(50),
    Model VARCHAR(50),
    engine_size INT,
    year INT,
    color VARCHAR(20),
    vehicle_condition VARCHAR(50),
    status VARCHAR(10),
    Supplier_ID INT,
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);

-- Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    contact VARCHAR(20),
    address VARCHAR(20),
    NIN VARCHAR(20),
    Email VARCHAR(12)
);

-- Staff Table
CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role_ID INT,
    Contact VARCHAR(20),
    Email VARCHAR(100),
    Hire_Date DATE,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (Role_ID) REFERENCES Role(Role_ID)
);

-- Role Table
CREATE TABLE Role (
    Role_ID INT PRIMARY KEY,
    Role_Name VARCHAR(100)
);

-- Sales Table
CREATE TABLE Sales (
    Sale_ID INT PRIMARY KEY,
    Sale_Date DATE,
    Sale_Amount DECIMAL(10, 2),
    Vehicle_ID INT,
    Customer_ID INT,
    Staff_ID INT,
    FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(vehicle_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(customer_id),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

-- Payment Table
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Payment_Date VARCHAR(10),
    Amount_Paid VARCHAR(20),
    Payment_Method VARCHAR(20),
    Payment_Status VARCHAR(20),
    FOREIGN KEY (Sale_ID) REFERENCES Sales(Sale_ID)
);

-- Inventory_Tracker Table
CREATE TABLE Inventory_Tracker (
    Inventory_ID INT PRIMARY KEY,
    Vehicle_ID INT,
    Location VARCHAR(20),
    Opening_Stock VARCHAR(20),
    Quantity_Changed VARCHAR(20),
    Closing_Stock VARCHAR(12),
    Movement_Type ENUM('Addition', 'Removal'),
    Last_Updated DATE,
    FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(vehicle_ID)
);

-- Insert data into Supplier table
INSERT INTO Supplier (Supplier_ID, Supplier_Name, Contact, Email, Country, Shipping_Cost)
VALUES 
    (1, 'Auto Supply Co.', '123-456-7890', 'contact@autosupply.com', 'USA', 150.00),
    (2, 'Vehicle Parts Ltd.', '987-654-3210', 'info@vehicleparts.com', 'Canada', 200.00),
    (3, 'Global Motors', '555-123-4567', 'support@globalmotors.com', 'Germany', 175.00);

-- Insert data into Vehicle table
INSERT INTO Vehicle (vehicle_ID, Make, Model, engine_size, year, color, vehicle_condition, status, Supplier_ID)
VALUES 
    (101, 'Toyota', 'Camry', 2500, 2022, 'Blue', 'New', 'Available', 1),
    (102, 'Ford', 'Mustang', 5000, 2021, 'Red', 'Used', 'Sold', 2),
    (103, 'Honda', 'Civic', 2000, 2023, 'Black', 'New', 'Available', 3);

-- Insert data into Customer table
INSERT INTO Customer (customer_id, name, contact, address, NIN, Email)
VALUES 
    (1, 'Alice Johnson', '555-678-1234', '123 Elm St', '073456789', 'aly@email.com'),
    (2, 'Bob Smith', '555-987-6543', '456 Oak St', '07654321', 'bob@email.com'),
    (3, 'Charlie Brown', '555-234-5678', '789 Maple St', '0789123', 'char@email.com');

ALTER TABLE customer MODIFY EMAIL VARCHAR(50);

-- Insert data into Role table
INSERT INTO Role (Role_ID, Role_Name)
VALUES 
    (1, 'Sales Associate'),
    (2, 'Manager'),
    (3, 'Technician');

-- Insert data into Staff table
INSERT INTO Staff (Staff_ID, Name, Role_ID, Contact, Email, Hire_Date, Salary)
VALUES 
    (1, 'Emily Davis', 1, '555-123-7890', 'emily.d@email.com', '2023-01-15', 50000.00),
    (2, 'John Wilson', 2, '555-456-7890', 'john.w@email.com', '2022-07-30', 60000.00),
    (3, 'Sarah Lee', 3, '555-789-1234', 'sarah.l@email.com', '2021-05-20', 55000.00);

-- Insert data into Sales table
INSERT INTO Sales (Sale_ID, Sale_Date, Sale_Amount, Vehicle_ID, Customer_ID, Staff_ID)
VALUES 
    (1, '2024-10-05', 30000.00, 101, 1, 1),
    (2, '2024-10-12', 25000.00, 102, 2, 2),
    (3, '2024-10-20', 22000.00, 103, 3, 3);

-- Insert data into Payment table
INSERT INTO Payment (Payment_ID, Payment_Date, Amount_Paid, Payment_Method, Payment_Status)
VALUES 
    (1, '2024-10-06', '15000.00', 'Credit Card', 'Partial'),
    (2, '2024-10-13', '25000.00', 'Cash', 'Full'),
    (3, '2024-10-21', '22000.00', 'Bank Transfer', 'Full');

-- Insert data into Inventory_Tracker table
INSERT INTO Inventory_Tracker (Inventory_ID, Vehicle_ID, Location, Opening_Stock, Quantity_Changed, Closing_Stock, Movement_Type, Last_Updated)
VALUES 
    (1, 101, 'Warehouse A', '10', '5', '5', 'Removal', '2024-09-30'),
    (2, 102, 'Warehouse B', '20', '15', '5', 'Removal', '2024-10-01'),
    (3, 103, 'Warehouse C', '15', '10', '5', 'Removal', '2024-10-02');

SELECT * FROM inventory_tracker;
SELECT * FROM payment;
SELECT * FROM vehicle;
