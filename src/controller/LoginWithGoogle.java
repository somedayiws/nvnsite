package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.EmailUtility;
import model.bo.TaiKhoanBO;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import Utils.GoogleAuth;
import Utils.Utils;

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
//		String access_token = request.getParameter("access_token");
//		System.out.println(access_token);
//		String accessToken = access_token;
//		String code = request.getParameter("code");
//		System.out.println(code);
//		String accessToken = "";
//		if (null != code) {
//			System.out.println("Code: " + code);
//
//			List<NameValuePair> nvps = new ArrayList<NameValuePair>();
//			nvps.add(new BasicNameValuePair("client_id", GoogleAuth
//					.getGooglePlusClientId()));
//			nvps.add(new BasicNameValuePair("client_secret", GoogleAuth
//					.getAppSecret()));
//			nvps.add(new BasicNameValuePair("grant_type", "authorization_code"));
//			nvps.add(new BasicNameValuePair("redirect_uri", GoogleAuth
//					.getCallbackURL()));
//			nvps.add(new BasicNameValuePair("code", code));
//			accessToken = GoogleAuth.getAccessToken(nvps);
//		} else {
//			response.sendRedirect(request.getContextPath() + "/error.html");
//			return;
//		}

//		if (null != accessToken) {
//			System.out.println("accessToken: " + accessToken);
//			String apiURL = "https://www.googleapis.com/oauth2/v1/userinfo?access_token="
//					+ accessToken;
//			TAIKHOAN taikhoan = GoogleAuth.getUserInfo(apiURL);
		
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			String name = request.getParameter("name");

			TAIKHOAN taikhoan = new TAIKHOAN();
			taikhoan.setGoogleID(id);
			taikhoan.setEmail(email);
			taikhoan.setHoTen(name);
			System.out.println(taikhoan.toString());
			if (taikhoan.getGoogleID() == null
					|| taikhoan.getGoogleID().equals("")) {
				request.setAttribute("KetQua", "<div class='alert alert-danger' role='alert'><p>Đăng nhập facebook thất bại!</p></div>");
				request.getRequestDispatcher("DataShow.jsp").forward(request, response);
			} else {
				TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
				if(taikhoan.getEmail() == null || taikhoan.getEmail().equals("")) {
					taikhoan.setTenTaiKhoan(Utils.formatTextToAlphabet(taikhoan.getHoTen())+RandomPassword.password(4));
				}else {
					String emailName = taikhoan.getEmail().substring(0,taikhoan.getEmail().indexOf('@'));
					if (taiKhoanBO.kiemTraTonTai(emailName)){
						taikhoan.setTenTaiKhoan(emailName+ RandomPassword.password(5));
					}else{
						taikhoan.setTenTaiKhoan(emailName);
					}
				}
				if (taiKhoanBO.checkLoginWithGoogle(taikhoan.getGoogleID())) {
					taikhoan = taiKhoanBO.getAccountByIdSocial("google", taikhoan.getGoogleID());
					// Tạo session lưu trữ phiên làm việc
					request.getSession().setAttribute("user", taikhoan);
					request.getSession().setAttribute("CKFinder_UserRole",
							"user");
					// Điều hướng đến trang khác mà không cần gửi dữ liệu
					taiKhoanBO.closeConnection();
				} else {
					if (taiKhoanBO.chekEmail(taikhoan.getEmail())) {
						taiKhoanBO.updateAccountByEmailGoogle(taikhoan);
						taikhoan = taiKhoanBO.getAccountByIdSocial("google", taikhoan.getGoogleID());
						request.getSession().setAttribute("user", taikhoan);
						request.getSession().setAttribute("CKFinder_UserRole",
								"user");
						// Điều hướng đến trang khác mà không cần gửi dữ liệu
						taiKhoanBO.closeConnection();
					} else {
						String password = RandomPassword.password(8);
						taiKhoanBO.registerAccountWithGoogle(taikhoan.getTenTaiKhoan(),
								taikhoan.getGoogleID(), taikhoan.getHoTen(),
								taikhoan.getEmail(),password);
						taikhoan = taiKhoanBO.getAccountByIdSocial("google", taikhoan.getGoogleID());
						taikhoan = taiKhoanBO.getAccountByEmail(taikhoan.getEmail());
						ServletContext context = getServletContext();
						String host = context.getInitParameter("host");
						String port = context.getInitParameter("port");
						String user = context.getInitParameter("user");
						String pass = context.getInitParameter("pass");
						String tieude = "JPVN.NET - Đăng ký tài khoản thành viên(会員の登録)";
						String noidung = "<h3>Chào mừng bạn đến với website JPVN.NET(JPVN.NETへようこそ) - Cổng thông tin thương mại điện tử Việt-Nhật</h3><br>Sau đây là thông tin tài khoản của bạn(こちらはあなたのアカウントです):<br><br><strong>Tài khoản(アカウント) </strong>: " 
								+ taikhoan.getTenTaiKhoan() + "<br><strong>Mật khẩu(パスワード) </strong>: " + password
								+ "<br>Vui lòng truy cập vào trang cá nhân để cập nhật lại thông tin tài khoản! <br><br>"
								+ "Chúc bạn có được những thông tin hữu ích từ website http://jpvn.net <br>";
						
						try {
				            EmailUtility.sendEmailThread(host, port, user, pass, taikhoan.getEmail(), tieude,noidung);
				            request.setAttribute("tbao", "<div class='alert alert-success' role='alert'><p>Đăng ký thành công - 登録を成功した.<br>Vui lòng đăng nhập tài khoản thành viên - 会員のアカウントを改めて入力してください.</p></div>");
				        } catch (Exception ex) {
				        	System.out.println("Lỗi! gửi mail.");
				        }
						request.getSession().setAttribute("user", taikhoan);
						request.getSession().setAttribute("CKFinder_UserRole",
								"user");
						// Điều hướng đến trang khác mà không cần gửi dữ liệu
						taiKhoanBO.closeConnection();
					}
				}
				request.getSession().setAttribute("isGoogleAccount", "true");
				request.setAttribute("KetQua", "Thanhcong");
				request.getRequestDispatcher("DataShow.jsp").forward(request, response);
			}
//		}
//		if (null == accessToken)
//			response.sendRedirect(request.getContextPath() + "/error.html");
	}

}
