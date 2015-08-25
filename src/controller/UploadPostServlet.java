package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.ChangeStatusBO;
import model.bo.ShowAdminEditPostsBO;

/**
 * Servlet implementation class UploadPostServlet
 */
@WebServlet("/admin/UploadPostServlet")
public class UploadPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idPost = request.getParameter("idPost");
		ShowAdminEditPostsBO checkID = new ShowAdminEditPostsBO();
		ChangeStatusBO updateStatus = new ChangeStatusBO();
		if(idPost!=null && checkID.checkExist_Post(idPost)){
			updateStatus.changeStatusPost("OK", idPost, "Đã hoàn thành");
			response.sendRedirect("ListPostsServlet");
			
		}else{
			response.sendRedirect("Error.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
