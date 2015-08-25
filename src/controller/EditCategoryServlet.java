package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.DANHMUC;
import model.bo.EditCategoryBO;

/**
 * Servlet implementation class EditCategoryServlet
 */
@WebServlet("/admin/EditCategoryServlet")
public class EditCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCategoryServlet() {
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
		
		String IdCategory = request.getParameter("idCategory");
		String nameCategoryVi = request.getParameter("nameCategoryVi");
		String nameCategoryJa = request.getParameter("nameCategoryJa");
		String display = request.getParameter("display");
		int show;
		String resultUpdate;
		
		if(display.equals("yes")) show = 1;
		else show = 0;
		
		
		DANHMUC category = new DANHMUC();
		EditCategoryBO editCategory = new EditCategoryBO();
		
		category.setIdDanhMuc(IdCategory);
		category.setTenDanhMucVi(nameCategoryVi);
		category.setTenDanhMucJa(nameCategoryJa);
		category.setHienThi(show);
		
		if(editCategory.checkValidate(category))
		{
			//Valid
			if(editCategory.checkExist(category)){
				//Exist
				request.setAttribute("error", "Category existed into database");
				RequestDispatcher requestDis_error = request.getRequestDispatcher("Error.jsp");
				requestDis_error.forward(request, response);
			}
			else{
				//Not exist
				if(editCategory.updateCategory(category))
				{
					//Update success
					resultUpdate = "Update success";
				}
				else{
					//Update fail
					resultUpdate = "Update fail";
				}
				request.setAttribute("resultUpdate", resultUpdate);
				RequestDispatcher requestDis_Update = request.getRequestDispatcher("ListCategoryServlet");
				requestDis_Update.forward(request, response);
			}
		}else
		{
			//Invalid
			request.setAttribute("error", "You must enter name category VietNam and name category Japan");
			RequestDispatcher requestDis_error = request.getRequestDispatcher("Error.jsp");
			requestDis_error.forward(request, response);
		}
		
		
	}

}
