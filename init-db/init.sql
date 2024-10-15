-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    comments TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create products table
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Create purchases table
CREATE TABLE IF NOT EXISTS purchases (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    product_id INT REFERENCES products(id),
    quantity INT CHECK (quantity > 0),
    purchased_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Insert 10 users
INSERT INTO users (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Jim', 'Beam', 'jim.beam@example.com'),
('Alice', 'Wonder', 'alice.wonder@example.com'),
('Bob', 'Builder', 'bob.builder@example.com'),
('Charlie', 'Brown', 'charlie.brown@example.com'),
('Dana', 'Scully', 'dana.scully@example.com'),
('Ethan', 'Hunt', 'ethan.hunt@example.com'),
('Frodo', 'Baggins', 'frodo.baggins@example.com'),
('Gordon', 'Freeman', 'gordon.freeman@example.com');

-- Insert 10 products
INSERT INTO products (name, description, price, stock) VALUES
('Laptop', 'A powerful laptop for work', 1200.00, 15),
('Smartphone', 'Latest model smartphone', 800.00, 30),
('Headphones', 'Wireless headphones', 150.00, 50),
('Monitor', '24 inch HD monitor', 300.00, 20),
('Keyboard', 'Mechanical keyboard', 90.00, 40),
('Mouse', 'Wireless ergonomic mouse', 40.00, 100),
('Tablet', 'High-resolution tablet', 500.00, 25),
('Camera', 'DSLR camera with lenses', 1000.00, 10),
('Printer', 'Wireless color printer', 200.00, 12),
('Smartwatch', 'Fitness tracking smartwatch', 250.00, 35);
