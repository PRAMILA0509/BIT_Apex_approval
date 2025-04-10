USE bit_apex_approval;

CREATE TABLE users(
faculty_id VARCHAR(20) PRIMARY KEY,
faculty_name VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
department VARCHAR(20) NOT NULL,
password VARCHAR(50) NOT NULL
);

CREATE TABLE forwarders (
    forwarder_id VARCHAR(20) PRIMARY KEY,
    department VARCHAR(100),
    FOREIGN KEY (forwarder_id) REFERENCES users(faculty_id)
);

CREATE TABLE admins (
    admin_id VARCHAR(20) PRIMARY KEY,
    admin_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    designation ENUM('Dean', 'Principal', 'IQAC') NOT NULL
);

CREATE TABLE requests (
    request_id VARCHAR(30) PRIMARY KEY,
    faculty_id VARCHAR(20),
    request_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(50),
    other_category TEXT,
    accommodation BOOLEAN DEFAULT FALSE,
    vehicle BOOLEAN DEFAULT FALSE,
    food BOOLEAN DEFAULT FALSE,
    na BOOLEAN DEFAULT FALSE,
    status ENUM('Pending', 'Forwarded', 'Approved', 'Rejected') DEFAULT 'Pending',
    remarks TEXT,
    FOREIGN KEY (faculty_id) REFERENCES users(faculty_id)
);




