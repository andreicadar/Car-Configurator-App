package model;

public class User {

	private String username;
	private int userID;
	private String password;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public User(String username, int userID, String password) {
		super();
		this.username = username;
		this.userID = userID;
		this.password = password;
	}

}
