package controller;

import java.io.IOException;

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
import model.bo.ListPostsBO;

/**
 * Servlet implementation class ListPostsServlet
 */
@WebServlet("/admin/ListPostsServlet")
public class ListPostsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListPostsServlet() {
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
		ListPostsBO listPost = new ListPostsBO();
		ListCategoryBO listcategory = new ListCategoryBO();
		ListAccountBO listaccount  = new ListAccountBO();
		
		BAIVIET[] posts = listPost.getPosts();
		DANHMUC[] category = listcategory.getCategory();
		TAIKHOAN[] account = listaccount.getDataAccountInfor();
		String resultEdit = (String)request.getAttribute("resultEdit");
		
		request.setAttribute("posts", posts);
		request.setAttribute("category", category);
		request.setAttribute("account", account);
		request.setAttribute("resultEdit", resultEdit);
		RequestDispatcher requestDis_posts = request.getRequestDispatcher("ListPosts.jsp");
		requestDis_posts.forward(request, response);
		
	}

}
