package in.ac.adit.internet.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import in.ac.adit.internet.bean.AdminUser;
import in.ac.adit.internet.dao.AditInternetDAO;

public class LoginController extends HttpServlet{

	private RequestDispatcher rd = null;
	private AditInternetDAO dao = null;
	private HttpSession session =null;
	
	public void service(HttpServletRequest request, HttpServletResponse response) {
		AdminUser aUser = new AdminUser();
		aUser.setUsername(request.getParameter("inputEmail"));
		aUser.setPassword(request.getParameter("inputPassword"));
		
		ServletContext context = getServletContext();
		String db=context.getInitParameter("db");
		
		try {
			dao = new AditInternetDAO(db);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(dao.loginAuth(aUser))
		{
			session = request.getSession();
			session.setAttribute("USERNAME", aUser.getUsername());
			rd = request.getRequestDispatcher("home.jsp");
			
//			ResultSet tableData = dao.getActiveUser();
//			this.getServletConfig().getServletContext().setAttribute("tableData", tableData);
		}
		else
		{
			request.setAttribute("ERROR", "Invalid username/password");
			rd = request.getRequestDispatcher("index.jsp");
		}
		
		try {
			rd.forward(request,response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
