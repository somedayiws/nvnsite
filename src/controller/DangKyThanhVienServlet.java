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
		if(submit == null){
			//Danh mục hiển thị
			ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc("");
			//Danh sách bài viết host
			ArrayList<BAIVIET> topbaiviet = baiviet.getTopBaiViet();
			request.setAttribute("listdanhmuc", listdanhmuc);
			request.setAttribute("topbaiviet", topbaiviet);
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
			if(taikhoan == null) response.sendRedirect("TrangChuServlet");
			if(matkhau == null) response.sendRedirect("TrangChuServlet");
			if(email == null) response.sendRedirect("TrangChuServlet");
			if(hoten == null) response.sendRedirect("TrangChuServlet");
			TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
			if(!taiKhoanBO.chekOk(taikhoan, matkhau)){
				taiKhoanBO.addTaiKhoan(taikhoan, matkhau, hoten, diachi, dienthoai, email, ngonngu);
			}
			response.sendRedirect("ctv/TrangChuCTVServlet");
		}
		
	}

}
