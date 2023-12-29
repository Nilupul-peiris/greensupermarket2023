package greensupermarket.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import greensupermarket.connection.DBCon;
import greensupermarket.dao.UserDao;
import greensupermarket.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("Login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");
			
			try {
				UserDao udao = new UserDao(DBCon.getConnection());
				User user = udao.userLogin(email, password);
				
				if (user !=null) {
					HttpSession session = request.getSession();
					session.setAttribute("loguser",user);
					request.getSession().setAttribute("auth", user);
					response.sendRedirect("Index.jsp");
					
				}else {
					out.print("User Does Not Exsist");
				}

			} catch (ClassNotFoundException | SQLException e) {
			
				e.printStackTrace();
			}
			
			
		}
			}
		
		
			
	
	}

	


