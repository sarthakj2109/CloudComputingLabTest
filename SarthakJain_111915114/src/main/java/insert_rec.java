import java.sql.*;
public class insert_rec
{

	String sql="insert into emp_sarthak_111915114 (empid,pwd,firstname,lastname,dob,contact)"+" values (?,?,?,?,?,?)";
	String url = "jdbc:mysql://localhost:3306/sarthakjain?autoReconnect=true&useSSL=false";
	String username="root";
	String password = "sarthak";
	public boolean insert(String empid, String pwd, String fname, String lname, String dob, String contact) {
		try
		{
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
    		st.setString (1, empid);
    		st.setString (2, pwd);
    		st.setString (3, fname);
    		st.setString (4, lname);
    		st.setString (5, dob);
    		st.setString (6, contact);
    	    
    		st.execute();
      
      con.close();
      return true;
    }
    catch (Exception e)
    {
      System.err.println("Got an exception!");
      System.err.println(e.getMessage());
      return false;
    }
  }
}