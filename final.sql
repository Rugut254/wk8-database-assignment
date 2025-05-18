CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Investments (
    investment_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    type ENUM('Stock', 'Bond', 'Mutual Fund') NOT NULL
);

CREATE TABLE Portfolios (
    portfolio_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    name VARCHAR(100) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    portfolio_id INT,
    investment_id INT,
    type ENUM('Buy', 'Sell') NOT NULL,
    quantity DECIMAL(10,2) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (portfolio_id) REFERENCES Portfolios(portfolio_id),
    FOREIGN KEY (investment_id) REFERENCES Investments(investment_id)
);


Market Data Table (Tracking Price History)
CREATE TABLE Market_Data (
    market_id INT PRIMARY KEY AUTO_INCREMENT,
    investment_id INT,
    date DATE NOT NULL,
    open_price DECIMAL(10,2) NOT NULL,
    close_price DECIMAL(10,2) NOT NULL,
    volume BIGINT NOT NULL,
    FOREIGN KEY (investment_id) REFERENCES Investments(investment_id)
);

-- Insert sample users
INSERT INTO Users (name, email) VALUES 
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com');

-- Insert sample investments
INSERT INTO Investments (name, type) VALUES 
('Tesla Inc', 'Stock'),
('Government Bond 2030', 'Bond'),
('S&P 500 ETF', 'Mutual Fund');

-- Insert sample portfolios
INSERT INTO Portfolios (user_id, name) VALUES 
(1, 'Alice Growth Portfolio'),
(2, 'Bob Retirement Fund');

-- Insert sample transactions
INSERT INTO Transactions (portfolio_id, investment_id, type, quantity, price) VALUES 
(1, 1, 'Buy', 10, 800),
(1, 3, 'Buy', 5, 450),
(2, 2, 'Buy', 20, 1000);

-- Insert sample market data
INSERT INTO Market_Data (investment_id, date, open_price, close_price, volume) VALUES 
(1, '2025-05-17', 790, 805, 5000000),
(2, '2025-05-17', 980, 1005, 1000000),
(3, '2025-05-17', 440, 455, 8000000);