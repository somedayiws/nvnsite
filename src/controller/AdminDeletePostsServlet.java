package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.AdminDeletePostsBO;

/**
 * Servlet implementation class AdminDeletePostsServlet
 */
@WebServlet("/admin/AdminDeletePostsServlet")
public class AdminDeletePostsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeletePostsServlet() {
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
		String idPost =  request.getParameter("Idposts");
				
		String resultDelete;
		AdminDeletePostsBO admindeletePost = new AdminDeletePostsBO();
		
		if(admindeletePost.deletePost(idPost)){
			resultDelete = "Xóa bài viết thành công - 記事を削除することができた。";
		}
		else{
			resultDelete = "Xóa bài viết thất bại - 記事を削除することができない。";
		}
				
		request.setAttribute("resultDelete", resultDelete);
		RequestDispatcher requestDis_delete = request.getRequestDispatcher("ListPostsServlet");
		admindeletePost.closeConnection();
		requestDis_delete.forward(request, response);
	}

}
