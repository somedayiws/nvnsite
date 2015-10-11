package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bo.AdminCreatePostsBO;

/**
 * Servlet implementation class AdminCreatePostsServlet
 */
@WebServlet("/admin/AdminCreatePostsServlet")
public class AdminCreatePostsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminCreatePostsServlet() {
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

		String namePostsVi = request.getParameter("namePostsVi");
		String namePostsJa = request.getParameter("namePostsJa");
		String categoryVi = request.getParameter("categoryVi");
		String categoryJa = request.getParameter("categoryJa");
		String account = request.getParameter("account");
		String ContentVi = request.getParameter("ContentVi");
		String ContentJa = request.getParameter("ContentJa");
		String note = request.getParameter("note");
		String DescriptionVi = request.getParameter("DescriptionVi");
		String DescriptionJa = request.getParameter("DescriptionJa");

		
		String idCategory, idAccount,resultSubmit;
		AdminCreatePostsBO createposts = new AdminCreatePostsBO();

		if (createposts.checkcategory(categoryVi, categoryJa)) {
			BAIVIET posts = new BAIVIET();
			posts.setIdBaiViet(createposts.id_Posts_after_increase());
			posts.setTenBaiVietVi(namePostsVi);
			posts.setTenBaiVietJa(namePostsJa);
			idCategory = categoryVi;
			idAccount = account;
			posts.setNoiDungVi(ContentVi);
			posts.setNoiDungJa(ContentJa);
			posts.setTrangThai("chuaxem");
			posts.setGhiChu(note);
			posts.setMoTaVi(DescriptionVi);
			posts.setMoTaJa(DescriptionJa);
			if(createposts.insertPosts(posts, idCategory, idAccount)){
				resultSubmit = "Thêm thành công";
			}else{
				resultSubmit = "Thêm thất bại";
				
			}
			request.setAttribute("resultSubmit", resultSubmit);
			RequestDispatcher requestDis_error = request
					.getRequestDispatcher("ShowCreatePostServlet");
			requestDis_error.forward(request, response);

		}
		else{
			resultSubmit = "Data invalid";
			request.setAttribute("error", resultSubmit);
			RequestDispatcher requestDis_error = request
					.getRequestDispatcher("Error.jsp");
			requestDis_error.forward(request, response);
		}
	}

}
