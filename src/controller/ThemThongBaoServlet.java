package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.ThongBaoBO;

@WebServlet("/admin/ThemThongBaoServlet")
public class ThemThongBaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ThemThongBaoServlet() {
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
		ThongBaoBO tb = new ThongBaoBO();
		
		String tieude = request.getParameter("TieuDe");
		String noidung = request.getParameter("NoiDung");
		String guiden = request.getParameter("GuiDen");
		if(guiden.equals("DienDan")){
			if(tb.ThemThongBao(tieude, noidung, guiden)){
				request.setAttribute("meg", "<div class='alert alert-success' role='alert'>Thêm thông báo thành công.</div>");
			}else{
				request.setAttribute("meg", "<div class='alert alert-danger' role='alert'>Thêm thông báo thất bại.</div>");
			}
		}
		else{
			if(tb.ThemThongBaoClient(tieude, noidung, guiden)){
				request.setAttribute("meg", "<div class='alert alert-success' role='alert'>Thêm thông báo thành công.</div>");
			}else{
				request.setAttribute("meg", "<div class='alert alert-danger' role='alert'>Thêm thông báo thất bại.</div>");
			}
		}
		tb.closeConnection();
		request.getRequestDispatcher("ThongBaoServlet").forward(request, response);
	}
	}
}
