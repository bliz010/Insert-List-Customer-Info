<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>   
<!DOCTYPE html>


<% 
String Customer_Id = request.getParameter("Customer_Id");
String FirstName = request.getParameter("FirstName");
String Lastname = request.getParameter("Lastname");
String Email = request.getParameter("Email");
String Phone = request.getParameter("Phone");

out.println("Thanks for the data, here is what you entered: <br>");
out.println(Customer_Id + "<br>"); 
out.println(FirstName + " " + Lastname + "<br>");
out.println("Email: " + Email + "<br>");
out.println("Phone: " + Phone + "<br><br>");

%>

<% 
try {
	Connection conn = null;
	PreparedStatement stmt = null;
	
	// load the driver class from the driver.jar (register the driver)
    Class.forName("com.mysql.cj.jdbc.Driver");
	
 	// Establish connection to desired database
    String url = "jdbc:mysql://localhost:3306/${DB_NAME}";
    String username = "db_username";
    String password = "db_password"; 
    conn = DriverManager.getConnection(url, username, password);
	out.println("Connection is successfully made to the database!<br>");
	
	//Create a DB query to execute
	String sql;
    sql = "insert into customer (Customer_Id, firstName, lastName, Email, Phone) values (?, ?, ?, ?, ?)";
    
 	// Create a PreparedStatement to execute the SQL Query
    stmt = conn.prepareStatement(sql);
    stmt.setInt(1, Integer.parseInt(Customer_Id));
    stmt.setString(2, FirstName);
    stmt.setString(3, Lastname);
    stmt.setString(4, Email);
    stmt.setString(5, Phone);

    
 	// Execute statement 
    stmt.executeUpdate();
    out.println("Data is successfully inserted!"); out.println("<br>");

    // verify record was added
    sql = "select Customer_Id, firstName, lastname, Email, Phone FROM customer";;

    stmt = conn.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery();
    if (rs.next() == false){
    	out.println("No records found in the customers table"); out.println("<br>");
    }
    else {
		out.println("Records were found: <br>");
    	do {
    		out.println("ID: " + rs.getInt("Customer_Id") + "<br>");
            out.println("Name: " + rs.getString("FirstName") + " " + rs.getString("Lastname") + "<br>");
            out.println("Email: " + rs.getString("Email") + "<br>");
            out.println("Phone: " + rs.getString("Phone") + "<br><br>");
    	} while (rs.next());
    }
    stmt.close();
    conn.close();
    
} catch(Exception e) {
    System.out.print(e);
    e.printStackTrace();
}
%>