
/* 1. Report:

 How many rows do i have in each table in the database?*/
 SELECT table_name, table_rows
   FROM INFORMATION_SCHEMA.TABLES
   WHERE TABLE_SCHEMA = 'cr09_zage_delivery'
----------------------------------------------------------------------------------------------------------------------

/*2. Report:
   
How many employees do i have with starting Year X*/

SELECT COUNT(employee.employee_id)
FROM employee 
INNER JOIN employee_info ON employee_info.employee_id = employee.employee_id
WHERE YEAR(employee_info.start_date) = 1999 --change year number for desired query--

--And Who are they--
SELECT employee.employee_id, employee.first_name, employee.last_name, employee_info.start_date AS StartDate
FROM employee 
INNER JOIN employee_info ON employee_info.employee_id = employee.employee_id
WHERE YEAR(employee_info.start_date) = 1999 --change year number for desired query--
----------------------------------------------------------------------------------------------------------------------


/*3. Report:
   
Show all processes with timestamp and employee */

SELECT processing.id, processing.type, processing.time, employee.first_name, employee.last_name
FROM processing
INNER JOIN employee ON employee.employee_id = processing.created_by
----------------------------------------------------------------------------------------------------------------------


/*4. Report:
   
Show all packages which are still in delivery */

SELECT processing.id, package.package_id, package.tracking_number, processing.type, processing.time AS Time
from package
INNER JOIN processing ON package_id = p_id
WHERE processing.type = 'DELIVERY_START' AND package.delivery_time IS NULL
----------------------------------------------------------------------------------------------------------------------


/*5. Report:
   
Show all packages which are still in the shop waiting for HANDOUT */

SELECT processing.id, package.package_id, package.tracking_number, processing.type
from package
INNER JOIN processing ON package_id = p_id
WHERE package.delivery_time IS NULL AND processing.type = 'DELIVERY_END'
----------------------------------------------------------------------------------------------------------------------


/*6. Report:
   
Show Full History of each Package including time, employee, location, and Recipient */

SELECT processing.id, package.package_id, package.tracking_number, processing.type, processing.time AS Time, employee.first_name AS EmployeeFirstName, employee.last_name AS EmployeeLastName, location.name AS LocationName, location.street LocationStreet, location.street_nr AS StrNr, location.zip_code AS ZIPCODE, location.city AS CITY, recipient.first_name AS RecipientFirstName, recipient.last_name AS RecipientLastName
from package
INNER JOIN processing ON package_id = p_id
LEFT JOIN location ON location_id = l_id
LEFT JOIN customer AS Sender ON sender_id = Sender.customer_id
INNER JOIN employee ON employee_id = created_by
LEFT JOIN customer AS Recipient ON recipient_id = Recipient.customer_id
----------------------------------------------------------------------------------------------------------------------


