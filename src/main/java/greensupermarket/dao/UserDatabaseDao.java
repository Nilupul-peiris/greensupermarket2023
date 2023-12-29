package greensupermarket.dao;
import greensupermarket.connection.DBCon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import greensupermarket.model.UserRegistration;

public class UserDatabaseDao {
    Connection con;

    public UserDatabaseDao(Connection con) throws ClassNotFoundException, SQLException {
        this.con = DBCon.getConnection();
    }

    // For registering a user
    public boolean saveUser(UserRegistration user) {
        boolean set = false;
        try {
            // Insert register data into the database
            String query = "insert into userregistration (name, email, password, address, phonenumber) values(?, ?, ?, ?, ?)";
            PreparedStatement pt = this.con.prepareStatement(query);

            pt.setString(1, user.getName());
            pt.setString(2, user.getEmail());
            pt.setString(3, user.getPassword());
            pt.setString(4, user.getAddress());
            pt.setString(5, user.getPhonenumber());

            int rowsAffected = pt.executeUpdate();

            if (rowsAffected > 0) {
                set = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }
    
    //User login
    public UserRegistration logUser(String email,String password) {
    	UserRegistration user = null;
    	try {
    		
    		String query = "select * from userregistration where email=? and password=?";
    		PreparedStatement pst =this.con.prepareStatement(query);
    		pst.setString(1,email);
    		pst.setString(2, password);
    		
    		ResultSet rs = pst.executeQuery();
    		if(rs.next()) {
    			 user = new UserRegistration();
    			 user.setId(rs.getInt("id"));
    			 user.setEmail(rs.getString("email"));
    			 user.setPassword(rs.getString("password"));
    		}
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return user;
    }
}
