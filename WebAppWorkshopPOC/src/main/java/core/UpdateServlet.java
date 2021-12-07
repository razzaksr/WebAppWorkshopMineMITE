package core;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
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
		String a=request.getParameter("regno");
		String b=request.getParameter("name");
		String c=request.getParameter("gender");
		String d=request.getParameter("dept");
		String e=request.getParameter("batch");
		String f=request.getParameter("contact");
		String g=request.getParameter("email");
		String h=request.getParameter("address");
		String i=request.getParameter("cgpa");
		String j=request.getParameter("hsc");
		String k=request.getParameter("diploma");
		String l=request.getParameter("sslc");
		String m=request.getParameter("interest");
		String n=request.getParameter("skills");
		String o=request.getParameter("placed");
		String p=request.getParameter("status");
		
		System.out.println(h);
		
		
		//conversion based on type
		long reg=Long.parseLong(a);
		int year=Integer.parseInt(e);
		long cont=Long.parseLong(f);
		double cg=Double.parseDouble(i);
		double hs=Double.parseDouble(j);
		double dip=Double.parseDouble(k);
		double ss=Double.parseDouble(l);
		
		
		// db connection
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/place_buddy","root","");
			String qry="update candidates set regno=?,name=?,gender=?,dept=?,batch=?,contact=?,email=?,address=?,cgpa=?,hsc=?,diploma=?,sslc=?,skills=?,career=?,placed=?,status=? where regno=?";
			PreparedStatement ps=con.prepareStatement(qry);
			ps.setLong(1, reg);ps.setString(2, b);ps.setString(3, c);
			ps.setString(4, d);ps.setInt(5,year);ps.setLong(6, cont);ps.setString(7, g);
			ps.setString(8, h);ps.setDouble(9, cg);ps.setDouble(10, hs);ps.setDouble(11, dip);
			ps.setDouble(12, ss);ps.setString(13, n);ps.setString(14, m);
			ps.setString(15, o);ps.setString(16, p);ps.setLong(17, reg);
			int res=ps.executeUpdate();
			
			RequestDispatcher dis=request.getRequestDispatcher("list.jsp");
			if(res != 0)
			{
				request.setAttribute("info", "Candidate "+b+" updated");
				new ListServlet().doGet(request, response);
			}
			else
			{
				request.setAttribute("info", "Candidate "+b+" not updated");
			}
			dis.forward(request, response);
			
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}
