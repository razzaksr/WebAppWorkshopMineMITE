package core;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import core.mod.Companies;

/**
 * Servlet implementation class CorporateEdit
 */
@WebServlet("/editcorp")
public class CorporateEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CorporateEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String a=request.getParameter("id");
		String b=request.getParameter("org");
		Companies com=null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/place_buddy","root","");
			String qry="select * from companies where date=? and org=?";
			PreparedStatement ps=con.prepareStatement(qry);
			ps.setString(1, a);ps.setString(2, b);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				com=new Companies();com.setDate(rs.getDate("date"));com.setOrg(rs.getString("org"));
				com.setRequired(rs.getInt("required"));com.setRole(rs.getString("role"));
				com.setSalary(rs.getDouble("salary"));com.setTaken(rs.getInt("taken"));
			}
			RequestDispatcher dis=request.getRequestDispatcher("corpedit.jsp");
			request.setAttribute("one", com);
			dis.forward(request, response);
		}
		catch(ClassNotFoundException ce){}
		catch(SQLException sq){}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
