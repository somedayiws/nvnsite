package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.TAIKHOAN;
import model.bo.ListAccountBO;
import model.bo.ListCategoryBO;
import model.bo.ShowAdminEditPostsBO;

/**
 * Servlet implementation class ShowAdminEditPostsServlet
 */
@WebServlet("/admin/ShowAdminEditPostsServlet")
public class ShowAdminEditPostsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowAdminEditPostsServlet() {
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
		String idpost =request.getParameter("idPost");
		String from = request.getParameter("from");
		
	
		if(idpost==null){
			response.sendRedirect("ListPostsServlet");
		}
		else{
		ListCategoryBO listCategory = new ListCategoryBO();
		ListAccountBO listAccount = new ListAccountBO();
		ShowAdminEditPostsBO editPosts = new ShowAdminEditPostsBO();
		 
		ArrayList<DANHMUC> categorys = listCategory.getCategory(1);
		TAIKHOAN[] account = listAccount.getDataAccountInfor(1);
		BAIVIET post = editPosts.post(idpost);
		
//		System.out.println("id danh muc: "+post.getDanhMuc().getIdDanhMuc());
		request.setAttribute("categorys", categorys);
		request.setAttribute("account", account);
		request.setAttribute("post", post);
		request.setAttribute("from", from);
		RequestDispatcher requestDis_editPost = request.getRequestDispatcher("AdminEditPosts.jsp");
		
		requestDis_editPost.forward(request, response);
		
		
		}
		
		
	}

}
