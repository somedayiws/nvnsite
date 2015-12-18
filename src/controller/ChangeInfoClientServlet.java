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
@WebServlet("/ChangeInfoClientServlet")
public class ChangeInfoClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangeInfoClientServlet() {
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

		String username = request.getParameter("taikhoan");
		String permission = request.getParameter("permission");
		String hoten = request.getParameter("hoten");
		String dienthoai = request.getParameter("dienthoai");
		String diachi = request.getParameter("diachi");
		String email = request.getParameter("email");
		boolean isChangeUsername = false;
		boolean isChangeEmail = false;
//		System.out.println(username + hoten + dienthoai + diachi + email
//				+ permission);
		HttpSession session_user = request.getSession();
		TAIKHOAN user = (TAIKHOAN) request.getSession().getAttribute("user");
		if (user != null) {
			if (!(user.getEditFlag().equals("00"))) {
				if(user.getEditFlag().charAt(0)=='1'){
					if (!(username.trim().equals("") || username == null) && !username.equals(user.getTenTaiKhoan())) {
						if(Utils.Utils.checkUsername(username)){
							String tmp = user.getTenTaiKhoan();
							user.setTenTaiKhoan(username);
							username = tmp;
							user.setEditFlag("0"+user.getEditFlag().charAt(1));
							isChangeUsername = true;
						}else
						{
							request.setAttribute("type", "fail");
							request.setAttribute("Message",
									"Tên đăng nhập dùng để đăng nhập vào hệ thống, tối đa 30 ký tự, không chứa ký tự đặc biệt<br>ユーザー名はシステム上にログインし、最大に30文字で、特別な記号を使わないでください。");
							RequestDispatcher dispatcher = request
								.getRequestDispatcher("Result.jsp");
							dispatcher.forward(request, response);
							return;
						}
					}
				}
				if(user.getEditFlag().charAt(1)=='1'){
					if (!(email.trim().equals("") || email == null) && !email.equals(user.getEmail())) {
						String tmp = user.getEmail();
						user.setEmail(email);
						email = tmp;
						user.setEditFlag(user.getEditFlag().charAt(0)+"0");
						isChangeEmail = true;
					}
				}
			}
			if (!(hoten.trim().equals("") || hoten == null)) {
				user.setHoTen(hoten);
			}
			if (!(dienthoai.trim().equals("") || dienthoai == null)) {
				user.setDienThoai(dienthoai);
			}
			if (!(diachi.trim().equals("") || diachi == null)) {
				user.setDiaChi(diachi);
			}
			TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
			if(taiKhoanBO.UpdateThongTin(user)){
				if(isChangeUsername) {
					taiKhoanBO.updateUsername(username, user.getTenTaiKhoan());
				}
				if(isChangeEmail) {
					taiKhoanBO.updateEmail(email, user.getEmail());
				}
				request.setAttribute("Message",
						"Cập nhật thành công - 更新を成功する。");
				request.setAttribute("type", "success");
			}else{
				request.setAttribute("type", "fail");
				request.setAttribute("Message",
						"Cập nhật thất bại - 更新を失敗する。");
			}
			taiKhoanBO.closeConnection();
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("Result.jsp");
			
			dispatcher.forward(request, response);
			
		}else {
			request.setAttribute("type", "fail");
			request.setAttribute("Message",
					"Cập nhật thất bại - 更新を失敗する。");
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("Result.jsp");
			dispatcher.forward(request, response);
		}
		// if (user.getTenTaiKhoan().equals(username)) {
		// TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
		// String checkPassResult = taiKhoanBO.checkValidChangePass(username,
		// oldpassword,
		// newpassword, passwordagain);
		// if (checkPassResult.equals("true")) {
		// user.setMatKhau(newpassword);
		// if (taiKhoanBO.UpdateThongTin(user)) {
		// RequestDispatcher dispatcher = request
		// .getRequestDispatcher("Result.jsp");
		// request.setAttribute("Message",
		// "Cập nhật thành công - 更新を成功する。");
		// request.setAttribute("type", "success");
		// taiKhoanBO.closeConnection();
		// dispatcher.forward(request, response);
		// } else {
		// request.setAttribute("type", "fail");
		// request.setAttribute("Message",
		// "Cập nhật thất bại - 更新を失敗する。");
		// RequestDispatcher dispatcher = request
		// .getRequestDispatcher("Result.jsp");
		// taiKhoanBO.closeConnection();
		// dispatcher.forward(request, response);
		// }
		// } else {
		// request.setAttribute("type", "fail");
		// request.setAttribute("Message", checkPassResult);
		// RequestDispatcher dispatcher = request
		// .getRequestDispatcher("Result.jsp");
		// taiKhoanBO.closeConnection();
		// dispatcher.forward(request, response);
		// }
		// } else {
		// request.setAttribute("type", "fail");
		// request.setAttribute("Message", "Cập nhật thất bại - 更新を失敗する。");
		// RequestDispatcher dispatcher = request
		// .getRequestDispatcher("Result.jsp");
		// dispatcher.forward(request, response);
		// }
	}

}
