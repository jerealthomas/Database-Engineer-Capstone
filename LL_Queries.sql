# Task 1
CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, Cost
FROM orders
WHERE Quantity > 2;

# Task 2
SELECT Customer.CustomerID, Customer.FullName, Orders.OrderID, Orders.TotalCost, Menu.Name, Menu.Description
FROM Customer INNER JOIN Orders 
ON Customer.CustomerID = Orders.customer_customerID
INNER JOIN menus ON orders.MenuID = Menu.MenuID 
INNER JOIN Menu ON Menu.MenuID = Menu.MenuID WHERE Cost > 150  ORDER BY Cost;

# Task 3
CREATE PROCEDURE GetMaxQuantity()
SELECT max(quantity) AS "Max Quantity in Order" FROM Orders;

# Task 4
CREATE PROCEDURE MakeBooking(booking_id INT, customer_id INT, table_no int, booking_date date)
BEGIN
	INSERT INTO Bookings (BookingID, Date, TableNumber, CustomerID) VALUES (booking_id, booking_date, table_no, customer_id);
	SELECT "New booking added" AS "Confirmation";
END

CREATE PROCEDURE CheckBooking(booking_date DATE, table_number INT)
BEGIN
	DECLARE bookedTable INT DEFAULT 0;
	SELECT COUNT(bookedTable)
		INTO bookedTable
		FROM Bookings WHERE BookingDate = booking_date and TableNumber = table_number;
		IF bookedTable > 0 THEN
			SELECT CONCAT( "Table", table_number, "is already booked") AS "Booking status";
		ELSE 
			SELECT CONCAT( "Table", table_number, "is not booked") AS "Booking status";
		END IF;
END

CREATE DEFINER='admin1'@'%' PROCEDURE UpdateBooking(booking_id INT, booking_date DATE)
BEGIN
	UPDATE bookings SET BookingDate = booking_date WHERE BookingID = booking_id; 
	SELECT CONCAT("Booking", booking_id, "updated") AS "Confirmation";
END