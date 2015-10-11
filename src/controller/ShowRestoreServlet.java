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
import model.bean.DANHMUC;
import model.bean.TAIKHOAN;
import model.bo.RestoreDataBO;

/**
 * Servlet implementation class ShowRestoreServlet
 */
@WebServlet("/admin/ShowRestoreServlet")
public class ShowRestoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowRestoreServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String type = request.getParameter("type");
		String result_Restore = (String) request.getAttribute("result_Restore");
		doPost(request, response, type, result_Restore);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response, String type, String result_Restore)
			throws ServletException, IOException {
		// TODO Auto-generated method stub		
		
		//Check session exist
				HttpSession session_user = request.getSession();
				String username =(String)session_user.getAttribute("username");	
		if(username!=null){
		RestoreDataBO restoredata = new RestoreDataBO();
		String screen = request.getParameter("screen");
		
		
		if (result_Restore != null) {
			request.setAttribute("result_Restore", result_Restore);
			RequestDispatcher requestDis = null;
			if(result_Restore.contains("tài khoản")){
				requestDis = (screen.contains("CTV")) ? request.getRequestDispatcher("CTVServlet") : request.getRequestDispatcher("ListAccountServlet");				 
			}
			else if(result_Restore.contains("danh mục")){
				requestDis = request.getRequestDispatcher("ListCategoryServlet");					
			}
			else if(result_Restore.contains("bài viết")){
				requestDis = request.getRequestDispatcher("ListPostsServlet");				
			}
			restoredata.closeConnection();
			requestDis.forward(request, response);
		} else {
			if (type.contains("account")) {
				
				ArrayList<TAIKHOAN> listAccountDeleted = new ArrayList<TAIKHOAN>();
				listAccountDeleted = restoredata.listAccountDeleted(screen);

				request.setAttribute("screen", screen);
				request.setAttribute("listAccountDeleted", listAccountDeleted);
				
				RequestDispatcher requestDis_restoreAccount = request
						.getRequestDispatcher("RestoreAccount.jsp");
				restoredata.closeConnection();
				requestDis_restoreAccount.forward(request, response);

			}
			else if (type.contains("category")) {
				ArrayList<DANHMUC> listCategoryDeleted = new ArrayList<DANHMUC>();
				listCategoryDeleted = restoredata.listCategoryDeleted();

				request.setAttribute("listCategoryDeleted", listCategoryDeleted);
				RequestDispatcher requestDis_restoreAccount = request
						.getRequestDispatcher("RestoreCategory.jsp");
				restoredata.closeConnection();
				requestDis_restoreAccount.forward(request, response);
			}
			
			else if (type.contains("posts")) {
				ArrayList<BAIVIET> listPostsDeleted = new ArrayList<BAIVIET>();
				listPostsDeleted = restoredata.listPostsDeleted();

				request.setAttribute("listPostsDeleted", listPostsDeleted);
				RequestDispatcher requestDis_restoreAccount = request
						.getRequestDispatcher("RestorePosts.jsp");
				restoredata.closeConnection();
				requestDis_restoreAccount.forward(request, response);

			}
			else{
				restoredata.closeConnection();
				response.sendRedirect("ShowloginAdmin");
			}
		}
	}else{
		RequestDispatcher requestDis_restoreAccount = request
				.getRequestDispatcher("Login.jsp");
		requestDis_restoreAccount.forward(request, response);
	}
	}

}
