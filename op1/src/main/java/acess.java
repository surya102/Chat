import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/acess")
public class acess extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public acess() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s1=request.getParameter("userid");
		String s2=request.getParameter("pass");
		connect2 r=new connect2();
		loaddata r1=new loaddata(s1,s2);
		String t1=r.insert(r1);
		if(t1=="Login is successful") {
	    HttpSession session=request.getSession();
	    session.setAttribute("name3", s1);
		response.sendRedirect("chat.jsp");}
		else {
			response.sendRedirect("chatact.jsp");		}
	}

}
