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
<<<<<<< HEAD
		user.setUserId("140010116047");
		user.setFirstName("Hardip");
		user.setLastName("Raj");
		user.setEnrollmentNumber("140010116047");
		user.setEmailId("hr02@gmail.com");
=======
		user.setUserId("140010116010");
		user.setFirstName("Naitik");
		user.setLastName("Parekh");
		user.setEnrollmentNumber("14");
		user.setEmailId("pn13@gmail.com");
>>>>>>> 4a0dfd718f525ce2728a1399dbfe8065af4bb1fd
		user.setContactNumber("1234567890");
		user.setDepartment("IT");
		user.setUserType("Student");
		
		
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
	}
}
