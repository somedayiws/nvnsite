package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.EmailUtility;
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
				taikhoan = taiKhoanBO.getAccountByIdSocial("facebook", taikhoan.getFacebookID());
				// Tạo session lưu trữ phiên làm việc
				request.getSession().setAttribute("user", taikhoan);
				request.getSession().setAttribute("CKFinder_UserRole", "user");
				// Điều hướng đến trang khác mà không cần gửi dữ liệu
				taiKhoanBO.closeConnection();
			} else {
				if (taiKhoanBO.chekEmail(taikhoan.getEmail())) {
					taiKhoanBO.updateAccountByEmail(taikhoan);
					taikhoan = taiKhoanBO.getAccountByIdSocial("facebook", taikhoan.getFacebookID());
					request.getSession().setAttribute("user", taikhoan);
					request.getSession().setAttribute("CKFinder_UserRole",
							"user");
					// Điều hướng đến trang khác mà không cần gửi dữ liệu
					taiKhoanBO.closeConnection();
				} else {
					String password = RandomPassword.password(8);
					taiKhoanBO.registerAccountWithFacebook(taikhoan.getTenTaiKhoan(),
							taikhoan.getFacebookID(),
							taikhoan.getFacebookLink(), taikhoan.getHoTen(),
							taikhoan.getEmail(),password);
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
			request.setAttribute("KetQua", "Thanhcong");
			request.getRequestDispatcher("DataShow.jsp").forward(request, response);
		}
//	}catch (Exception e){
//		response.sendRedirect("Trang-chu");
//	}
	}

}
