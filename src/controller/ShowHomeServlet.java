package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.BAIVIET;
import model.bo.ListPostsBO;

/**
 * Servlet implementation class ShowHomeServlet
 */
@WebServlet("/admin/ShowHomeServlet")
public class ShowHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowHomeServlet() {
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
		//Check session exist
		HttpSession session_user = request.getSession();
		String username =(String)session_user.getAttribute("username");	
	
		if(username!=null){
			ListPostsBO listPost = new ListPostsBO();
			int page = 1;
			listPost.setMenu(10, 5);
			try {
				page = Integer.parseInt(request.getParameter("page"));
			} catch (NumberFormatException e) {
				page = 1;
			}
			ArrayList<BAIVIET> postsNew = listPost.getPostsNew(page);
			
		
			String pageNav = listPost.getMenuPhanTrang();		
			
			
			request.setAttribute("pageNav", pageNav);
			request.setAttribute("postsNew", postsNew);
			listPost.closeConnection();
			requestDis = request.getRequestDispatcher("Home(Admin).jsp");
		}
		else{
			 requestDis = request.getRequestDispatcher("Login.jsp");
		}
		requestDis.forward(request, response);
		
	}

}
