package in.ac.adit.internet.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.ac.adit.internet.bean.InternetUser;
import in.ac.adit.internet.dao.AditInternetDAO;

public class NewUserController extends HttpServlet{
	private RequestDispatcher rd = null;
	private AditInternetDAO dao = null;
	
	public void service(HttpServletRequest request, HttpServletResponse response) {
		
		InternetUser user = new InternetUser();
		
		user.setUserId(request.getParameter("inputUserID"));
		user.setFirstName(request.getParameter("inputFirstName"));
		user.setLastName(request.getParameter("inputLastName"));
		user.setEnrollmentNumber(request.getParameter("inputEnrollmentNumber"));
		user.setEmailId(request.getParameter("inputEmail"));
		user.setContactNumber(request.getParameter("inputContactNumber"));
		user.setDepartment(request.getParameter("inputDepartment"));
		user.setUserType(request.getParameter("inputUserType"));
		
		ServletContext context = getServletContext();
		String db=context.getInitParameter("db");
		
		try {
			dao = new AditInternetDAO(db);
			dao.addUser(user);
			
//			dao.finalize();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		rd = request.getRequestDispatcher("home.jsp");
//		ResultSet tableData = dao.getActiveUser();
//		this.getServletConfig().getServletContext().setAttribute("tableData", tableData);
		
		try {
			rd.forward(request,response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
