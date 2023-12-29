package greensupermarket.model;

public class UserRegistration {
	int id;
	String name;
	String email;
	String password;
	String address;
	String phonenumber;
	
	
	public UserRegistration() {
		
	}


	public UserRegistration(int id, String name, String email, String password, String address, String phonenumber) {
		
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.address = address;
		this.phonenumber = phonenumber;
	}


	public UserRegistration(String name, String email, String password, String address, String phonenumber) {
		
		this.name = name;
		this.email = email;
		this.password = password;
		this.address = address;
		this.phonenumber = phonenumber;
	}

	


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhonenumber() {
		return phonenumber;
	}


	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}


	
	

	
	
	
	
	
	
	
	 
	
	

}
