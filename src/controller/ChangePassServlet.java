package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.ChangePassBO;

/**
 * Servlet implementation class ChangePassServlet
 */
@WebServlet("/admin/ChangePassServlet")
public class ChangePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassServlet() {
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
		
		String password = request.getParameter("password");
		String password_new = request.getParameter("password_new");
		String re_password =  request.getParameter("re_password");
		
		
		HttpSession session_user = request.getSession();
		String username =(String)session_user.getAttribute("username");	

		
		ChangePassBO changePassBo = new ChangePassBO();
		if(changePassBo.checkValid(password, password_new, re_password)){
			if(changePassBo.checkPassExist(password_new)){
				if(changePassBo.UpdatePass(password_new, username)){
					RequestDispatcher dispatcher = request.getRequestDispatcher("EditProfileServlet");
					request.setAttribute("result", "Cập nhật thành công - ログインができた。");
					changePassBo.closeConnection();
					dispatcher.forward(request, response);
				}
				else{
					request.setAttribute("error", "Cập nhật thất bại - ログインがまだできない。");
					RequestDispatcher dispatcher = request.getRequestDispatcher("Error.jsp");
					changePassBo.closeConnection();
					dispatcher.forward(request, response);
				}
			}
			else{
				request.setAttribute("error", "Mật khẩu không tồn tại trong hệ thống - ");
				RequestDispatcher dispatcher = request.getRequestDispatcher("Error.jsp");
				changePassBo.closeConnection();
				dispatcher.forward(request, response);
			}
		}else{
			request.setAttribute("error", "Dữ liệu không hợp lệ");
			RequestDispatcher dispatcher = request.getRequestDispatcher("Error.jsp");
			changePassBo.closeConnection();
			dispatcher.forward(request, response);
		}
	}

}
