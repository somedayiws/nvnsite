package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.THONGBAO;
import model.bo.ThongBaoBO;

@WebServlet("/admin/ThongBaoServlet")
public class ThongBaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ThongBaoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		if(request.getSession().getAttribute("username")==null){
			response.sendRedirect("LoginServlet");
		}else{
		ThongBaoBO thongBaoBO = new ThongBaoBO();
		String timtheo = request.getParameter("timtheo");
		String txtFind = request.getParameter("txtFind");
		if(txtFind==null) txtFind = "";
		if(timtheo==null) timtheo = "1";
		int page = 1;
		thongBaoBO.setMenu(10, 10);
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
		ArrayList<THONGBAO> listhienthi = thongBaoBO.getListHienThi("DienDan", timtheo, txtFind);
		ArrayList<THONGBAO> listan = thongBaoBO.getListKhongHienThi("", timtheo, txtFind, page);
		String pageNav = thongBaoBO.getMenuPhanTrang();
		request.setAttribute("pageNav", pageNav);
		request.setAttribute("listhienthi", listhienthi);
		request.setAttribute("listan", listan);
		thongBaoBO.closeConnection();
		request.getRequestDispatcher("ThongBao.jsp").forward(request, response);
	}
	}
}
