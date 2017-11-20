package in.ac.adit.internet.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.ac.adit.internet.bean.InternetUser;
import in.ac.adit.internet.bean.UserDevices;
import in.ac.adit.internet.dao.AditInternetDAO;

public class NewDeviceController extends HttpServlet{
	private RequestDispatcher rd = null;
	private AditInternetDAO dao = null;
	
	public void service(HttpServletRequest request, HttpServletResponse response) {
		
		UserDevices device = new UserDevices();
		
		device.setUserId(request.getParameter("inputUserId"));
		device.setMacAddress(request.getParameter("inputMAC"));
		device.setIpAddress(request.getParameter("inputIP"));
		device.setDeviceType(request.getParameter("inputDeviceType"));
		try {
			device.setStartDate(new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("inputStartDate")));
		} catch (ParseException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		//device.setEndDate(new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("inputEndDate")));
		device.setValidity(Integer.parseInt(request.getParameter("inputValidity")));
		
//		GregorianCalendar cal = new GregorianCalendar();
//		cal.setTime(device.getStartDate());
//		cal.add(Calendar.DATE, device.getValidity());
//		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
//		try {
//			device.setEndDate(df.parse(df.format(cal.getTime())));
//		} catch (ParseException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		
		ServletContext context = getServletContext();
		String db=context.getInitParameter("db");
		
		try {
			dao = new AditInternetDAO(db);
			dao.addDevice(device);
			
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