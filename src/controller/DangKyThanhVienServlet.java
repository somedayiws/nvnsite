package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.QUANGCAO;
import model.bean.THONGBAO;
import model.bo.BaiVietBO;
import model.bo.DanhMucBO;
import model.bo.EmailUtility;
import model.bo.QuangCaoBO;
import model.bo.TaiKhoanBO;
import model.bo.TaiNguyenBO;
import model.bo.ThongBaoBO;

@WebServlet("/Dang-ky")
public class DangKyThanhVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DangKyThanhVienServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		DanhMucBO danhmuc = new DanhMucBO();
		BaiVietBO baiviet = new BaiVietBO();
		String submit = request.getParameter("submit");
		String txtFind = (String)request.getAttribute("txtFind");
		if(txtFind == null) txtFind="";
		//Danh mục và bài viết tiêu biểu
		ArrayList<DANHMUC> list = danhmuc.getListDanhMuc("0", "10");
		//Danh mục hiển thị
		ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc(txtFind);
		//Danh sách bài viết host
		request.setAttribute("list", list);
		request.setAttribute("listdanhmuc", listdanhmuc);
		ArrayList<BAIVIET> topmoi = baiviet.getTopBaiViet("Moi");
		request.setAttribute("topmoi", topmoi);
		
		// List thông báo
		ThongBaoBO thongBaoBO = new ThongBaoBO();
		ArrayList<THONGBAO> listthongbao = thongBaoBO.getListHienThi("", "1","DienDan");
		request.setAttribute("listthongbao", listthongbao);

		// Danh sách quảng cáo
		QuangCaoBO quangCaoBO = new QuangCaoBO();
		ArrayList<QUANGCAO> listquangcao = quangCaoBO.getDanhSachQuangCao((int) 2);
		request.setAttribute("listquangcao", listquangcao);
		
		TaiNguyenBO tainguyenBO = new TaiNguyenBO();
		
		String ThongDiep = tainguyenBO.getValue("ThongDiep");
		String LienHe = tainguyenBO.getValue("LienHe");
		String DienThoai = tainguyenBO.getValue("DienThoai");
		String Email = tainguyenBO.getValue("Email");
		String NoiQuy = tainguyenBO.getValue("NoiQuy");
		
		request.setAttribute("ThongDiep", ThongDiep);
		request.setAttribute("LienHe", LienHe);
		request.setAttribute("DienThoai", DienThoai);
		request.setAttribute("Email", Email);
		request.setAttribute("noiquy", NoiQuy);
		
		if(submit == null){
			request.setAttribute("loi", "");
			danhmuc.closeConnection();
			baiviet.closeConnection();
			thongBaoBO.closeConnection();
			quangCaoBO.closeConnection();
			tainguyenBO.closeConnection();
			request.getRequestDispatcher("DangKyThanhVien.jsp").forward(request, response);
		}
		else{
			String taikhoan = request.getParameter("taikhoan");
			String matkhau = request.getParameter("matkhau");
			String hoten = request.getParameter("hoten");
			String diachi = request.getParameter("diachi");
			String dienthoai = request.getParameter("dienthoai");
			String email = request.getParameter("email");
			String ngonngu = request.getParameter("ngonngu");
			if(ngonngu==null) ngonngu = "vi";
			if(taikhoan == null) request.setAttribute("loi", "<div class='alert alert-danger' role='alert'><p>Bạn chưa nhập đầy đủ thông tin.</p></div>");
			if(matkhau == null) request.setAttribute("loi", "<div class='alert alert-danger' role='alert'><p>Bạn chưa nhập đầy đủ thông tin.</p></div>");
			if(email == null) request.setAttribute("loi", "<div class='alert alert-danger' role='alert'><p>Bạn chưa nhập đầy đủ thông tin.</p></div>");
			if(hoten == null) request.setAttribute("loi", "Bạn chưa nhập đầy <div class='alert alert-danger' role='alert'><p>Bạn chưa nhập đầy đủ thông tin.</p></div>");
			TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
			if(!taiKhoanBO.chekOk(taikhoan, "")){
				taiKhoanBO.addTaiKhoan(taikhoan, matkhau, hoten, diachi, dienthoai, email, ngonngu);
				request.setAttribute("loi", "");
				
				ServletContext context = getServletContext();
				
				String host = context.getInitParameter("host");
				String port = context.getInitParameter("port");
				String user = context.getInitParameter("user");
				String pass = context.getInitParameter("pass");
				String tieude = "JPVN.NET - Đăng ký tài khoản thành viên";
				String noidung = "Chào mừng bạn đến với JPVN.NET.\nĐây là thông tin tài khoản của bạn:\n\nTài khoản : " 
				+ taikhoan + "\nMật khẩu : " + matkhau;
				
				try {
		            EmailUtility.sendEmail(host, port, user, pass, email, tieude,noidung);
		            request.setAttribute("tbao", "<div class='alert alert-success' role='alert'><p>Đăng ký thành công.<br>Vui lòng đăng nhập tài khoản thành viên.</p></div>");
		        } catch (Exception ex) {
		        	System.out.println("Lỗi! gửi mail.");
		        }
				request.getRequestDispatcher("DangNhapTaiKhoan.jsp").forward(request, response);
				System.out.println("Done dang ky");
				danhmuc.closeConnection();
				baiviet.closeConnection();
				thongBaoBO.closeConnection();
				quangCaoBO.closeConnection();
				tainguyenBO.closeConnection();
				taiKhoanBO.closeConnection();
				return;
			}else{
				request.setAttribute("loi", "<div class='alert alert-danger' role='alert'><p>Tài khoản đã tồn tại. Vui lòng chọn tài khoản khác để đăng ký. Cảm ơn!</p></div>");
			}
			danhmuc.closeConnection();
			baiviet.closeConnection();
			thongBaoBO.closeConnection();
			quangCaoBO.closeConnection();
			tainguyenBO.closeConnection();
			request.getRequestDispatcher("DangKyThanhVien.jsp").forward(request, response);
		}
	}

}
