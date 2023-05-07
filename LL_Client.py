import mysql.connector as connector
connection = connector.connect(user="mario", password="cuisine")
cursor = connection.cursor()

cursor.execute("USE LL_Database")

join_query = """SELECT Booking.BookingID,Booking.TableNumber, Customer.FullName, Orders.TotalCost FROM Bookings
LEFT JOIN Orders ON Booking.BookingID = Orders.BookingID
LEFT JOIN Customer ON Booking.BookingID = Customer.BookingID
Where Orders.TotalCost > 60"""

cursor.execute(join_query)
results = cursor.fetchall()

print(cursor.column_names)
print(results)