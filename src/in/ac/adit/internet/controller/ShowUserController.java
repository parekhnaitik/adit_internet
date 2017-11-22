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
import in.ac.adit.internet.bean.UserDevices;
import in.ac.adit.internet.dao.AditInternetDAO;

public class ShowUserController extends HttpServlet{
	private RequestDispatcher rd = null;
	private AditInternetDAO dao = null;
	
	public void service(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("USERID", request.getParameter("showUser"));
		rd = request.getRequestDispatcher("showUser.jsp");
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
