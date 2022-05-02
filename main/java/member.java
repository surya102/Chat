

public class member {
	private String name,fname,pass,email,phone;
	public member() {
		super();
	}
	public member(String name,String fname,String pass,String email,String phone) {
		super();
		this.name = name;
		this.fname= fname;
		this.pass=pass;
		this.email=email;
		this.phone=phone;
	}
	public String getName() {return name; }
	public String getfname() {return fname; }
	public String getpass() {return pass; }
	public String getemail() {return email; }
	public String getphone() {return phone; }
	
}
