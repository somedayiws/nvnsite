package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
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
		request.setCharacterEncoding("UTF-8");
		String idPost = request.getParameter("id");		
		if (idPost == null) {
			response.sendRedirect("ListPostsServlet");
		} else {
			
			
			ShowAdminEditPostsBO editPosts = new ShowAdminEditPostsBO();
			ListStatusHistoryBO listStatus = new ListStatusHistoryBO();
			
			
			String status = listStatus.getStatus(idPost);

			// System.out.println("id danh muc: "+post.getDanhMuc().getIdDanhMuc());
			
			BAIVIET post = editPosts.post(idPost);
			
			request.setAttribute("post", post);
			request.setAttribute("status", status);
			RequestDispatcher requestDis_editPost = request
					.getRequestDispatcher("DetailPosts.jsp");

			requestDis_editPost.forward(request, response);

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response, String idPost,String result)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("iddetailPost: "+idPost);
		System.out.println("resultDetailPost: "+result);
		request.setCharacterEncoding("UTF-8");

		
	}

}
