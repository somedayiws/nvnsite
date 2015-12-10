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
import Utils.NetUtils;

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
		String code = request.getParameter("code");

		APIWrapper wrapper = new APIWrapper();
		String accessToken = wrapper.getAccessToken(code);
		wrapper.setAccessToken(accessToken);

		TAIKHOAN taikhoan = wrapper.getUserInfo();
		if (taikhoan.getFacebookID() == null
				|| taikhoan.getFacebookID().equals("")) {
			response.sendRedirect("Trang-chu");
		} else {
			TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
			if(taikhoan.getEmail() == null || taikhoan.getEmail().equals("")) {
				taikhoan.setTenTaiKhoan(NetUtils.formatTextToAlphabet(taikhoan.getHoTen())+RandomPassword.password(4));
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
				response.sendRedirect("Trang-ca-nhan");
			} else {
				if (taiKhoanBO.chekEmail(taikhoan.getEmail())) {
					taiKhoanBO.updateAccountByEmail(taikhoan);
					taikhoan = taiKhoanBO.getAccountByEmail(taikhoan.getEmail());
					request.getSession().setAttribute("user", taikhoan);
					request.getSession().setAttribute("CKFinder_UserRole",
							"user");
					// Điều hướng đến trang khác mà không cần gửi dữ liệu
					taiKhoanBO.closeConnection();
					response.sendRedirect("Trang-ca-nhan");
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
					response.sendRedirect("Trang-ca-nhan");
				}
			}
		}
//	}catch (Exception e){
//		response.sendRedirect("Trang-chu");
//	}
	}

}
