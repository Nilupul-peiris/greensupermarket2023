package greensupermarket.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import greensupermarket.model.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddToCartservlet
 */
@WebServlet("/add-to-cart")
public class AddToCartservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {
			ArrayList<Cart> cartlist = new ArrayList<>();

			int id = Integer.parseInt(request.getParameter("id"));
			Cart cm = new Cart();
			cm.setId(id);
			cm.setQuantity(1);

			HttpSession session = request.getSession();
			@SuppressWarnings("unchecked")
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

			if (cart_list == null) {
				cartlist.add(cm);
				session.setAttribute("cart-list", cartlist);
				response.sendRedirect("Index.jsp");
			} else {
				cartlist = cart_list;
				boolean exist = false;

				for (Cart c : cart_list) {
					if (c.getId() == id) {
						exist = true;
						out.println(
								"<h3 style='color:crimson; text-align:center'>Item already exists in Cart.<a href='Cart.jsp'>Go to Cart Page</a></h3>");
					}

				}
				if (!exist) {
					cartlist.add(cm);
					response.sendRedirect("Index.jsp");

				}

			}

		}
	}
}