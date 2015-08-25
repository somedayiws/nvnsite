package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		String resultInsert =(String)request.getAttribute("resultInsert");
		String resultUpdate = (String)request.getAttribute("resultUpdate");
		String resultDelete =(String)request.getAttribute("resultDelete");
		DANHMUC[] category_after_search = (DANHMUC[])request.getAttribute("category");
		String button = (String)request.getAttribute("button");
		
		ListCategoryBO listCategory = new ListCategoryBO();
		
		DANHMUC[] category = listCategory.getCategory();
		
		request.setAttribute("resultInsert", resultInsert);
		request.setAttribute("resultUpdate", resultUpdate);
		request.setAttribute("resultDelete", resultDelete);
		request.setAttribute("category_after_search", category_after_search);
		request.setAttribute("button",button);
		request.setAttribute("category", category);
		RequestDispatcher requestDis_listCategory = request.getRequestDispatcher("Category.jsp");
		requestDis_listCategory.forward(request, response);
	}

}
