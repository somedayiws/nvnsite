package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;

@WebServlet("/Dang-xuat")
public class DangXuatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DangXuatServlet() {
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
		request.getSession().invalidate();
		if(user.getQuyenQuanTri().equals("admin")){
			response.sendRedirect("admin/Login.jsp");
		}else if(user.getQuyenQuanTri().equals("ctv")){
			response.sendRedirect("ctv/Dang-nhap");
		}else {
			response.sendRedirect("Trang-chu");
		}
		
	}

}
