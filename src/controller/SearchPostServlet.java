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
import model.bo.SearchPostBO;

/**
 * Servlet implementation class SearchPostServlet
 */
@WebServlet("/admin/SearchPostServlet")
public class SearchPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPostServlet() {
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
		
		String stringFind;
		//Lấy loại tìm kiếm và nội dung tìm kiếm từ form
		String typeFind = request.getParameter("typeFind");
		String stringFindText = request.getParameter("stringFind");
		
		
		
		String stringFindCategory = request.getParameter("stringFindCategory");
		String stringFindAccount = request.getParameter("stringFindAccount");
		
		System.out.println("stringFindText: "+stringFindText);
		System.out.println("stringFindCategory: "+stringFindCategory);
		System.out.println("stringFindAccount: "+stringFindAccount);
		if(stringFindCategory!=null && !stringFindCategory.equals("0")){
			stringFind = stringFindCategory;
		}
		else if(stringFindAccount!=null && !stringFindAccount.equals("0")){
			stringFind = stringFindAccount;
		}
		else{
			stringFind = stringFindText;
		}
		SearchPostBO searchPostBo = new SearchPostBO();
		ListAccountBO listaccount  = new ListAccountBO();	
		ListCategoryBO listcategory = new ListCategoryBO();	
		
		int page = 1;
		searchPostBo.setMenu(10, 5);
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
		
	//	System.out.println("pageSearch: "+page);
		ArrayList<BAIVIET> posts = searchPostBo.searchPost(typeFind, stringFind,page);
		
		//System.out.println("post[0]: "+posts.get(0).getIdBaiViet());
		
//		for(int i=0;i<posts.size();i++){
//			System.out.println("post["+i+"]: "+posts.get(i).getIdBaiViet());
//		}
		TAIKHOAN[] account = listaccount.getDataAccountInfor(0,listaccount.totalRecord(),"all");
		ArrayList<DANHMUC> category = listcategory.getCategory(-1);
		String pageNav = searchPostBo.getMenuPhanTrang();		
		
		
		request.setAttribute("pageNav", pageNav);
		request.setAttribute("posts", posts);
		request.setAttribute("account", account);
		request.setAttribute("category", category);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchPosts.jsp");
		requestDispatcher.forward(request, response);
	}

}