package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.LoginBO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/admin/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember_me = request.getParameter("remember-me");
		String result=null;
		if(username==null || password==null){
			request.setAttribute("result", "Bạn chưa đăng nhập hệ thống!<br>システムをログインしなかった!");
			RequestDispatcher requestDis = request.getRequestDispatcher("Login.jsp");
			requestDis.forward(request, response);
		}else{
		LoginBO checkLogin = new LoginBO();
		if(checkLogin.checkValidate(username, password)){
				if(checkLogin.checkLogin(username, password)){
					HttpSession session = request.getSession();
					session.setAttribute("username", username);
					
					if(remember_me!=null){
					   Cookie user = new Cookie("username",username);
					 
					   // Set expiry date after 24 Hrs for both the cookies.
					   user.setMaxAge(60*60*24); 
					  
					   // Add both the cookies in the response header.
					   response.addCookie(user);
					  
					}
					
					checkLogin.closeConnection();
					response.sendRedirect("ShowHomeServlet");
				}
				else{
					result = "2";//Acc không tồn tại trong hệ thống
					request.setAttribute("result", result);
					RequestDispatcher requestDis = request.getRequestDispatcher("Login.jsp");
					checkLogin.closeConnection();
					requestDis.forward(request, response);
				}
		}else{
			result = "1";//Username và password không hợp lệ
			request.setAttribute("result", result);
			RequestDispatcher requestDis = request.getRequestDispatcher("Login.jsp");
			checkLogin.closeConnection();
			requestDis.forward(request, response);
		}
	}
	}
}
