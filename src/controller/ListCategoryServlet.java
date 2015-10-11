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

import model.bean.DANHMUC;
import model.bo.ListCategoryBO;

/**
 * Servlet implementation class ListCategoryServlet
 */
@WebServlet("/admin/ListCategoryServlet")
public class ListCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListCategoryServlet() {
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
		
		String resultInsert =(String)request.getAttribute("resultInsert");
		String resultUpdate = (String)request.getAttribute("resultUpdate");
		String resultDelete =(String)request.getAttribute("resultDelete");
		String resultRestore = (String)request.getAttribute("result_Restore");
		ListCategoryBO listCategory = new ListCategoryBO();
		
		
		ArrayList<DANHMUC> category_after_search = (ArrayList<DANHMUC>)request.getAttribute("categorys");
		String button = (String)request.getAttribute("button");
		String pageNavSearch = (String)request.getAttribute("pageNavSearch");
		
		//Nhận lại kết quả thay đổi hiển thị
		String resultChangeShowed =(String)request.getAttribute("resultChangeShowed");
		//đếm số danh mục được hiển thị trên thanh menu
		int countCategoryShowed = listCategory.countCategoryShowed();
		//Danh mục hiển thị lên thanh menu
		ArrayList<DANHMUC> listCategoryShowed = listCategory.getCategoryShowed();
		
		//gởi số danh mục
		request.setAttribute("countCategoryShowed", countCategoryShowed);
		//gởi các danh mục được hiển thị
		request.setAttribute("listCategoryShowed", listCategoryShowed);
		
		//gởi kết quả thay đổi hiển thị
		request.setAttribute("resultChangeShowed",resultChangeShowed);
			
		request.setAttribute("resultInsert", resultInsert);
		request.setAttribute("resultUpdate", resultUpdate);
		request.setAttribute("resultDelete", resultDelete);
		request.setAttribute("resultRestore", resultRestore);
		
		if(category_after_search!=null){			
		request.setAttribute("category_after_search", category_after_search);
		request.setAttribute("button",button);
		request.setAttribute("pageNavSearch", pageNavSearch);
		}else{
			int page = 1;
			listCategory.setMenu(10, 5);
			try {
				page = Integer.parseInt(request.getParameter("page"));
			} catch (NumberFormatException e) {
				page = 1;
			}
			ArrayList<DANHMUC> category = listCategory.getCategory(page);
			String pageNav = listCategory.getMenuPhanTrang();
			
			request.setAttribute("category", category);
			request.setAttribute("pageNav", pageNav);	
		}
		RequestDispatcher requestDis_listCategory = request.getRequestDispatcher("Category.jsp");
		listCategory.closeConnection();
		requestDis_listCategory.forward(request, response);
	}else{
		RequestDispatcher requestDis_listCategory = request.getRequestDispatcher("Login.jsp");
		requestDis_listCategory.forward(request, response);
	}
	}
	
}
