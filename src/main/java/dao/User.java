package dao;

public class User {
	public String UserID;
	public String UserPassword;
	public String UserName;
	public String UserEmail;
	public String UserPhoneNumber;
	public int	  UserCredit;
	
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	public String getUserPassword() {
		return UserPassword;
	}
	public void setUserPassword(String userPassword) {
		UserPassword = userPassword;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getUserEmail() {
		return UserEmail;
	}
	public void setUserEmail(String userEmail) {
		UserEmail = userEmail;
	}
	public String getUserPhoneNumber() {
		return UserPhoneNumber;
	}
	public void setUserPhoneNumber(String userPhoneNumber) {
		UserPhoneNumber = userPhoneNumber;
	}
	public int getUserCredit() {
		return UserCredit;
	}
	public void setUserCredit(int userCredit) {
		UserCredit = userCredit;
	}
	
	
	
}
