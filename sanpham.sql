use sanpham;

create table productlines(
	productLine int(100) auto_increment primary key,
    textDescription varchar(250) not null,
    htmlDescription varchar(250) default null,
    image varchar(250) default null
);

create table products(
	productCode int (10) auto_increment primary key,
    productName varchar(250) not null,
    productLine int(100) default null,
    productScale varchar(250) default null,
    productVendor varchar(250) default null,
    productDescription varchar(250) default null,
    quantityInStock int (20) default null,
    buyPrice decimal(8, 3) default null,
    MSRP varchar(250),
    foreign key (productLine) references productLines(productLine) on delete cascade on update cascade
);

create table offices(
	officeCode int(10) auto_increment primary key,
    city varchar(250) not null,
    phone int(11) default null,
    addressLine1 varchar(250),
    addressLine2 varchar(250),
    state varchar(250) default null,
    postalCode int(10) default null,
    territory varchar(250) default null
);

create table employees(
	employeeNumber int(11) auto_increment primary key,
    lastName varchar(250) not null,
    firstName varchar(250) default null,
    extension varchar(250) default null,
    email varchar(250) default null,
    officeCode int(10) default null,
    reportsTo varchar(250) default null,
    jobTitle varchar(250) default null,
    foreign key (officeCode) references offices(officeCode) on delete cascade on update cascade
);

create table customers(
	customerNumber int(10) auto_increment primary key,
    customerName varchar(250) not null,
    contactLastName varchar(250) not null,
    contactFirstName varchar(250) default null,
    phone int(11) not null,
    addressLine1 varchar(250),
    addressLine2 varchar(250),
    city varchar(250) not null,
    state varchar(250) default null,
    postalCode int not null,
    country varchar(250) not null,
    salesRepEmployeeNumber int(11) default null,
    creditLimit decimal(8, 2) default null,
    foreign key (salesRepEmployeeNumber) references employees(employeeNumber) on delete cascade on update cascade
);

create table payments(
	customerNumber int(11),
    checkNumber int(11) auto_increment primary key,
    paymentDate date default null,
    amount int default null,
    foreign key(customerNumber) references customers(customerNumber) on delete cascade on update cascade
);

create table orders(
	orderNumber int(11) auto_increment primary key,
    orderDate date,
    requireDate date,
    shippedDate date,
    statuses varchar(250) default null,
    comments varchar(250) default null,
    customerNumber int(10) default null,
    foreign key (customerNumber) references customers(customerNumber)
);

create table oderdetails(
	orderNumber int(11),
    productCode int (10),
    quantityOrdered int default null,
    priceEach decimal(8, 2) default null,
    orderLineNumber int,
    foreign key(orderNumber) references orders(orderNumber) on delete cascade on update cascade,
	foreign key(productCode) references products(productCode) on delete cascade on update cascade
);

/*
A) Using the MySQL SELECT statement to retrieve data from a single
column example
*/
SELECT lastName FROM employees;

/*
B) Using the MySQL SELECT statement to query data from multiple
columns example
*/
SELECT lastName, firstName, jobTitle FROM employees;

/*
C) Using the MySQL SELECT statement to retrieve data from all
columns example
*/
SELECT employeeNumber, email, officeCode, reportsTo, jobTitle FROM employees;

SELECT * FROM employees;

/*
MySQL INSERT examples
*/
use sanpham;
CREATE TABLE if not exists tasks (
 task_id INT AUTO_INCREMENT primary key,
 title VARCHAR(255) NOT NULL,
 start_date DATE,
 due_date DATE,
 priority TINYINT NOT NULL DEFAULT 3,
 description TEXT
);

/*
1) MySQL INSERT – simple INSERT example
*/
insert into tasks(title,priority) values ('Learn MySQL INSERT Statement',1);
select * from tasks;

/*
2) MySQL INSERT – Inserting rows using default value example
*/
insert into tasks(title,priority) values ('Understanding DEFAULT keyword in INSERT statement', default);

select * from tasks;

/*
3)MySQL INSERT – Inserting dates into the table example
*/
insert into tasks(title, start_date, due_date) values ('Insert date into table','2018-01-09','2018-09-15');
insert into tasks(title,start_date,due_date) values ('Use current date for the task',CURRENT_DATE(),CURRENT_DATE());
select * from tasks;

/*
4) MySQL INSERT – Inserting multiple rows example
*/
insert into tasks(title, priority) values ('My first task', 1), ('It is the second task',2), ('This is the third task of the week',3);
select * from tasks;


