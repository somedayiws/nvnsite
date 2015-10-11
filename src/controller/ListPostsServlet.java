package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		//Check session exist
				HttpSession session_user = request.getSession();
				String username =(String)session_user.getAttribute("username");	
			
				if(username!=null){
		
		ListPostsBO listPost = new ListPostsBO();		
		ListAccountBO listaccount  = new ListAccountBO();	
		ListCategoryBO listcategory = new ListCategoryBO();
		int page = 1;
		
		String chon = request.getParameter("view");
		if(chon==null) chon = "all";
		
		listPost.setMenu(10, 5);
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
		
		ArrayList<BAIVIET> posts = listPost.getPosts(page, chon);
		
			
		ArrayList<TAIKHOAN> accounts = listaccount.getDataAccountInfor(0,listaccount.totalRecord(),"all",null);
		ArrayList<DANHMUC> category = listcategory.getCategory(-1);
		String pageNav = listPost.getMenuPhanTrang();		
		
		
		request.setAttribute("pageNav", pageNav);
		request.setAttribute("posts", posts);
		request.setAttribute("accounts", accounts);
		request.setAttribute("category", category);
		RequestDispatcher requestDis_posts = request.getRequestDispatcher("ListPosts.jsp");
		listaccount.closeConnection();
		listcategory.closeConnection();
		listPost.closeConnection();
		
		requestDis_posts.forward(request, response);
		
	}
				else{
					RequestDispatcher requestDis_posts = request.getRequestDispatcher("Login.jsp");
					requestDis_posts.forward(request, response);
				}		
	}
}
