package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.TAIKHOAN;
import model.bo.TaiKhoanBO;

/**
 * Servlet implementation class ChangePassServlet
 */
@WebServlet("/ChangePassClientServlet")
public class ChangePassClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePassClientServlet() {
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

		String username = request.getParameter("account");
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		String passwordagain = request.getParameter("passwordagain");
		System.out.println(username + oldpassword + newpassword + passwordagain);

		HttpSession session_user = request.getSession();
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
		if (user != null && user.getTenTaiKhoan().equals(username)) {
			TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
			String checkPassResult = taiKhoanBO.checkValidChangePass(username, oldpassword,
					newpassword, passwordagain);
			if (checkPassResult.equals("true")) {
				user.setMatKhau(newpassword);
				if (taiKhoanBO.updatePassword(user.getIdTaiKhoan(),newpassword)) {
					taiKhoanBO.closeConnection();
					RequestDispatcher dispatcher = request
							.getRequestDispatcher("Result.jsp");
					request.setAttribute("Message",
							"Cập nhật thành công - 更新を成功する。");
					request.setAttribute("type", "success");
					dispatcher.forward(request, response);
				} else {
					taiKhoanBO.closeConnection();
					request.setAttribute("type", "fail");
					request.setAttribute("Message",
							"Cập nhật thất bại - 更新を失敗する。");
					RequestDispatcher dispatcher = request
							.getRequestDispatcher("Result.jsp");
					dispatcher.forward(request, response);
				}
			} else {
				taiKhoanBO.closeConnection();
				request.setAttribute("type", "fail");
				request.setAttribute("Message", checkPassResult);
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("Result.jsp");
				dispatcher.forward(request, response);
			}
		} else {
			request.setAttribute("type", "fail");
			request.setAttribute("Message", "Cập nhật thất bại - 更新を失敗する。");
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("Result.jsp");
			dispatcher.forward(request, response);
		}
	}

}
