package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.TaiKhoanBO;
import Utils.APIWrapper;
import Utils.Utils;

/**
 * Servlet implementation class LoginFacebook
 */
@WebServlet("/LoginFacebook")
public class LoginFacebook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginFacebook() {
		super();
	} 

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
//		String code = request.getParameter("code");
//		System.out.println(code);
//		String accessToken = wrapper.getAccessToken(code);
		String access_token = request.getParameter("access_token");
		System.out.println(access_token);

		APIWrapper wrapper = new APIWrapper();
		wrapper.setAccessToken(access_token);

		TAIKHOAN taikhoan = wrapper.getUserInfo();
		if (taikhoan.getFacebookID() == null
				|| taikhoan.getFacebookID().equals("")) {
			request.setAttribute("KetQua", "<div class='alert alert-danger' role='alert'><p>Đăng nhập facebook thất bại!</p></div>");
			request.getRequestDispatcher("DataShow.jsp").forward(request, response);
		} else {
			TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
			if(taikhoan.getEmail() == null || taikhoan.getEmail().equals("")) {
				taikhoan.setTenTaiKhoan(Utils.formatTextToAlphabet(taikhoan.getHoTen())+RandomPassword.password(4));
				taikhoan.setEmail(taikhoan.getTenTaiKhoan());
			}else {
				String emailName = taikhoan.getEmail().substring(0,taikhoan.getEmail().indexOf('@'));
				if (taiKhoanBO.kiemTraTonTai(emailName)){
					taikhoan.setTenTaiKhoan(emailName+ RandomPassword.password(5));
				}else{
					taikhoan.setTenTaiKhoan(emailName);
				}
			}
			taikhoan.setQuyenQuanTri("user");
			System.out.println(taikhoan.toString());
			
			if (taiKhoanBO.checkLoginWithFacebook(taikhoan.getFacebookID())) {
				taikhoan = taiKhoanBO.getAccountByEmail(taikhoan.getEmail());
				// Tạo session lưu trữ phiên làm việc
				request.getSession().setAttribute("user", taikhoan);
				request.getSession().setAttribute("CKFinder_UserRole", "user");
				// Điều hướng đến trang khác mà không cần gửi dữ liệu
				taiKhoanBO.closeConnection();
			} else {
				if (taiKhoanBO.chekEmail(taikhoan.getEmail())) {
					taiKhoanBO.updateAccountByEmail(taikhoan);
					taikhoan = taiKhoanBO.getAccountByEmail(taikhoan.getEmail());
					request.getSession().setAttribute("user", taikhoan);
					request.getSession().setAttribute("CKFinder_UserRole",
							"user");
					// Điều hướng đến trang khác mà không cần gửi dữ liệu
					taiKhoanBO.closeConnection();
				} else {
					taiKhoanBO.registerAccountWithFacebook(taikhoan.getTenTaiKhoan(),
							taikhoan.getFacebookID(),
							taikhoan.getFacebookLink(), taikhoan.getHoTen(),
							taikhoan.getEmail());
					taikhoan = taiKhoanBO.getAccountByEmail(taikhoan.getEmail());
					request.getSession().setAttribute("user", taikhoan);
					request.getSession().setAttribute("CKFinder_UserRole",
							"user");
					// Điều hướng đến trang khác mà không cần gửi dữ liệu
					taiKhoanBO.closeConnection();
				}
			}
			request.setAttribute("KetQua", "Thanhcong");
			request.getRequestDispatcher("DataShow.jsp").forward(request, response);
		}
//	}catch (Exception e){
//		response.sendRedirect("Trang-chu");
//	}
	}

}
