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
import model.bo.TaiNguyenBO;
import model.bo.ThongBaoBO;

@WebServlet("/Xem-thong-bao")
public class ChiTietThongBaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChiTietThongBaoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try{
		BaiVietBO bv = new BaiVietBO();
		DanhMucBO danhmuc = new DanhMucBO();
		String id = request.getParameter("id");
		bv.setMenu(10, 10);
		// Danh mục hiển thị
		ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc("");
		// Danh sách bài viết host
		ArrayList<BAIVIET> topmoi = bv.getTopBaiViet("Moi");
		// List thông báo
		ThongBaoBO thongBaoBO = new ThongBaoBO();
		ArrayList<THONGBAO> listthongbao = thongBaoBO.getListHienThi("", "1","DienDan");
		request.setAttribute("listthongbao", listthongbao);

		// Danh sách quảng cáo
		QuangCaoBO quangCaoBO = new QuangCaoBO();
		ArrayList<QUANGCAO> listquangcao = quangCaoBO.getDanhSachQuangCao((int) 2);
		request.setAttribute("listquangcao", listquangcao);
		request.setAttribute("topmoi", topmoi);
		request.setAttribute("listdanhmuc", listdanhmuc);
		THONGBAO thongbao = thongBaoBO.getThongBao(id);
		if(thongbao !=null && (!thongbao.getGuiDen().equals("DienDan"))){
			thongBaoBO.setViewed(id);
		}
		request.setAttribute("thongbao", thongbao);
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
		bv.closeConnection();
		danhmuc.closeConnection();
		thongBaoBO.closeConnection();
		quangCaoBO.closeConnection();
		if(thongbao==null) response.sendRedirect("Trang-chu");
		else request.getRequestDispatcher("ChiTietThongBao.jsp").forward(request, response);
		}catch(Exception e){
			response.sendRedirect("Trang-chu");
		}
	}

}
