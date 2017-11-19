package in.ac.adit.internet.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import in.ac.adit.internet.bean.InternetUser;


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
	


}
