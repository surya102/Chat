import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class connect {
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
		try {
			c=DriverManager.getConnection(url,user,pass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	public String insert(member member) {
		loadDriver();
		Connection c=getConnection();
		String res="data entered successfully";
		String sql="insert into userDb values(?,?,?,?,?)";
		try {
			String ebd="select username from userDb where username=?";
			PreparedStatement pst=c.prepareStatement(ebd);
			pst.setString(1, member.getfname());
			ResultSet k=pst.executeQuery();
			int there=1;
			if(k.next()) {
				there=0;
			}
			if(there==1) {
				try {
					PreparedStatement p=c.prepareStatement(sql);
					p.setString(1, member.getName());
					p.setString(2, member.getfname());
					p.setString(3,member.getpass());
					p.setString(4, member.getemail());
					p.setString(5, member.getphone());
					p.executeUpdate();
			//System.out.println(member.getName());
		        }
				catch(Exception e) {
					e.printStackTrace();
					res="not entered succesfully";
				}
			}
			else {
				res="username already used type new username";
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			res="not entered succesfully";
		    }
		return res;
	}
}
