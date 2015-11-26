package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.ThongBaoBO;

@WebServlet("/admin/HienThiThongBaoServlet")
public class HienThiThongBaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HienThiThongBaoServlet() {
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
		
		String id = request.getParameter("id");
		String hienthi = request.getParameter("hienthi");
		
		if(tb.SuaThongBao(id, hienthi)){
			if(hienthi.equals("1")) request.setAttribute("meg", "<div class='alert alert-success' role='alert'>Hiển thị thông báo thành công - 表示ができた.</div>");
			else request.setAttribute("meg", "<div class='alert alert-success' role='alert'>Gỡ bỏ thông báo thành công - 削除ができた.</div>");
		}else{
			if(hienthi.equals("1")) request.setAttribute("meg", "<div class='alert alert-danger' role='alert'>Hiển thị thông báo thất bại - お知らせの表示ができなかった.</div>");
			else request.setAttribute("meg", "<div class='alert alert-danger' role='alert'>Gỡ bỏ thông báo thất bại - お知らせの削除ができなかった.</div>");
		}
		tb.closeConnection();
		request.getRequestDispatcher("ThongBaoServlet").forward(request, response);
	}
	}
}
