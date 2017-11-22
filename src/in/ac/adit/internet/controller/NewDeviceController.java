package in.ac.adit.internet.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

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
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		LocalDate ld = new LocalDate();
		
		device.setUserId(request.getParameter("inputUserId"));
		device.setMacAddress(request.getParameter("inputMAC"));
		device.setIpAddress(request.getParameter("inputIP"));
		device.setDeviceType(request.getParameter("inputDeviceType"));
		device.setValidity(Integer.parseInt(request.getParameter("inputValidity")));
//		try {
//			device.setStartDate(sdf.format(sdf.parse(request.getParameter("inputStartDate"))));
//			calendar.setTime(sdf.parse(device.getStartDate())); // parsed date and setting to calendar
//			calendar.add(Calendar.DATE, device.getValidity());
//			device.setEndDate(sdf.format(calendar.getTime()));
//		} catch (ParseException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		device.setStartDate(LocalDate.parse(request.getParameter("inputStartDate")).format(dtf));
		device.setEndDate(LocalDate.parse(device.getStartDate()).plusDays(device.getValidity()).format(dtf));
		
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