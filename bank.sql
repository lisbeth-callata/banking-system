-- Create the database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS bank;
USE bank;

-- Table for clients
CREATE TABLE IF NOT EXISTS clients (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    id_number VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    CONSTRAINT chk_email_format CHECK (email LIKE '%@%.%')
);

-- Table for bank accounts
CREATE TABLE IF NOT EXISTS accounts (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20) NOT NULL UNIQUE,
    balance DOUBLE DEFAULT 0.0 CHECK (balance >= 0),
    account_type ENUM('SAVINGS', 'CURRENT') NOT NULL,
    client_id BIGINT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);

-- Insert example data into the clients table
INSERT INTO clients (first_name, last_name, id_number, email) VALUES 
('Juan', 'Pérez', '12345678A', 'juan.perez@example.com'),
('Ana', 'García', '87654321B', 'ana.garcia@example.com'),
('Luis', 'López', '11223344C', 'luis.lopez@example.com');

-- Insert example data into the accounts table
INSERT INTO accounts (account_number, balance, account_type, client_id) VALUES 
('CUA123456789', 1000.00, 'SAVINGS', 1),   -- Juan's savings account with a balance of 1000
('CUA987654321', 500.00, 'CURRENT', 2),     -- Ana's current account with a balance of 500
('CUA456789123', 0.00, 'SAVINGS', 3);       -- Luis's savings account with a balance of 0 (not yet active)

-- Create a combined trigger for balance validation
DELIMITER $$

CREATE TRIGGER check_balance
BEFORE UPDATE ON accounts
FOR EACH ROW
BEGIN
    -- Validation for savings accounts: Don't allow negative balance
    IF OLD.account_type = 'SAVINGS' AND NEW.balance < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Withdrawals that result in a negative balance are not allowed for savings accounts';
    END IF;

    -- Validation for current accounts: Don't allow balance below -500
    IF OLD.account_type = 'CURRENT' AND NEW.balance < -500 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Withdrawals that result in a balance lower than the overdraft limit of -500 are not allowed for current accounts';
    END IF;
END $$

DELIMITER ;

-- Verify the inserted data
SELECT * FROM clients;
SELECT * FROM accounts;


