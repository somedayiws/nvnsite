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
import model.bean.QUANGCAO;
import model.bean.TAIKHOAN;
import model.bean.THONGBAO;
import model.bo.BaiVietBO;
import model.bo.DanhMucBO;
import model.bo.QuangCaoBO;
import model.bo.TaiKhoanBO;
import model.bo.TaiNguyenBO;
import model.bo.ThongBaoBO;
import model.bo.ValidateBO;

@WebServlet("/Dang-nhap")
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
		ValidateBO kiemtra = new ValidateBO();
		if (username != null) {
			TaiKhoanBO taikhoanBO = new TaiKhoanBO();
			if (kiemtra.check(username, "")) {
				if (kiemtra.check(password, "")) {
					if (taikhoanBO.chekOk(username, password)) {
						TAIKHOAN user = taikhoanBO.getTaiKhoan(username,
								password);
						// Tạo session lưu trữ phiên làm việc
						request.getSession().setAttribute("user", user);
						request.getSession().setAttribute("CKFinder_UserRole", user.getQuyenQuanTri());
						// Điều hướng đến trang khác mà không cần gửi dữ liệu
						taikhoanBO.closeConnection();
						response.sendRedirect("Trang-ca-nhan");
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
						ArrayList<BAIVIET> topmoi = baiviet.getTopBaiViet("Moi");
						
						// List thông báo
						ThongBaoBO thongBaoBO = new ThongBaoBO();
						ArrayList<THONGBAO> listthongbao = thongBaoBO.getListHienThi("", "1","DienDan");
						request.setAttribute("listthongbao", listthongbao);
						
						// Danh sách quảng cáo
						QuangCaoBO quangCaoBO = new QuangCaoBO();
						ArrayList<QUANGCAO> listquangcao = quangCaoBO.getDanhSachQuangCao((int) 2);
						request.setAttribute("listquangcao", listquangcao);
						
						request.setAttribute("topmoi", topmoi);
						request.setAttribute("list", list);
						request.setAttribute("listdanhmuc", listdanhmuc);
						request.setAttribute("loi", "<div class='alert alert-danger' role='alert'><p>Tên đăng nhập hoặc mật khẩu không chính xác.</p></div>");
						TaiNguyenBO tainguyenBO = new TaiNguyenBO();
						
						String ThongDiep = tainguyenBO.getValue("ThongDiep");
						String LienHe = tainguyenBO.getValue("LienHe");
						String DienThoai = tainguyenBO.getValue("DienThoai");
						String Email = tainguyenBO.getValue("Email");
						
						request.setAttribute("ThongDiep", ThongDiep);
						request.setAttribute("LienHe", LienHe);
						request.setAttribute("DienThoai", DienThoai);
						request.setAttribute("Email", Email);
						
						tainguyenBO.closeConnection();
						taikhoanBO.closeConnection();
						danhmuc.closeConnection();
						baiviet.closeConnection();
						thongBaoBO.closeConnection();
						quangCaoBO.closeConnection();
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
					TaiNguyenBO tainguyenBO = new TaiNguyenBO();
					
					String ThongDiep = tainguyenBO.getValue("ThongDiep");
					String LienHe = tainguyenBO.getValue("LienHe");
					String DienThoai = tainguyenBO.getValue("DienThoai");
					String Email = tainguyenBO.getValue("Email");
					
					request.setAttribute("ThongDiep", ThongDiep);
					request.setAttribute("LienHe", LienHe);
					request.setAttribute("DienThoai", DienThoai);
					request.setAttribute("Email", Email);
					
					tainguyenBO.closeConnection();
					taikhoanBO.closeConnection();
					danhmuc.closeConnection();
					baiviet.closeConnection();
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
				TaiNguyenBO tainguyenBO = new TaiNguyenBO();
				
				String ThongDiep = tainguyenBO.getValue("ThongDiep");
				String LienHe = tainguyenBO.getValue("LienHe");
				String DienThoai = tainguyenBO.getValue("DienThoai");
				String Email = tainguyenBO.getValue("Email");
				
				request.setAttribute("ThongDiep", ThongDiep);
				request.setAttribute("LienHe", LienHe);
				request.setAttribute("DienThoai", DienThoai);
				request.setAttribute("Email", Email);
				
				tainguyenBO.closeConnection();
				taikhoanBO.closeConnection();
				danhmuc.closeConnection();
				baiviet.closeConnection();
				request.getRequestDispatcher("DangNhapTaiKhoan.jsp").forward(request, response);
			}
		} else {
			response.sendRedirect("Trang-chu");
		}
	}
}
