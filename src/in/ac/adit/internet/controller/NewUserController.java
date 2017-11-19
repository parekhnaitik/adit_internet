package in.ac.adit.internet.controller;

import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
		user.setUserId("14001011601");
		user.setFirstName("Naitik");
		user.setLastName("Parekh");
		user.setEnrollmentNumber("14");
		user.setEmailId("pn13@gmail.com");
		user.setContactNumber("1234567890");
		user.setDepartment("IT");
		user.setUserType("Student");
		
		
		ServletContext context = getServletContext();
		String db=context.getInitParameter("db");
		
		try {
			dao = new AditInternetDAO(db);
			dao.addUser(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
