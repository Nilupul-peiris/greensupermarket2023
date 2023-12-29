package greensupermarket.servlet;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import greensupermarket.connection.DBCon;
import greensupermarket.dao.UserDatabaseDao;
import greensupermarket.model.UserRegistration;

@WebServlet("/register-servlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET requests here
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String phonenumber = request.getParameter("phonenumber");

        // Make user object
        UserRegistration userModel = new UserRegistration(name, email, password,address,phonenumber);
        if (phonenumber != null && !phonenumber.isEmpty()) {
            // Proceed with user registration
        } else {
            // Handle case where phonenumber is null or empty
        }


        // Create a database model
        UserDatabaseDao regUser = null;
		try {
			regUser = new UserDatabaseDao(DBCon.getConnection());
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        if (regUser.saveUser(userModel)) {
            response.sendRedirect("Index.jsp");
        } else {
            String errorMessage = "User Available";
            HttpSession regSession = request.getSession();
            regSession.setAttribute("RegError", errorMessage);
            response.sendRedirect("Hompage.jsp");
        }
    }
}
