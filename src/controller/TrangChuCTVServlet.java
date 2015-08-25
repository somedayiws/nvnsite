package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bean.TAIKHOAN;
import model.bo.BaiVietBO;

@WebServlet("/ctv/TrangChuCTVServlet")
public class TrangChuCTVServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TrangChuCTVServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
		if(user == null){
			request.setAttribute("meg", "");
			request.getRequestDispatcher("TrangChuCTV.jsp").forward(request, response);
		}else{
			BaiVietBO baiviet = new BaiVietBO();
			ArrayList<BAIVIET> listmoi = baiviet.getListPhanCong(user.getIdTaiKhoan(), "moi");
			ArrayList<BAIVIET> listtre = baiviet.getListPhanCong(user.getIdTaiKhoan(), "qua-han");
			request.setAttribute("listmoi", listmoi);
			request.setAttribute("listtre", listtre);
			request.getRequestDispatcher("HomeCTV.jsp").forward(request, response);
		}
	}
}
