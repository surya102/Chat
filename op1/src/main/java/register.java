import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public register() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nmae=request.getParameter("name");
		String unmae=request.getParameter("uname");
		String pass=request.getParameter("password");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		connect r=new connect();
		member member=new member(nmae,unmae,pass,email,phone);
		String r1=r.insert(member);
		if(r1.equals("data entered successfully")) response.sendRedirect("login.jsp");
		else if(r1.equals("username already used type new username")) {
			response.getWriter().println("username alreay exits");
		    response.sendRedirect("invalidreg.jsp");
		}
		else {
			response.sendRedirect("invalidreg.jsp");
		}
		//doGet(request, response);
	}

}
