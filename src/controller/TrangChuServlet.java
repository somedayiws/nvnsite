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
import model.bean.THONGBAO;
import model.bo.BaiVietBO;
import model.bo.DanhMucBO;
import model.bo.QuangCaoBO;
import model.bo.TaiNguyenBO;
import model.bo.ThongBaoBO;

@WebServlet("/Trang-chu")
public class TrangChuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TrangChuServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String txtFind = (String) request.getAttribute("txtFind");
		if (txtFind == null) txtFind = "";
		DanhMucBO danhmuc = new DanhMucBO();
		BaiVietBO baiviet = new BaiVietBO();
		QuangCaoBO quangCaoBO = new QuangCaoBO();
		// Danh mục và bài viết tiêu biểu
		ArrayList<DANHMUC> list = danhmuc.getListDanhMuc("0", "10");
		request.setAttribute("list", list);
		// Danh mục hiển thị
		ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc(txtFind);
		request.setAttribute("listdanhmuc", listdanhmuc);
		// Danh sách bài viết moi
		ArrayList<BAIVIET> topmoi = baiviet.getTopBaiViet("Moi");
		request.setAttribute("topmoi", topmoi);
		// Danh sách bài viết được ghim lên trang chủ
		ArrayList<BAIVIET> slidePosts = baiviet.getTopBaiViet("slidePosts");
		request.setAttribute("slidePosts", slidePosts);
		// Danh sách bài viết được ghim lên trang chủ
		ArrayList<BAIVIET> hotPosts = baiviet.getTopBaiViet("hotPosts");
		request.setAttribute("hotPosts", hotPosts);
		// Danh sách quảng cáo
		ArrayList<QUANGCAO> listquangcao = quangCaoBO.getDanhSachQuangCao((int) 1);
		request.setAttribute("listquangcao", listquangcao);
		ThongBaoBO thongBaoBO = new ThongBaoBO();
		// List thông báo
		ArrayList<THONGBAO> listthongbao = thongBaoBO.getListHienThi("", "1","DienDan");
		request.setAttribute("listthongbao", listthongbao);
		
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
		//Đóng kết nối database
		baiviet.closeConnection();
		quangCaoBO.closeConnection();
		danhmuc.closeConnection();
		thongBaoBO.closeConnection();
		request.getRequestDispatcher("TrangChu.jsp").forward(request, response);
	}

}
