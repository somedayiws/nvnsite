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

@WebServlet("/DangNhapServlet")
public class DangNhapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DangNhapServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//Xử lý chuyển hướng đăng nhập ở đây
		request.setCharacterEncoding("UTF-8");
		//Lấy dữ liệu gửi từ client lên
		String username = request.getParameter("taikhoan");
		String password = request.getParameter("matkhau");
		//Tạo đối tượng xử lý đăng nhập
		TaiKhoanBO taikhoanBO = new TaiKhoanBO();
		ValidateBO kiemtra = new ValidateBO();
		if (username != null) {
			if (kiemtra.check(username, "")) {
				if (kiemtra.check(password, "")) {
					if (taikhoanBO.chekOk(username, password)) {
						TAIKHOAN user = taikhoanBO.getTaiKhoan(username,
								password);
						// Tạo session lưu trữ phiên làm việc
						request.getSession().setAttribute("user", user);
						// Set user role variable on session - ckfinder
						request.getSession().setAttribute("CKFinder_UserRole", user.getQuyenQuanTri());
						// Điều hướng đến trang khác mà không cần gửi dữ liệu
						response.sendRedirect("TrangChuServlet");
					} else {
						response.sendRedirect("TrangChuServlet");
					}
				} else {
					response.sendRedirect("TrangChuServlet");
				}
			} else {
				response.sendRedirect("TrangChuServlet");
			}
		} else {
			response.sendRedirect("TrangChuServlet");
		}
	}
}
