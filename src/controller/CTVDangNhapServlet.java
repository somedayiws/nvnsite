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

@WebServlet("/ctv/CTVDangNhapServlet")
public class CTVDangNhapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CTVDangNhapServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
						// Điều hướng đến trang khác mà không cần gửi dữ liệu
						response.sendRedirect("ThongTinCTV.jsp");
					} else {
						request.setAttribute("meg", "Tên đăng nhập hoặc mật khẩu không chính xác!");
						request.getRequestDispatcher("TrangChuCTV.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("meg", "Không thể để trống trường mật khẩu!");
					request.getRequestDispatcher("TrangChuCTV.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("meg", "Không thể để trống trường tài khoản!");
				request.getRequestDispatcher("TrangChuCTV.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("meg", "");
			request.getRequestDispatcher("TrangChuCTV.jsp").forward(request, response);
		}
	}

}
