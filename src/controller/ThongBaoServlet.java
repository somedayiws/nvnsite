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
		ThongBaoBO thongBaoBO = new ThongBaoBO();
		ArrayList<THONGBAO> listhienthi = thongBaoBO.getListHienThi("");
		ArrayList<THONGBAO> listan = thongBaoBO.getListKhongHienThi("", "0", "10");
		request.setAttribute("listhienthi", listhienthi);
		request.setAttribute("listan", listan);
		request.getRequestDispatcher("ThongBao.jsp").forward(request, response);
	}

}
