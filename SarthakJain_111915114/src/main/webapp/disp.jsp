<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%
String id = request.getParameter("emp_id");

String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/sarthakjain?autoReconnect=true&useSSL=false";
String username="root";
String password = "sarthak";
String sql ="select * from salary_sarthak_111915114 where empid=?";

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

<h1>Data present in Database</h1>
<table border="1">
<tr>
<td>Employee ID</td>
<td>Job Role</td>
<td>Monthly Salary</td>
<td>Yearly Bonus</td>
<td>Annual Salary</td>

</tr>
<%
try{
connection = DriverManager.getConnection(url, username, password);
statement= connection.prepareStatement(sql);
statement.setString(1,id);
resultSet = statement.executeQuery();
while(resultSet.next()){
	String eid=resultSet.getString("empid"); 
	String job=resultSet.getString("jobrole");
	int ms=resultSet.getInt("monthly_sal");
	int b=resultSet.getInt("yearly_bonus");
	int tot=(ms*12)+b;
%>
<tr>
<td><%=eid %></td>
<td><%=job %></td>
<td><%=ms%></td>
<td><%=b %></td>
<td><%=tot %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table> 

</body>
</html>