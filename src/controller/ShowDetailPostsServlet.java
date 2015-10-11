package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.BAIVIET;
import model.bean.LICHSU;
import model.bo.ListStatusHistoryBO;
import model.bo.ShowAdminEditPostsBO;

/**
 * Servlet implementation class ShowDetailPostsServlet
 */
@WebServlet("/admin/ShowDetailPostsServlet")
public class ShowDetailPostsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowDetailPostsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		//Check session exist
				HttpSession session_user = request.getSession();
				String username =(String)session_user.getAttribute("username");	
			
				if(username!=null){
		
		String idPost = request.getParameter("id");
		String id =(String)request.getAttribute("idPost");
		String resultTranslate =(String)request.getAttribute("resultTranslate");
		String resultSave = (String)request.getAttribute("resultSave");
		String resultSend =(String)request.getAttribute("resultSend");
		
		if(id!=null) idPost = id;
		if (idPost == null) {
			response.sendRedirect("ListPostsServlet");
		} else {
			
			
			ShowAdminEditPostsBO editPosts = new ShowAdminEditPostsBO();
			ListStatusHistoryBO listStatus = new ListStatusHistoryBO();
			
			LICHSU history = listStatus.getStatus(idPost);

			BAIVIET post = editPosts.post(idPost);
			request.setAttribute("resultSend", resultSend);
			request.setAttribute("resultSave", resultSave);
			request.setAttribute("resultTranslate", resultTranslate);
			request.setAttribute("post", post);
			request.setAttribute("history", history);
			RequestDispatcher requestDis_editPost = request
					.getRequestDispatcher("DetailPosts.jsp");

			editPosts.closeConnection();
			listStatus.closeConnection();
			
			requestDis_editPost.forward(request, response);

		}
	}else{
		RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
		dispatcher.forward(request, response);
	}
	}

}
