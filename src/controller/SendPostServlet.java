package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bean.TAIKHOAN;
import model.bo.ChangeStatusBO;
import model.bo.GetAccountBO;
import model.bo.ListAccountBO;
import model.bo.ListStatusHistoryBO;
import model.bo.ShowAdminEditPostsBO;

/**
 * Servlet implementation class SendPostServlet
 */
@WebServlet("/admin/SendPostServlet")
public class SendPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendPostServlet() {
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
		request.setCharacterEncoding("UTF-8");
		String idPost = request.getParameter("idPost");
		
		/**
		 * Biến để lưu ngôn ngữ bài viết
		 * 0 : Song ngữ
		 * 1 : Tiếng việt
		 * 2 : Tiếng nhật 
		 * */
		String languagePost = "0";
		
		
			ListAccountBO listAcc = new ListAccountBO();
			GetAccountBO getAcc = new GetAccountBO();
			
			//Xác định ngôn ngữ của bài viết
			ShowAdminEditPostsBO getPost = new ShowAdminEditPostsBO();
			BAIVIET post = getPost.post(idPost);
											
			if(post.getTenBaiVietJa().equals("null") && post.getMoTaJa().equals("null") && post.getNoiDungJa().equals("null")){
				//Bài viết là tiếng việt
				languagePost = "1";
			}
			if(post.getTenBaiVietVi().equals("null") && post.getMoTaVi().equals("null") && post.getNoiDungVi().equals("null")){
				//Bài viết là tiếng nhật
				languagePost = "2";
			}
			
			
			ListStatusHistoryBO listStatus = new ListStatusHistoryBO();
			String status = listStatus.getStatus(idPost);
			ArrayList<TAIKHOAN> listAccountCTV = listAcc.getDataAccountInfor(0,listAcc.totalRecord(),"CTV");
			ArrayList<TAIKHOAN> listAccountByStatus = getAcc.listAccountByStatus("HuyDich");
			
			request.setAttribute("languagePost", languagePost);
			request.setAttribute("listAccountByStatus", listAccountByStatus);
			request.setAttribute("idPost", idPost);
			request.setAttribute("listAccountCTV", listAccountCTV);
			request.setAttribute("status", status);
			RequestDispatcher requestDis = request
					.getRequestDispatcher("SendPost.jsp");
			requestDis.forward(request, response);
	
			
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String idPost = request.getParameter("idPost");
		String idAccount = request.getParameter("idAccount");
		String message = request.getParameter("message");
		
		System.out.println("idPost: "+idPost);
		System.out.println("idAccount: "+idAccount);
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	       //get current date time with Date()
	       Date date = new Date();
	       System.out.println("date: "+dateFormat.format(date));
		ChangeStatusBO changestatus = new ChangeStatusBO();
		changestatus.changeStatusHistory("ChuyenDich", idPost,idAccount,date);
		changestatus.changeStatusPost("DangDich", idPost,message);
		response.sendRedirect("ShowDetailPostsServlet?id="+idPost);

	}

}
