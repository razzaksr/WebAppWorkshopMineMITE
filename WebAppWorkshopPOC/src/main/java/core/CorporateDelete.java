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
 * Servlet implementation class CorporateDelete
 */
@WebServlet("/deletecorp")
public class CorporateDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CorporateDelete() {
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
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/place_buddy","root","");
			String qry="delete from companies where date=? and org=?";
			PreparedStatement ps=con.prepareStatement(qry);
			ps.setString(1, a);ps.setString(2, b);
			int up=ps.executeUpdate();
			RequestDispatcher dis=request.getRequestDispatcher("corporateList");
			if(up!=0)
			{
				request.setAttribute("info", "Corporate deleted");
			}
			else
			{
				request.setAttribute("info", "Corporate couldn't deleted");
			}
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
