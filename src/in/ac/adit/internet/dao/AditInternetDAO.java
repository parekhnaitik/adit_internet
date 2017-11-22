package in.ac.adit.internet.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import in.ac.adit.internet.bean.AdminUser;
import in.ac.adit.internet.bean.InternetUser;
import in.ac.adit.internet.bean.UserDevices;


public class AditInternetDAO {
	static java.sql.Connection connection;
	static java.sql.Statement statement;
	public AditInternetDAO(String db) throws SQLException{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection = DriverManager.getConnection(db, "root", "");
		statement = connection.createStatement();
	}

	public void addUser(InternetUser InternetUser) throws SQLException{
		String query="insert into internet_user (userId, firstName, lastName, enrollmentNumber, emailId, contactNumber, department, userType) values('"+InternetUser.getUserId()+"','"+InternetUser.getFirstName()+"','"+InternetUser.getLastName()+"','"+InternetUser.getEnrollmentNumber()+"','"+InternetUser.getEmailId()+"','"+InternetUser.getContactNumber()+"','"+InternetUser.getDepartment()+"','"+InternetUser.getUserType()+"');";
		statement.execute(query);
	}
	
	public void addDevice(UserDevices device) throws SQLException{
		String query="insert into user_devices (userId, startDate, validity, endDate, deviceType, macAddress, ipAddress) values('"+device.getUserId()+"','"+device.getStartDate().toString()+"','"+device.getValidity()+"','"+device.getEndDate().toString()+"','"+device.getDeviceType()+"','"+device.getMacAddress()+"','"+device.getIpAddress()+"');";
		statement.execute(query);
	}
	
	public ResultSet getDevice(String userID) throws SQLException{
		String query="select * from user_devices where userId='"+userID+"';";
		ResultSet rs = null;
		try {
			rs = statement.executeQuery(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	
	
	public boolean loginAuth(AdminUser aUser) {
		String query = "select * from admin_user where username='"+aUser.getUsername()+"' and password='"+aUser.getPassword()+"';";
		ResultSet rs = null;
		try {
			rs = statement.executeQuery(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(rs.next())
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public ResultSet getActiveUser(){
		String query = "select * from internet_user;";
		ResultSet rs = null;
		try {
			rs = statement.executeQuery(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet getUser(String userID){
		String query = "select * from internet_user where userId='"+userID+"';";
		ResultSet rs = null;
		try {
			rs = statement.executeQuery(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
//	public boolean isAuthenticate(String username, String password){
//		String query="select * from user where username='"+username+"' and password='"+password+"';";
//		ResultSet rs=null;
//		try {
//			rs = statement.executeQuery(query);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		try {
//			if(rs.next())
//				return true;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return false;
//	}
	public void finalize(){
		System.out.println("DEstroyed!!");
		try {
			this.connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


}
