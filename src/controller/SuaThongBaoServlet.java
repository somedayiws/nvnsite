package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.ThongBaoBO;

@WebServlet("/admin/SuaThongBaoServlet")
public class SuaThongBaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SuaThongBaoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ThongBaoBO tb = new ThongBaoBO();
		
		String id = request.getParameter("id");
		String tieude = request.getParameter("TieuDe");
		String noidung = request.getParameter("NoiDung");
		String guiden = request.getParameter("GuiDen");
		
		if(tb.SuaThongBao(id, tieude, noidung, guiden)){
			request.setAttribute("meg", "Cập nhật thông báo thành công.");
		}else{
			request.setAttribute("meg", "Cập nhật thông báo thất bại.");
		}
		
		request.getRequestDispatcher("ThongBaoServlet").forward(request, response);
	}

}
