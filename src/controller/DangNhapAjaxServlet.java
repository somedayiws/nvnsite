package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.TaiKhoanBO;
import model.bo.ValidateBO;

@WebServlet("/DangNhapAjaxServlet")
public class DangNhapAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DangNhapAjaxServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		//Lấy dữ liệu gửi từ client lên
				String username = request.getParameter("taikhoan");
				String password = request.getParameter("matkhau");
				//Tạo đối tượng xử lý đăng nhập
				ValidateBO kiemtra = new ValidateBO();
				if (username != null) {
					TaiKhoanBO taikhoanBO = new TaiKhoanBO();
					if (kiemtra.check(username, "")) {
						if (kiemtra.check(password, "")) {
							if (taikhoanBO.chekOk(username, password)) {
								TAIKHOAN user = taikhoanBO.getTaiKhoan(username, password);
								if(user!=null) {
									// Tạo session lưu trữ phiên làm việc
									request.getSession().setAttribute("user", user);
									request.getSession().setAttribute("CKFinder_UserRole", user.getQuyenQuanTri());
									// Điều hướng đến trang khác mà không cần gửi dữ liệu
									taikhoanBO.closeConnection();
									request.setAttribute("KetQua", "Thanhcong");
									request.getRequestDispatcher("DataShow.jsp").forward(request, response);
									return;
								} else {
									request.setAttribute("KetQua", "<div class='alert alert-danger' role='alert'><p>Tên đăng nhập hoặc mật khẩu không chính xác.<br>アカウントもしくパスワードを正しく入力しません.</p></div>");
									request.getRequestDispatcher("DataShow.jsp").forward(request, response);
									return;
								}
							} else {
								request.setAttribute("KetQua", "<div class='alert alert-danger' role='alert'><p>Tên đăng nhập hoặc mật khẩu không chính xác.<br>アカウントもしくパスワードを正しく入力しません.</p></div>");
								request.getRequestDispatcher("DataShow.jsp").forward(request, response);
							}
						} else {
							request.setAttribute("KetQua", "<div class='alert alert-danger' role='alert'><p>Bạn chưa nhập mật khẩu - パスワードをまだ入力しない.</p></div>");
							request.getRequestDispatcher("DataShow.jsp").forward(request, response);
						}
					} else {
						request.setAttribute("KetQua", "<div class='alert alert-danger' role='alert'><p>Bạn chưa nhập tài khoản - アカウントをまだ入力しない.</p></div>");
						request.getRequestDispatcher("DataShow.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("KetQua", "<div class='alert alert-danger' role='alert'><p>Tên đăng nhập hoặc mật khẩu không chính xác.<br>アカウントもしくパスワードを正しく入力しません.</p></div>");
					request.getRequestDispatcher("DataShow.jsp").forward(request, response);
				}
	}

}
