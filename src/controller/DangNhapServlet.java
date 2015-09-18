package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.TAIKHOAN;
import model.bo.BaiVietBO;
import model.bo.DanhMucBO;
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
						request.getSession().setAttribute("CKFinder_UserRole", user.getQuyenQuanTri());
						// Điều hướng đến trang khác mà không cần gửi dữ liệu
						response.sendRedirect("TrangCaNhanServlet");
					} else {
						String txtFind = (String)request.getAttribute("txtFind");
						if(txtFind == null) txtFind="";
						DanhMucBO danhmuc = new DanhMucBO();
						BaiVietBO baiviet = new BaiVietBO();
						//Danh mục và bài viết tiêu biểu
						ArrayList<DANHMUC> list = danhmuc.getListDanhMuc("0", "10");
						//Danh mục hiển thị
						ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc(txtFind);
						//Danh sách bài viết host
						ArrayList<BAIVIET> topbaiviet = baiviet.getTopBaiViet("XemNhieu");
						ArrayList<BAIVIET> topmoi = baiviet.getTopBaiViet("Moi");
						request.setAttribute("topmoi", topmoi);
						request.setAttribute("list", list);
						request.setAttribute("listdanhmuc", listdanhmuc);
						request.setAttribute("topbaiviet", topbaiviet);
						request.setAttribute("loi", "<div class='alert alert-danger' role='alert'><p>Tên đăng nhập hoặc mật khẩu không chính xác.</p></div>");
						request.getRequestDispatcher("DangNhapTaiKhoan.jsp").forward(request, response);
					}
				} else {
					String txtFind = (String)request.getAttribute("txtFind");
					if(txtFind == null) txtFind="";
					DanhMucBO danhmuc = new DanhMucBO();
					BaiVietBO baiviet = new BaiVietBO();
					//Danh mục và bài viết tiêu biểu
					ArrayList<DANHMUC> list = danhmuc.getListDanhMuc("0", "10");
					//Danh mục hiển thị
					ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc(txtFind);
					//Danh sách bài viết host
					ArrayList<BAIVIET> topbaiviet = baiviet.getTopBaiViet("XemNhieu");
					request.setAttribute("list", list);
					request.setAttribute("listdanhmuc", listdanhmuc);
					request.setAttribute("topbaiviet", topbaiviet);
					request.setAttribute("loi", "<div class='alert alert-danger' role='alert'><p>Bạn chưa nhập tài khoản.</p></div>");
					request.getRequestDispatcher("DangNhapTaiKhoan.jsp").forward(request, response);
				}
			} else {
				String txtFind = (String)request.getAttribute("txtFind");
				if(txtFind == null) txtFind="";
				DanhMucBO danhmuc = new DanhMucBO();
				BaiVietBO baiviet = new BaiVietBO();
				//Danh mục và bài viết tiêu biểu
				ArrayList<DANHMUC> list = danhmuc.getListDanhMuc("0", "10");
				//Danh mục hiển thị
				ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc(txtFind);
				//Danh sách bài viết host
				ArrayList<BAIVIET> topbaiviet = baiviet.getTopBaiViet("XemNhieu");
				request.setAttribute("list", list);
				request.setAttribute("listdanhmuc", listdanhmuc);
				request.setAttribute("topbaiviet", topbaiviet);
				request.setAttribute("loi", "<div class='alert alert-danger' role='alert'><p>Bạn chưa mật khẩu.</p></div>");
				request.getRequestDispatcher("DangNhapTaiKhoan.jsp").forward(request, response);
			}
		} else {
			response.sendRedirect("TrangChuServlet");
		}
	}
}
