package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.DeleteCategoryBO;

/**
 * Servlet implementation class DeleteCategoryServlet
 */
@WebServlet("/admin/DeleteCategoryServlet")
public class DeleteCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCategoryServlet() {
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
		
		String IdCategory =  request.getParameter("IdDanhmuc");
		String resultDelete = null;
		
		DeleteCategoryBO delCategory = new DeleteCategoryBO();
		
		if(delCategory.deleteCategory(IdCategory)){
			//Delete success
			resultDelete = "Delete success";
		}
		else{
			//Delete fail
			resultDelete = "Delete fail";
		}
		 request.setAttribute("resultDelete", resultDelete);
		 RequestDispatcher requsetDis_delete = request.getRequestDispatcher("ListCategoryServlet");
		 delCategory.closeConnection();
		 requsetDis_delete.forward(request, response);
		
	}

}
