package core;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import core.mod.Companies;

/**
 * Servlet implementation class CorporateList
 */
@WebServlet("/corporateList")
public class CorporateList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CorporateList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Companies> all=new Vector<Companies>();
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/place_buddy","root","");
			String qry="select * from companies";
			PreparedStatement ps=con.prepareStatement(qry);
			ResultSet rs = ps.executeQuery();
			Companies com=null;
			while(rs.next())
			{
				com=new Companies();com.setDate(rs.getDate("date"));com.setOrg(rs.getString("org"));
				com.setRequired(rs.getInt("required"));com.setRole(rs.getString("role"));
				com.setSalary(rs.getDouble("salary"));com.setTaken(rs.getInt("taken"));
				all.add(com);
			}
		}
		catch(ClassNotFoundException ce){}
		catch(SQLException sq){}
		RequestDispatcher dis=request.getRequestDispatcher("corphome.jsp");
		request.setAttribute("every", all);
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
