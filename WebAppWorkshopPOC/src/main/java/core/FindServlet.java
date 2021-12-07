package core;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import core.mod.Candidates;

/**
 * Servlet implementation class FindServlet
 */
@WebServlet("/search")
public class FindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindServlet() {
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
		Vector<Candidates> model=new Vector<Candidates>();// db copy
		String a=request.getParameter("regno");
		String b=request.getParameter("skills");
		String c=request.getParameter("dept");
		String d=request.getParameter("status");
		System.out.println(a+" "+b+" "+c+" "+d);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/place_buddy","root","");
			String qry="";
			PreparedStatement state=null;
			if(a!=""&&b==""&&c.equals("Select One")&&d.equals("Select One"))
			{
				Long no=Long.parseLong(a);
				qry="select * from candidates where regno=?";
				state=con.prepareStatement(qry);
				state.setLong(1, no);
			}
			else if(a==""&&b!=""&&c.equals("Select One")&&d.equals("Select One"))
			{
				qry="select * from candidates where skills like '%"+b+"%'";
				state=con.prepareStatement(qry);
				//state.setString(1, b);
			}
			else if(a==""&&b==""&&!(c.equals("Select One"))&&d.equals("Select One"))
			{
				qry="select * from candidates where dept=?";
				state=con.prepareStatement(qry);
				state.setString(1, c);
			}
			else if(a==""&&b==""&&c.equals("Select One")&&!(d.equals("Select One")))
			{
				qry="select * from candidates where status=?";
				state=con.prepareStatement(qry);
				state.setString(1, d);
			}
			else
			{
				RequestDispatcher req=request.getRequestDispatcher("find.jsp");
				request.setAttribute("info", "search based on any one");
				req.forward(request, response);
			}
			ResultSet rs=state.executeQuery();
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
				model.add(can);
			}
			RequestDispatcher dis=request.getRequestDispatcher("list.jsp");
			request.setAttribute("every", model);
			dis.forward(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
