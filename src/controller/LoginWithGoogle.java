package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.TaiKhoanBO;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import Utils.GoogleAuth;

/**
 * Servlet implementation class LoginFacebook
 */
@WebServlet("/LoginWithGoogle")
public class LoginWithGoogle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginWithGoogle() {
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
		String accessToken = null;
		if (null != code) {
			System.out.println("Code: " + code);

			List<NameValuePair> nvps = new ArrayList<NameValuePair>();
			nvps.add(new BasicNameValuePair("client_id", GoogleAuth
					.getGooglePlusClientId()));
			nvps.add(new BasicNameValuePair("client_secret", GoogleAuth
					.getAppSecret()));
			nvps.add(new BasicNameValuePair("grant_type", "authorization_code"));
			nvps.add(new BasicNameValuePair("redirect_uri", GoogleAuth
					.getCallbackURL()));
			nvps.add(new BasicNameValuePair("code", code));

			accessToken = GoogleAuth.getAccessToken(nvps);
		} else {
			response.sendRedirect(request.getContextPath() + "/error.html");
			return;
		}

		if (null != accessToken) {
			System.out.println("accessToken: " + accessToken);
			String apiURL = "https://www.googleapis.com/oauth2/v1/userinfo?access_token="
					+ accessToken;
			TAIKHOAN taikhoan = GoogleAuth.getUserInfo(apiURL);
			taikhoan.setTenTaiKhoan(taikhoan.getGoogleID());
			taikhoan.setQuyenQuanTri("user");
			System.out.println(taikhoan.toString());
			if (taikhoan.getGoogleID() == null
					|| taikhoan.getGoogleID().equals("")) {
				response.sendRedirect("Trang-chu");
			} else {
				TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
				if (taiKhoanBO.checkLoginWithGoogle(taikhoan.getGoogleID())) {
					taikhoan = taiKhoanBO
							.getAccountByEmail(taikhoan.getEmail());
					// Tạo session lưu trữ phiên làm việc
					request.getSession().setAttribute("user", taikhoan);
					request.getSession().setAttribute("CKFinder_UserRole",
							"user");
					// Điều hướng đến trang khác mà không cần gửi dữ liệu
					taiKhoanBO.closeConnection();
					response.sendRedirect("Trang-ca-nhan");
				} else {
					if (taiKhoanBO.chekEmail(taikhoan.getEmail())) {
						taiKhoanBO.updateAccountByEmailGoogle(taikhoan);
						taikhoan = taiKhoanBO.getAccountByEmail(taikhoan
								.getEmail());
						request.getSession().setAttribute("user", taikhoan);
						request.getSession().setAttribute("CKFinder_UserRole",
								"user");
						// Điều hướng đến trang khác mà không cần gửi dữ liệu
						taiKhoanBO.closeConnection();
						response.sendRedirect("Trang-ca-nhan");
					} else {
						taiKhoanBO.registerAccountWithGoogle(
								taikhoan.getGoogleID(), taikhoan.getHoTen(),
								taikhoan.getEmail());
						taikhoan = taiKhoanBO.getAccountByEmail(taikhoan
								.getEmail());
						request.getSession().setAttribute("user", taikhoan);
						request.getSession().setAttribute("CKFinder_UserRole",
								"user");
						// Điều hướng đến trang khác mà không cần gửi dữ liệu
						taiKhoanBO.closeConnection();
						response.sendRedirect("Trang-ca-nhan");
					}
				}
			}
		}
		if (null == accessToken)
			response.sendRedirect(request.getContextPath() + "/error.html");
	}

}
