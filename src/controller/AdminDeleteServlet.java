package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.AdminDeleteBO;

/**
 * Servlet implementation class AdminDeleteServlet
 */
@WebServlet("/admin/AdminDeleteServlet")
public class AdminDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String type = request.getParameter("type");
		
		String resultSubmit;
		String username = request.getParameter("username");
		
		AdminDeleteBO adminDelete = new AdminDeleteBO();
		/**Delete account*/
		if(adminDelete.deleteAccount(username))
		{
			//delete success
			resultSubmit = "Delete success";
		}
		else {
			//delete fail
			resultSubmit = "Delete fail";
		}
		RequestDispatcher dispatcher;
		request.setAttribute("result", resultSubmit);
		if(type.equals("CTV")){
			dispatcher = request.getRequestDispatcher("CTVServlet");
		}
		else{
			dispatcher = request.getRequestDispatcher("ListAccountServlet");
		}
		adminDelete.closeConnection();
		dispatcher.forward(request, response);
	}

}
