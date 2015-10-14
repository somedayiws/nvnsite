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

@WebServlet("/Danh-sach-bai-viet")
public class DanhSachBaiVietServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DanhSachBaiVietServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		try{
		if(id != null && !"".equals(id)){
			BaiVietBO baiviet = new BaiVietBO();
			DanhMucBO danhmuc = new DanhMucBO();
			ArrayList<BAIVIET> listbaiviet = new ArrayList<BAIVIET>();
			listbaiviet = baiviet.getDanhSachBaiViet(id, 0, "10");
			ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc("");
			ArrayList<BAIVIET> topmoi = baiviet.getTopBaiViet("Moi");
			request.setAttribute("topmoi", topmoi);
			DANHMUC dmchon = danhmuc.getDanhMuc(id);
			request.setAttribute("danhmuc", dmchon);
			request.setAttribute("listbaiviet", listbaiviet);
			request.setAttribute("listdanhmuc", listdanhmuc);
			
			// List thông báo
			ThongBaoBO thongBaoBO = new ThongBaoBO();
			ArrayList<THONGBAO> listthongbao = thongBaoBO.getListHienThi("","1", "DienDan");
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
			thongBaoBO.closeConnection();
			quangCaoBO.closeConnection();
			if(dmchon==null || listbaiviet==null) response.sendRedirect("Trang-chu");
			else request.getRequestDispatcher("DanhSachBaiViet.jsp").forward(request, response);
		}else{
			response.sendRedirect("Trang-chu");
		}
		}catch (Exception e){
			response.sendRedirect("Trang-chu");
		}
	}

}
