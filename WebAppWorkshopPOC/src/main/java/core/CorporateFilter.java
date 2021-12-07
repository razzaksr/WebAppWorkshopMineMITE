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

import core.mod.Candidates;
import core.mod.Companies;

/**
 * Servlet implementation class CorporateFilter
 */
@WebServlet("/fetchcorp")
public class CorporateFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CorporateFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String date=request.getParameter("date");
		List<Candidates> all=new Vector<Candidates>();
		Companies com=null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/place_buddy","root","");
			String qry="select * from companies where date=? and taken=0";
			PreparedStatement ps=con.prepareStatement(qry);
			ps.setString(1, date);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				com=new Companies();com.setDate(rs.getDate("date"));com.setOrg(rs.getString("org"));
				com.setRequired(rs.getInt("required"));com.setRole(rs.getString("role"));
				com.setSalary(rs.getDouble("salary"));com.setTaken(rs.getInt("taken"));
			}
			System.out.println("Fetched Skill is "+com.getRole());
			qry="select * from candidates where skills like '%"+com.getRole()+"%'";
			ps=con.prepareStatement(qry);
			rs = ps.executeQuery();
			while(rs.next())
			{
				Candidates can=new Candidates();
				// javaObject.setterMethod(resultSetObj.getType("tableColumnName"))
				can.setRegno(rs.getLong("regno"));
				can.setName(rs.getString("name"));
				can.setAddress(rs.getString("address"));
				can.setBatch(rs.getInt("batch"));
				can.setCareer(rs.getString("career"));
				can.setCgpa(rs.getDouble("cgpa"));
				can.setHsc(rs.getDouble("hsc"));
				can.setDiploma(rs.getDouble("diploma"));
				can.setSslc(rs.getDouble("sslc"));
				can.setContact(rs.getLong("contact"));
				can.setDept(rs.getString("dept"));
				can.setEmail(rs.getString("email"));
				can.setGender(rs.getString("gender"));
				can.setPlaced(rs.getString("placed"));
				can.setSkills(rs.getString("skills"));
				can.setStatus(rs.getString("status"));
				all.add(can);
			}
		}
		catch(ClassNotFoundException ce){}
		catch(SQLException sq){}
		RequestDispatcher dis=request.getRequestDispatcher("filtered.jsp");
		request.setAttribute("one", all);
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
