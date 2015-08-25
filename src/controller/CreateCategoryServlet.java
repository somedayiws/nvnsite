package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.DANHMUC;
import model.bo.CreateCategoryBO;

/**
 * Servlet implementation class CreateCategoryServlet
 */
@WebServlet("/admin/CreateCategoryServlet")
public class CreateCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateCategoryServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		/** Get data from client */
		String nameCategoryVi = request.getParameter("nameCategoryVi");
		String nameCategoryJa = request.getParameter("nameCategoryJa");
		String display = request.getParameter("display");
		int show;

		CreateCategoryBO createCategory = new CreateCategoryBO();

		/** Create Object */
		DANHMUC category = new DANHMUC();

		/** Put data into object */
		category.setTenDanhMucVi(nameCategoryVi);
		category.setTenDanhMucJa(nameCategoryJa);

		/** Check validate */
		if (createCategory.checkValidate(category, display)) {
			if (display.equals("yes"))
				show = 1;
			else
				show = 0;
			category.setHienThi(show);
			/** Check exist */
			if (createCategory.checkExist(category)) {
				// Exist
				request.setAttribute("error", "Category existed into database");
				RequestDispatcher requestDis_error = request
						.getRequestDispatcher("Error.jsp");
				requestDis_error.forward(request, response);

			} else {
				// Not exist
				String id_Category = createCategory
						.id_Category_after_increase();
				if (id_Category == null) {
					request.setAttribute(
							"error",
							"Canot increate automatic IdDanhMuc! Please contact with programmer to fix error this");
					RequestDispatcher requestDis_error = request
							.getRequestDispatcher("Error.jsp");
					requestDis_error.forward(request, response);
				} else {
					category.setIdDanhMuc(id_Category);
					/** Insert into DB */
					if (createCategory.insertCategory(category)) {
						//Insert success
						request.setAttribute("resultInsert", "Insert success");
						RequestDispatcher requsetDis_result = request.getRequestDispatcher("ListCategoryServlet");
						requsetDis_result.forward(request, response);
					}
					else{
						//Insert fail
						request.setAttribute("error", "Insert fail.Please enter information again!");
						RequestDispatcher requestDis_error = request
								.getRequestDispatcher("Error.jsp");
						requestDis_error.forward(request, response);
					}
				}
			}

		} else {
			request.setAttribute("error", "You must enter fully infomation");
			RequestDispatcher requestDis_error = request
					.getRequestDispatcher("Error.jsp");
			requestDis_error.forward(request, response);
		}

	}

}
