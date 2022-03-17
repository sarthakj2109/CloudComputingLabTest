import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Login_auth {
	
	String sql="select empid,pwd from emp_sarthak_111915114 where empid=? and pwd=?";
	String url = "jdbc:mysql://localhost:3306/sarthakjain?autoReconnect=true&useSSL=false";
	String username="root";
	String password = "sarthak";
	public boolean check(String emp_id, String pwd) {
	try {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver loaded");
	}
	catch(Exception e) {
		System.out.println(e);
	}
	try {
		Connection con=DriverManager.getConnection(url,username,password);
		System.out.println("connection estab");
		PreparedStatement st= con.prepareStatement(sql);
		st.setString(1,emp_id);
		st.setString(2,pwd);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			System.out.println("Found record");
			return true;
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	System.out.println("Password not found");
		return false;
	}

}
