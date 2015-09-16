package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.EmailUtility;
import model.bo.TaiKhoanBO;

@WebServlet("/ctv/CTVResetMatKhauServlet")
public class CTVResetMatKhauServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CTVResetMatKhauServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String taikhoan = request.getParameter("taikhoan");
		
		if(taikhoan != null){
			ServletContext context = getServletContext();
			
			String host = context.getInitParameter("host");
			String port = context.getInitParameter("port");
			String user = context.getInitParameter("user");
			String pass = context.getInitParameter("pass");
			TaiKhoanBO ctv = new TaiKhoanBO();
			TAIKHOAN tk = ctv.getTaiKhoan(taikhoan, "reset");
			if(tk != null){
				String email = tk.getEmail();
				tk.setMatKhau(RandomPassword.password());
				String tieude = "Reset mật khẩu tài khoản cộng tác viên";
				String noidung = "Chào " + tk.getHoTen() + "\nĐây là thông tin tài khoản của bạn sau khi reset\n Tài khoản : " 
				+ tk.getTenTaiKhoan() + "\n Mật khẩu : " + tk.getMatKhau() + "\n Vui lòng đăng nhập sớm và cập nhật lại mật khẩu của bạn.\n Cám ơn nhiều!";
				ctv.UpdateThongTin(tk);
				String resultMessage = "";
				try {
		            EmailUtility.sendEmail(host, port, user, pass, email, tieude,noidung);
		            resultMessage = "<div class='alert alert-success' role='alert'><p>Đã reset mật khẩu xong. Vui lòng vào mail kiểm tra lại. Cám ơn!</p></div>";
		        } catch (Exception ex) {
		            ex.printStackTrace();
		            resultMessage = "<div class='alert alert-danger' role='alert'><p>Tài khoản không tồn tại. Vui lòng kiểm tra lại." + ex.getMessage() + "</p></div>";
		        } finally {
		            request.setAttribute("meg", resultMessage);
		            request.getRequestDispatcher("ResetMatKhau.jsp").forward(request, response);
		        }
			}else{
				request.setAttribute("meg", "<div class='alert alert-danger' role='alert'><p>Tài khoản không tồn tại. Vui lòng kiểm tra lại.</p></div>");
	            request.getRequestDispatcher("ResetMatKhau.jsp").forward(request, response);
			}
		}else{
			response.sendRedirect("ResetMatKhau.jsp");
		}			
	}

}
