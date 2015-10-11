package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.DANHMUC;
import model.bo.SearchCategoryBO;

/**
 * Servlet implementation class SearchCategoryServlet
 */
@WebServlet("/admin/SearchCategoryServlet")
public class SearchCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchCategoryServlet() {
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
		
		String typeFind = request.getParameter("typeFind");
		String stringFind = request.getParameter("stringFind");
		String btnFind = request.getParameter("btnFind");
		SearchCategoryBO searchCategory = new SearchCategoryBO();
		int page = 1;
		searchCategory.setMenu(10, 5);
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}

		
		ArrayList<DANHMUC> categorys = searchCategory.selectCategory(typeFind, stringFind,page);

		String pageNav = searchCategory.getMenuPhanTrang();		
		
		
		request.setAttribute("pageNavSearch", pageNav);
		request.setAttribute("categorys", categorys);
		request.setAttribute("button", btnFind);
		RequestDispatcher requestDis_error = request
				.getRequestDispatcher("ListCategoryServlet");
		searchCategory.closeConnection();
		requestDis_error.forward(request, response);
	}

}
