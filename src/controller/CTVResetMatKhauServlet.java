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

@WebServlet("/ctv/Reset-mat-khau")
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
				String tieude = "Reset mật khẩu tài khoản cộng tác viên - 協力者のパスワードをリセットする。";
				String noidung = "\nĐây là thông tin tài khoản của bạn sau khi reset\n Tài khoản : " 
				+ tk.getTenTaiKhoan() + "\n Mật khẩu : " + tk.getMatKhau() + "これはアカウントがリセットされた後、あなたのアカウントです。: "+tk.getTenTaiKhoan()+" パスワード : "+tk.getMatKhau()+"早めにアクセスください。" 
				+"\n Vui lòng đăng nhập sớm và cập nhật lại mật khẩu của bạn.\n新たなパスワードをログイン下さい。\n Cám ơn nhiều!\nありがとう";
				ctv.UpdateThongTin(tk);
				String resultMessage = "";
				try {
		            EmailUtility.sendEmail(host, port, user, pass, email, tieude,noidung);
		            resultMessage = "<div class='alert alert-success' role='alert'><p>Đã reset mật khẩu xong. Vui lòng vào mail kiểm tra lại. Cám ơn!<br>パスワードがリセットできた。メールで改めて確認ください。ありがとう</p></div>";
		        } catch (Exception ex) {
		            ex.printStackTrace();
		            resultMessage = "<div class='alert alert-danger' role='alert'><p>Tài khoản không tồn tại. Vui lòng kiểm tra lại.<br>アカウントを存しない。改めて確認ください。</p></div>";
		        } finally {
		            request.setAttribute("meg", resultMessage);
		            ctv.closeConnection();
		            request.getRequestDispatcher("ResetMatKhau.jsp").forward(request, response);
		        }
			}else{
				request.setAttribute("meg", "<div class='alert alert-danger' role='alert'><p>Tài khoản không tồn tại. Vui lòng kiểm tra lại.<br>アカウントを存しない。改めて確認ください。</p></div>");
				ctv.closeConnection();
				request.getRequestDispatcher("ResetMatKhau.jsp").forward(request, response);
			}
		}else{
			request.setAttribute("meg", "<div class='alert alert-info' role='alert'><p>Hãy nhập tài khoản cộng tác viên của bạn bên dưới và click vào button \"Lấy mật khẩu - ログイン\". Kiểm tra lại email của bạn đã đăng ký với chúng tôi để lấy lại mật khẩu. Cám ơn!<br>以下のボタンをクリックし、協力者のアカウントを入力してください。パスワードを収得し、ログイン\"。パスワードを収得するため、申請されたメールを改めて確認して下さい。ありがとう。</p></div>");
			request.getRequestDispatcher("ResetMatKhau.jsp").forward(request, response);
		}			
	}

}
