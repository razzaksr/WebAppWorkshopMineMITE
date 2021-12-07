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

import core.mod.Candidates;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
long reg=Long.parseLong(request.getParameter("id"));
		
		RequestDispatcher dis=request.getRequestDispatcher("list.jsp");
		/*
		 * for(Candidates can:ListServlet.model) { if(can.getRegno()==reg) {
		 * request.setAttribute("single", can); System.out.println(can.getAddress()); }
		 * }
		 */
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/place_buddy","root","");
			String qry="select * from candidates where regno=?";
			PreparedStatement state=con.prepareStatement(qry);
			state.setLong(1, reg);
			ResultSet rs=state.executeQuery();
			if(rs.next())
			{
				String name=rs.getString("name");
				qry="delete from candidates where regno=?";
				state=con.prepareStatement(qry);state.setLong(1, reg);
				int yet=state.executeUpdate();
				if(yet!=0)
				{
					request.setAttribute("info", name+" has deleted");
					new ListServlet().doGet(request, response);
				}
				else
				{
					request.setAttribute("info", name+" cannot be deleted");
				}
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
