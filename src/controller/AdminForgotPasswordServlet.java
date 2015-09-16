package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.AdminForgotPasswordBO;

/**
 * Servlet implementation class AdminForgotPasswordServlet
 */
@WebServlet("/admin/AdminForgotPasswordServlet")
public class AdminForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminForgotPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String result = null;//Không xử lý email
		System.out.println("email: "+email);
		
		AdminForgotPasswordBO forgotPass = new AdminForgotPasswordBO();
		if(forgotPass.checkValidate(email)){
			if(forgotPass.checkEmail(email)){
				String[] to = { email };
				String subject = "CỔNG THÔNG TIN VIỆT - NHẬT";
				String password = RandomPassword.password();
				if(forgotPass.updateEmail(password, email)){
					String body = "Khôi phục lại mật khẩu admin.Mật khẩu mới của bạn là: "+password+".Bạn nên thay đổi mật khẩu để dễ nhớ hơn";
					sendEmail.sendFromGMail(to, subject, body);
					response.sendRedirect("ShowloginAdmin");
				}
				else{
					result = "1";//Cập nhật mật khẩu không thành công
					request.setAttribute("result", result);
					RequestDispatcher requestDis = request.getRequestDispatcher("ForgotPassword.jsp");
					requestDis.forward(request, response);
					
				}					
			}else{
				result = "2";//Email không có trong hệ thống
				request.setAttribute("result", result);
				RequestDispatcher requestDis = request.getRequestDispatcher("ForgotPassword.jsp");
				requestDis.forward(request, response);
			}
		}else{
			result = "3";//Email không hợp lệ
			request.setAttribute("result", result);
			RequestDispatcher requestDis = request.getRequestDispatcher("ForgotPassword.jsp");
			requestDis.forward(request, response);
		}
		
		
		
		
	}

}
