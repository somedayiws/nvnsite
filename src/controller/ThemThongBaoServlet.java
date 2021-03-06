package controller;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.EmailUtility;
import model.bo.TaiKhoanBO;
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
		
		final String tieude = request.getParameter("TieuDe");
		final String noidung = request.getParameter("NoiDung");
		String guiden = request.getParameter("GuiDen");
		if(guiden.equals("DienDan")){
			if(tb.ThemThongBao(tieude, noidung, guiden)){
				request.setAttribute("meg", "<div class='alert alert-success' role='alert'>Thêm thông báo thành công - 知らせの付加ができた.</div>");
			}else{
				request.setAttribute("meg", "<div class='alert alert-danger' role='alert'>Thêm thông báo thất bại - 知らせの付加がまだできなかった.</div>");
			}
		}
		else{
			if(tb.ThemThongBaoClient(tieude, noidung, guiden)){
				request.setAttribute("meg", "<div class='alert alert-success' role='alert'>Thêm thông báo thành công - 知らせの付加ができた.</div>");
				TaiKhoanBO tk = new TaiKhoanBO();
				TAIKHOAN tkhoan = tk.getTaiKhoanByKey(guiden);
				final String email = tkhoan.getEmail();
				
				ServletContext context = getServletContext();
				final String host = context.getInitParameter("host");
				final String port = context.getInitParameter("port");
				final String user = context.getInitParameter("user");
				final String pass = context.getInitParameter("pass");
				
				try {
					EmailUtility.sendEmailThread(host, port, user, pass, email, tieude,noidung);
				} catch (AddressException e) {
					System.out.println("Lỗi : " + e.toString());
				} catch (MessagingException e) {
					System.out.println("Lỗi : " + e.toString());
				}
			}else{
				request.setAttribute("meg", "<div class='alert alert-danger' role='alert'>Thêm thông báo thất bại - 知らせの付加がまだできなかった.</div>");
			}
		}
		tb.closeConnection();
		request.getRequestDispatcher("ThongBaoServlet").forward(request, response);
	}
	}
}
