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

@WebServlet("/TimKiemServlet")
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
		System.out.println(txtFind);
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
		ArrayList<BAIVIET> topbaiviet = baiviet.getTopBaiViet("XemNhieu");
		ArrayList<BAIVIET> topmoi = baiviet.getTopBaiViet("Moi");
		request.setAttribute("topmoi", topmoi);
		request.setAttribute("theo", theo);
		request.setAttribute("txtFind", txtFind);
		request.setAttribute("listbaiviet", listbaiviet);
		request.setAttribute("listdanhmuc", listdanhmuc);
		request.setAttribute("topbaiviet", topbaiviet);
		request.getRequestDispatcher("KetQuaTimKiem.jsp").forward(request, response);
	}

}
