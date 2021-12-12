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
 * Servlet implementation class CorporateUpdate
 */
@WebServlet("/corpupdate")
public class CorporateUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CorporateUpdate() {
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
		int tak=Integer.parseInt(request.getParameter("taken"));
		int req=Integer.parseInt(request.getParameter("required"));
		String role=request.getParameter("role");
		double sal=Double.parseDouble(request.getParameter("salary"));
		// db connection
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/place_buddy","root","");
					String qry="update companies set role=?,required=?,salary=?,taken=? where date=? and org=?";
					PreparedStatement ps=con.prepareStatement(qry);
					ps.setString(6, org);ps.setString(5, date);
					ps.setInt(2, req);ps.setString(1, role);
					ps.setDouble(3, sal);ps.setInt(4, tak);
					
					int res=ps.executeUpdate();
					
					RequestDispatcher dis=request.getRequestDispatcher("corporateList");
					if(res != 0)
					{
						request.setAttribute("info", "Corporate "+org+" updated");
					}
					else
					{
						request.setAttribute("info", "Corporate "+org+" not updated");
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
