import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class insert_sal {
		String sql="insert into salary_sarthak_111915114 (empid,jobrole,monthly_sal,yearly_bonus)"+" values (?,?,?,?)";
		String url = "jdbc:mysql://localhost:3306/sarthakjain?autoReconnect=true&useSSL=false";
		String username="root";
		String password = "sarthak";
		public boolean insert(String empid, String job, String msal, String bonus) {
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
	    		st.setString (2, job);
	    		st.setString (3, msal);
	    		st.setString (4, bonus);
	    		
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
