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

@WebServlet("/DanhSachBaiVietServlet")
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
		BaiVietBO baiviet = new BaiVietBO();
		DanhMucBO danhmuc = new DanhMucBO();
		ArrayList<BAIVIET> listbaiviet = new ArrayList<BAIVIET>();
		if(id != null && !"".equals(id)){
			listbaiviet = baiviet.getDanhSachBaiViet(id, "10");
			ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc("");
			ArrayList<BAIVIET> topbaiviet = baiviet.getTopBaiViet();
			request.setAttribute("listbaiviet", listbaiviet);
			request.setAttribute("listdanhmuc", listdanhmuc);
			request.setAttribute("topbaiviet", topbaiviet);
			request.getRequestDispatcher("DanhSachBaiViet.jsp").forward(request, response);
		}else{
			response.sendRedirect("TrangChuServlet");
		}
	}

}
