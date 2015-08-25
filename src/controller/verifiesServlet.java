package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;



@WebServlet("/verifiesServlet")
public class verifiesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public verifiesServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		//Lấy địa chỉ IP của người dùng
		String remoteAddr = request.getRemoteAddr();
		//Nhận giá trị 2 biến do Ajax Engine gửi đến
		String challenge = request.getParameter("recaptcha_challenge_field");
		String uresponse = request.getParameter("recaptcha_response_field");
		
		ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
		reCaptcha.setPrivateKey("6LcUfwsTAAAAAA3VD4c_O4wK66-0AxVccisDCx8m");
		ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse); 
		if(reCaptchaResponse.isValid()) //Kiểm tra hợp lệ của response
		    request.setAttribute("ketqua", "valid"); //Trả về kết quả cho Ajax Engine
		else 
			request.setAttribute("ketqua", "fail");
		request.getRequestDispatcher("ketqua.jsp").forward(request, response);
	}
}
