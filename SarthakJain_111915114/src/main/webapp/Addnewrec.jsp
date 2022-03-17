<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%

String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/sarthakjain?autoReconnect=true&useSSL=false";
String username="root";
String password = "sarthak";
String sql="insert into emp_sarthak_111915114 (empid,pwd,firstname,lastname,dob,contact)"+" values (?,?,?,?,?,?)";

try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
PreparedStatement statement = null;
ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Salary Records</title>
</head>
<body>
<form action="signup" method="post">
		 Employee id : <input type="text" name="empid"><br>
		 Password : <input type="password" name="pwd"><br>
		 First Name : <input type="text" name="fname"><br>
		 Last Name : <input type="text" name="lname"><br>
		 DOB : <input type="text" name="dob"><br>
		 Contact No : <input type="text" name="contact"><br>
		 <input type="submit" value="Signup">
		 
	</form>
<%
try{
connection = DriverManager.getConnection(url, username, password);
statement= connection.prepareStatement(sql);
statement.setString (1, empid);
statement.setString (2, pwd);
statement.setString (3, fname);
statement.setString (4, lname);
statement.setString (5, dob);
statement.setString (6, contact);
resultSet = statement.executeQuery();

%>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>