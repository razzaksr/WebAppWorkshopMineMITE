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
 * Servlet implementation class CorporateEnroll
 */
@WebServlet("/corpfeed")
public class CorporateEnroll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CorporateEnroll() {
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
		String org=request.getParameter("org");
		String date=request.getParameter("date");
		int req=Integer.parseInt(request.getParameter("required"));
		String role=request.getParameter("role");
		double sal=Double.parseDouble(request.getParameter("salary"));
		// db connection
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/place_buddy","root","");
					String qry="insert into companies(org,date,required,role,salary) value(?,?,?,?,?)";
					PreparedStatement ps=con.prepareStatement(qry);
					ps.setString(1, org);ps.setString(2, date);
					ps.setInt(3, req);ps.setString(4, role);
					ps.setDouble(5, sal);
					
					int res=ps.executeUpdate();
					
					RequestDispatcher dis=request.getRequestDispatcher("corphome.jsp");
					if(res != 0)
					{
						request.setAttribute("info", "Corporate "+org+" enrolled");
					}
					else
					{
						request.setAttribute("info", "Corporate "+org+" not enrolled");
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
