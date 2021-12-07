package core;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/authenticate")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String a=request.getParameter("user");
		String b=request.getParameter("pass");
		HttpSession session=request.getSession();
		if(a.equalsIgnoreCase("zealous")&&b.equalsIgnoreCase("noonstack"))
		{
			RequestDispatcher dis=request.getRequestDispatcher("home.jsp");
			session.setAttribute("logged", a);
			dis.forward(request, response);
		}
		else
		{
			RequestDispatcher di=request.getRequestDispatcher("index.jsp");
			request.setAttribute("info", "Invalid credentials");
			di.forward(request, response);
		}
	}

}
