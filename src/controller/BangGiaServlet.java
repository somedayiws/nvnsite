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

@WebServlet("/Gia-dich-vu")
public class BangGiaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BangGiaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		BaiVietBO baiviet = new BaiVietBO();
		DanhMucBO danhmuc = new DanhMucBO();
		TaiNguyenBO tainguyen = new TaiNguyenBO();
		ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc("");
		ArrayList<BAIVIET> topmoi = baiviet.getTopBaiViet("Moi");
		request.setAttribute("listdanhmuc", listdanhmuc);
		request.setAttribute("topmoi", topmoi);
		request.setAttribute("giadich", tainguyen.getValue("BangGiaDich"));
		request.setAttribute("giaquangcao", tainguyen.getValue("BangGiaQuangCao"));
		
		// List thông báo
		ThongBaoBO thongBaoBO = new ThongBaoBO();
		ArrayList<THONGBAO> listthongbao = thongBaoBO.getListHienThi("", "1",  "DienDan");
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
		
		request.setAttribute("ThongDiep", ThongDiep);
		request.setAttribute("LienHe", LienHe);
		request.setAttribute("DienThoai", DienThoai);
		request.setAttribute("Email", Email);
		
		tainguyenBO.closeConnection();
		baiviet.closeConnection();
		danhmuc.closeConnection();
		tainguyen.closeConnection();
		thongBaoBO.closeConnection();
		quangCaoBO.closeConnection();
		
		request.getRequestDispatcher("BangGia.jsp").forward(request, response);
	}

}
