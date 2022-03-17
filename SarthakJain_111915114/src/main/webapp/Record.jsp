<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/sarthakjain?autoReconnect=true&useSSL=false";
String username="root";
String password = "sarthak";
String sql ="select * from emp_sarthak_111915114";

try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Records</title>
</head>
<body>

<h1>Data present in Database</h1>
<table border="1">
<tr>
<td>Employee ID</td>
<td>First name</td>
<td>Last name</td>
<td>DOB</td>
<td>Contact</td>

</tr>
<%
try{
connection = DriverManager.getConnection(url, username, password);
statement=connection.createStatement();
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("empid") %></td>
<td><%=resultSet.getString("firstname") %></td>
<td><%=resultSet.getString("lastname") %></td>
<td><%=resultSet.getString("dob") %></td>
<td><%=resultSet.getString("contact") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table> 

	<form action="disp.jsp" method="post">
		 Enter Employee ID : <input type="text" name="emp_id"><br>
		 <input type="submit" value="Find Details">
	</form>
	
	<form action="Addnewrec.jsp" method="post">
		 <input type="submit" value="Add new record">
	</form>
	
	<form action="Delrec.jsp" method="post">
		 <input type="submit" value="Delete record">
	</form>
	
	<form action="update.jsp" method="post">
		 <input type="submit" value="Update record">
	</form>
</body>
</html>