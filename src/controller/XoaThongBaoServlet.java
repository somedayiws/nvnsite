package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.ThongBaoBO;

@WebServlet("/admin/XoaThongBaoServlet")
public class XoaThongBaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XoaThongBaoServlet() {
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
		
		if(tb.XoaThongBao(id)){
			request.setAttribute("meg", "<div class='alert alert-success' role='alert'>Xóa thông báo thành công - お知らせの削除ができた.</div>");
		}else{
			request.setAttribute("meg", "<div class='alert alert-danger' role='alert'>Xóa thông báo thất bại - お知らせの削除がまだできなかった.</div>");
		}
		tb.closeConnection();
		request.getRequestDispatcher("ThongBaoServlet").forward(request, response);
	}
	}
}
