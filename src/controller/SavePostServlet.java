package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.BAIVIET;
import model.bean.TAIKHOAN;
import model.bo.AdminEditPostsBO;
import model.bo.ChangeStatusBO;
import model.bo.ListAccountBO;
import model.bo.ShowAdminEditPostsBO;

/**
 * Servlet implementation class SavePostServlet
 */
@WebServlet("/admin/SavePostServlet")
public class SavePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SavePostServlet() {
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
		BAIVIET post =(BAIVIET) request.getAttribute("post");
		
		String resultSave;
		AdminEditPostsBO adminEditPostBo = new AdminEditPostsBO();
		if(adminEditPostBo.updatePost_Translated(post)){
			resultSave = "Lưu bài viết thành công - 記事が保存できた";
		}
		else{
			resultSave = "Lưu bài viết thất bại - 記事が保存できない";
		}
		
		ShowAdminEditPostsBO checkID = new ShowAdminEditPostsBO();
		ChangeStatusBO updateStatus = new ChangeStatusBO();
		if(post.getIdBaiViet()!=null && checkID.checkExist_Post(post.getIdBaiViet())){
			HttpSession session = request.getSession();
			String username = (String)session.getAttribute("username");
			
			ListAccountBO acc = new ListAccountBO();
			TAIKHOAN account = acc.getAccountbyUser(username);
		       //get current date time with Date()
			updateStatus.changeStatusHistory("DangDich", post.getIdBaiViet(), account.getIdTaiKhoan());
			updateStatus.changeStatusPost("DangDich", post.getIdBaiViet(), "Đang dịch");
			request.setAttribute("resultSave", resultSave);
			request.setAttribute("idPost", post.getIdBaiViet());
			RequestDispatcher dispatcher = request.getRequestDispatcher("ShowDetailPostsServlet");
			adminEditPostBo.closeConnection();
			checkID.closeConnection();
			updateStatus.closeConnection();
			adminEditPostBo.closeConnection();
			dispatcher.forward(request, response);
		}else{
			adminEditPostBo.closeConnection();
			checkID.closeConnection();
			updateStatus.closeConnection();
			adminEditPostBo.closeConnection();
			response.sendRedirect("Error.jsp");
		}
	}

}
