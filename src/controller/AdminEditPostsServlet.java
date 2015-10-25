package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bo.AdminEditPostsBO;

/**
 * Servlet implementation class AdminEditPostsServlet
 */
@WebServlet("/admin/AdminEditPostsServlet")
public class AdminEditPostsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEditPostsServlet() {
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
		String idPost = request.getParameter("IdPost");
		String namePostVi = request.getParameter("namePostVi");
		String namePostJa = request.getParameter("namePostJa");
		String idcategory = request.getParameter("category");
		
		String idaccount = request.getParameter("account");
		String contentVi = request.getParameter("contentVi");
		String contentJa = request.getParameter("contentJa");
		String descriptionVi = request.getParameter("descriptionVi");
		String descriptionJa = request.getParameter("descriptionJa");
		
		String resultEdit;
		BAIVIET post = new BAIVIET();
		
		post.setIdBaiViet(idPost);
		post.setTenBaiVietVi(namePostVi);
		post.setTenBaiVietJa(namePostJa);
		post.setNoiDungVi(contentVi);
		post.setNoiDungJa(contentJa);
		post.setMoTaVi(descriptionVi);
		post.setMoTaJa(descriptionJa);
		/**update posts in database*/
		AdminEditPostsBO adminEditPosts = new AdminEditPostsBO();
		
		if(adminEditPosts.updatePost(post, idcategory, idaccount)){
			resultEdit = "Chỉnh sửa bài viết thành công - 記事が修正できた";
		}
		else{
			resultEdit = "Chỉnh sửa bài viết thất bại - 記事が修正できない。";
		}
		request.setAttribute("resultEdit", resultEdit);
		RequestDispatcher requestDis_edit = request.getRequestDispatcher("ShowAdminEditPostsServlet?idPost="+idPost+"&from=detail");
		adminEditPosts.closeConnection();
		requestDis_edit.forward(request, response);
	}

}
