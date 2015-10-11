package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.RestoreDataBO;

/**
 * Servlet implementation class RestoreServlet
 */
@WebServlet("/admin/RestoreServlet")
public class RestoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RestoreServlet() {
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
		String idAccount = request.getParameter("idAccount");
		String idCategory = request.getParameter("idCategory");
		String idPosts = request.getParameter("idPosts");
		String id = null;
		if (idAccount != null)
			id = idAccount;
		else if (idCategory != null)
			id = idCategory;
		else if(idPosts!=null) id = idPosts;
		else id = idAccount;
	
		doPost(request, response, id);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response, String valueId)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String screen =(String)request.getAttribute("screen");
		RestoreDataBO restore = new RestoreDataBO();
		String result_Restore = null;
		if (valueId != null) {
			if (valueId.contains("TK")) {
				if (restore.restore("IdTaiKhoan", valueId, "taikhoan")) {
					result_Restore = "Phục hồi tài khoản thành công - ";
				} else {
					result_Restore = "Phục hồi tài khoản thất bại - ";
				}
			}
			else if (valueId.contains("DM")) {
				if (restore.restore("IdDanhMuc", valueId, "danhmuc")) {
					result_Restore = "Phục hồi danh mục thành công - ";
				} else {
					result_Restore = "Phục hồi danh mục thất bại - ";
				}
			}
			else if (valueId.contains("BV")) {
				if (restore.restore("IdBaiViet", valueId, "baiviet")) {
					result_Restore = "Phục hồi bài viết thành công - 記事の回復ができた";
				} else {
					result_Restore = "Phục hồi bài viết thất bại - 記事の回復ができない";
				}
			}
		}
		request.setAttribute("screen", screen);
		request.setAttribute("result_Restore", result_Restore);
		RequestDispatcher requestDis_restore = request
				.getRequestDispatcher("ShowRestoreServlet");
		restore.closeConnection();
		requestDis_restore.forward(request, response);
	}

}
