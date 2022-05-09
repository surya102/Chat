import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class connect2 {
	private String url="jdbc:postgresql://localhost:5432/tb";
	private String user="postgres";
	private String pass="sathya2005";
	public void loadDriver() {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Connection getConnection() {
		Connection c=null;
		try { c=DriverManager.getConnection(url,user,pass); }
		catch(Exception e) {e.printStackTrace();}
		return c;
	}
	public String insert(loaddata mem) {
		loadDriver();
		String res="";
		Connection c=getConnection();
		try {
			String check="select username,password from userDb where username=? and password=?";
			PreparedStatement p=c.prepareStatement(check);
			p.setString(1, mem.getusername().trim());
			p.setString(2,mem.getpassword().trim());
			ResultSet r=p.executeQuery();
			if(r.next()) { res="Login is successful"; }
			else { res="Login is unsuccessful"; }
		}
		catch(Exception e) {
			e.printStackTrace();
			res="Login is unsucessful";
		}
		return res;
	}
}
