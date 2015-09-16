package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowloginAdmin
 */
@WebServlet("/admin/ShowloginAdmin")
public class ShowloginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowloginAdmin() {
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
		RequestDispatcher requestDis;
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;
		int isCookie = 0;
		if(cookies!=null){
			
			for (int i=0; i<cookies.length; i++)
			{
				cookie = cookies[i];
				if(cookie.getName().equals("username") && cookie.getValue().equals("admin")){
					isCookie = 1;
					break;
				} 			
			}
			if(isCookie==1){			
				 requestDis = request.getRequestDispatcher("ShowHomeServlet.jsp");
							
			}else{
				 requestDis = request.getRequestDispatcher("Login.jsp");
			
			}
		}
		else{
			 requestDis = request.getRequestDispatcher("Login.jsp");
		}
		requestDis.forward(request, response);
	}

}
