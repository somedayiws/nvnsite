package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.TAIKHOAN;
import model.bo.ListAccountBO;

/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/admin/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileServlet() {
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
		
		HttpSession session_user = request.getSession();
		String username =(String)session_user.getAttribute("username");
		
		if(username!=null){
				ListAccountBO listAccountBo = new ListAccountBO();
				TAIKHOAN account = listAccountBo.getAccountbyUser(username);
				request.setAttribute("result",(String)request.getAttribute("result"));
				request.setAttribute("account", account);
				RequestDispatcher dispatcher = request.getRequestDispatcher("editProfile.jsp");
			    dispatcher.forward(request, response);
		}else{
			RequestDispatcher dispatcher = request.getRequestDispatcher("ShowloginAdmin");
		    dispatcher.forward(request, response);
		}
	}

}
