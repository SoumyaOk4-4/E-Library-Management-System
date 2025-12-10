-- Create Database
CREATE DATABASE IF NOT EXISTS elibdb;
USE elibdb;

-- Create Users Table
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phno BIGINT NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(50) DEFAULT 'customer'
);

-- Create Books Table
CREATE TABLE IF NOT EXISTS books (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    author VARCHAR(100) UNIQUE NOT NULL,
    publisher VARCHAR(100),
    quantity INT DEFAULT 0,
    description TEXT,
    coverImageUrl VARCHAR(500),
    available BOOLEAN DEFAULT true
);

-- Insert Demo Users
INSERT INTO users (name, email, phno, password, role) VALUES
('Admin User', 'admin@elib.com', 9876543210, 'admin123', 'admin'),
('John Doe', 'john@elib.com', 9123456789, 'password123', 'customer'),
('Jane Smith', 'jane@elib.com', 9234567890, 'password123', 'customer'),
('Robert Johnson', 'robert@elib.com', 9345678901, 'password123', 'customer'),
('Sarah Williams', 'sarah@elib.com', 9456789012, 'password123', 'customer');

-- Insert Demo Books
INSERT INTO books (id, name, author, publisher, quantity, description, available) VALUES
('B001', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 5, 'A classic novel set in the Jazz Age, exploring themes of wealth, love, and the American Dream.', true),
('B002', 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott', 8, 'A gripping tale of racial injustice and childhood innocence in the American South.', true),
('B003', '1984', 'George Orwell', 'Secker & Warburg', 3, 'A dystopian novel depicting a totalitarian state and surveillance society.', true),
('B004', 'Pride and Prejudice', 'Jane Austen', 'T. Egerton', 6, 'A romantic novel about Elizabeth Bennet navigating love and social class in Regency England.', true),
('B005', 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 4, 'A coming-of-age story following Holden Caulfield through New York City.', true),
('B006', 'Wuthering Heights', 'Emily Bronte', 'Thomas Cautley Newby', 2, 'A passionate and dark romance set in the Yorkshire moors.', true),
('B007', 'Jane Eyre', 'Charlotte Bronte', 'Smith, Elder & Co', 5, 'A Gothic romance following the life of an orphaned governess.', true),
('B008', 'The Hobbit', 'J.R.R. Tolkien', 'Allen & Unwin', 7, 'An adventure fantasy about a hobbit named Bilbo Baggins on a quest for treasure.', true),
('B009', 'The Lord of the Rings', 'J.R.R. Tolkien', 'Allen & Unwin', 0, 'An epic fantasy trilogy about the journey to destroy the One Ring.', false),
('B010', 'Harry Potter and the Philosophers Stone', 'J.K. Rowling', 'Bloomsbury', 9, 'The first book in the Harry Potter series about a young wizard discovering his powers.', true),
('B011', 'The Chronicles of Narnia', 'C.S. Lewis', 'Geoffrey Bles', 6, 'A series of fantasy novels set in the magical land of Narnia.', true),
('B012', 'Moby Dick', 'Herman Melville', 'Richard Bentley', 3, 'An epic tale of Captain Ahab pursuit of the white whale.', true);

-- Create Borrowings Table
CREATE TABLE IF NOT EXISTS borrowings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    book_id VARCHAR(50) NOT NULL,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    fine DECIMAL(10, 2) DEFAULT 0.0,
    status VARCHAR(20) DEFAULT 'BORROWED',
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Insert Demo Borrowings
INSERT INTO borrowings (user_id, book_id, borrow_date, due_date, return_date, status) VALUES
(2, 'B001', DATE_SUB(CURDATE(), INTERVAL 10 DAY), DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, 'BORROWED'),
(2, 'B002', DATE_SUB(CURDATE(), INTERVAL 5 DAY), DATE_ADD(CURDATE(), INTERVAL 2 DAY), NULL, 'BORROWED'),
(3, 'B003', DATE_SUB(CURDATE(), INTERVAL 15 DAY), DATE_SUB(CURDATE(), INTERVAL 8 DAY), DATE_SUB(CURDATE(), INTERVAL 5 DAY), 'RETURNED'),
(4, 'B004', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 7 DAY), NULL, 'BORROWED');

CREATE TABLE IF NOT EXISTS borrowings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    book_id VARCHAR(50) NOT NULL,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    fine DECIMAL(10, 2) DEFAULT 0.0,
    status VARCHAR(20) DEFAULT 'BORROWED',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
);