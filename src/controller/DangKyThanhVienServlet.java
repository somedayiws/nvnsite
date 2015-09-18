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
import model.bo.BaiVietBO;
import model.bo.DanhMucBO;
import model.bo.TaiKhoanBO;

@WebServlet("/DangKyThanhVienServlet")
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
		ArrayList<BAIVIET> topbaiviet = baiviet.getTopBaiViet("XemNhieu");
		request.setAttribute("list", list);
		request.setAttribute("listdanhmuc", listdanhmuc);
		request.setAttribute("topbaiviet", topbaiviet);
		ArrayList<BAIVIET> topmoi = baiviet.getTopBaiViet("Moi");
		request.setAttribute("topmoi", topmoi);
		if(submit == null){
			request.setAttribute("loi", "");
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
			if(taikhoan == null) request.setAttribute("loi", "<div class='alert alert-danger' role='alert'><p>Bạn chưa nhập đầy đủ thông tin.</p></div>");
			if(matkhau == null) request.setAttribute("loi", "<div class='alert alert-danger' role='alert'><p>Bạn chưa nhập đầy đủ thông tin.</p></div>");
			if(email == null) request.setAttribute("loi", "<div class='alert alert-danger' role='alert'><p>Bạn chưa nhập đầy đủ thông tin.</p></div>");
			if(hoten == null) request.setAttribute("loi", "Bạn chưa nhập đầy <div class='alert alert-danger' role='alert'><p>Bạn chưa nhập đầy đủ thông tin.</p></div>");
			TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
			if(!taiKhoanBO.chekOk(taikhoan, "")){
				taiKhoanBO.addTaiKhoan(taikhoan, matkhau, hoten, diachi, dienthoai, email, ngonngu);
				request.setAttribute("loi", "");
				request.setAttribute("tbao", "<div class='alert alert-success' role='alert'><p>Đăng ký thành công.<br>Vui lòng đăng nhập tài khoản thành viên.</p></div>");
				request.getRequestDispatcher("DangNhapTaiKhoan.jsp").forward(request, response);
			}else{
				request.setAttribute("loi", "<div class='alert alert-danger' role='alert'><p>Tài khoản đã tồn tại. Vui lòng chọn tài khoản khác để đăng ký. Cảm ơn!</p></div>");
			}
			request.getRequestDispatcher("DangKyThanhVien.jsp").forward(request, response);
		}
	}

}
