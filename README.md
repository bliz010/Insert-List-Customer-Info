# Insert-List-Customer-Info
A minimal JSP page that accepts customer info from a form, inserts it into a MySQL table using a prepared statement, 
and then lists all customers.

## Features
- Accepts `Customer_Id`, `FirstName`, `Lastname`, `Email`, `Phone` from a form
- Inserts safely with `PreparedStatement`
- Reads back and displays all rows
- Simple, self-contained JSP for easy demos

Note: This project uses JSP *scriptlets* for simplicity. For production, migrate logic into a 
Servlet/DAO and use JSTL/EL instead of Java in JSPs

## Tech Stack
- **Java** (JDK 17+ recommended)
- **Apache Tomcat 10+**
- **MySQL** 8.x
- **MySQL Connector/J** 8.x (`com.mysql.cj.jdbc.Driver`)

If you place a JSP under `WEB-INF/`, it **cannot be opened directly** by the browser. 
Serve it via a Servlet forward. Public pages go directly under `webapp/`.

---

## Database Setup

**Create database & table** (adjust names as needed):
```sql
