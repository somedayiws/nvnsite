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
import model.bo.ThongBaoBO;

@WebServlet("/Tim-kiem")
public class TimKiemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TimKiemServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String txtFind = request.getParameter("txtFind");
		String theo = request.getParameter("categoryJa");
		if(txtFind == null) txtFind="";
		String vitri = request.getParameter("vitri");
		BaiVietBO baiviet = new BaiVietBO();
		DanhMucBO danhmuc = new DanhMucBO();
		ArrayList<BAIVIET> listbaiviet = new ArrayList<BAIVIET>();
		if(vitri != null && !"".equals(txtFind)){
			listbaiviet = baiviet.getFind(theo, txtFind, vitri, "10");
		}else{
			listbaiviet = baiviet.getFind(theo, txtFind, "0", "10");
		}
		ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc("");
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
		request.setAttribute("theo", theo);
		request.setAttribute("txtFind", txtFind);
		request.setAttribute("listbaiviet", listbaiviet);
		request.setAttribute("listdanhmuc", listdanhmuc);
		request.getRequestDispatcher("KetQuaTimKiem.jsp").forward(request, response);
	}

}
