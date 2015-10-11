package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bo.ShowAdminEditPostsBO;

/**
 * Servlet implementation class TranslateServlet
 */
@WebServlet("/admin/TranslateServlet")
public class TranslateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TranslateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("idPost");
		
		ShowAdminEditPostsBO postreturn = new ShowAdminEditPostsBO();
		if(postreturn.checkExist_Post(id)){
		BAIVIET post = postreturn.post(id);
		request.setAttribute("post", post);
		
		/**Check id exist*/
		RequestDispatcher requestDis_translate = request.getRequestDispatcher("Translate.jsp");
		postreturn.closeConnection();
		requestDis_translate.forward(request, response);
		}
		else{
			response.sendRedirect("Error.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
