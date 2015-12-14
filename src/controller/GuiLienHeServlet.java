package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.EmailUtility;
import model.bo.ThongBaoBO;

@WebServlet("/admin/GuiLienHeServlet")
public class GuiLienHeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GuiLienHeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String taikhoan =  request.getParameter("taikhoan");
		final String email =  request.getParameter("email");
		final String tieude =  request.getParameter("tieude");
		final String traloi =  request.getParameter("traloi");
		
		if(taikhoan!=null && !taikhoan.trim().equals("")){
			ThongBaoBO tb = new ThongBaoBO();
			tb.ThemThongBaoClient(tieude, traloi, taikhoan);
		}
		
		ServletContext context = getServletContext();
		
		final String host = context.getInitParameter("host");
		final String port = context.getInitParameter("port");
		final String user = context.getInitParameter("user");
		final String pass = context.getInitParameter("pass");
		String resultMessage = "xuly=loi-he-thong";
		try {
			EmailUtility.sendEmailThread(host, port, user, pass, email, tieude,traloi);
            resultMessage = "xuly=traloi-thanhcong";
        } catch (Exception ex) {
        	System.out.println("Lỗi : " + ex.toString());
            resultMessage = "xuly=traloi-thatbai";
        } finally {
            response.sendRedirect("LienHeServlet?" + resultMessage);
        }
	}
}
