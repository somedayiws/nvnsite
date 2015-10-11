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
import javax.servlet.http.HttpSession;

import model.bean.BAIVIET;
import model.bean.LICHSU;
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
		
		//Check session exist
				HttpSession session_user = request.getSession();
				String username =(String)session_user.getAttribute("username");	
			
				if(username!=null){
		String idPost = request.getParameter("idPost");
		TAIKHOAN accountErrorTranslate = (TAIKHOAN)request.getAttribute("accountErrorTranslate");
		
		//Lấy trường ghi chú của bài viết
		ChangeStatusBO changeStatusBo = new ChangeStatusBO();
		String note = changeStatusBo.getNotePost(idPost);
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
			ArrayList<TAIKHOAN> listAccountCTV = null;
			
			if (post.getTenBaiVietVi()!=null && post.getTenBaiVietJa()!=null) {
				listAccountCTV = listAcc.getDataAccountInfor(0,listAcc.totalRecord(),"CTV","mutilanguage");				
			} else if (post.getTenBaiVietVi()!=null){
				//Bài viết là tiếng nhật
				languagePost = "2";
				listAccountCTV = listAcc.getDataAccountInfor(0,listAcc.totalRecord(),"CTV","vi");
			} else if (post.getTenBaiVietJa()!=null) {
				//Bài viết là tiếng việt
				languagePost = "1";
				listAccountCTV = listAcc.getDataAccountInfor(0,listAcc.totalRecord(),"CTV","ja");
			}
			
			ListStatusHistoryBO listStatus = new ListStatusHistoryBO();
			LICHSU history = listStatus.getStatus(idPost);
			String status = history.getTrangThai();
			if(history.getTrangThai()!=null && history.getTrangThai().contains("HuyDich")){
				ArrayList<TAIKHOAN> listAccountByStatus = null;
				if (post.getTenBaiVietVi()!=null && post.getTenBaiVietJa()!=null) {
					listAccountByStatus = getAcc.listAccountByStatus(history.getTaikhoan().getIdTaiKhoan(),"mutilanguage");			
				} else if (post.getTenBaiVietVi()!=null){
					//Bài viết là tiếng nhật
					listAccountByStatus = getAcc.listAccountByStatus(history.getTaikhoan().getIdTaiKhoan(),"vi");
				} else if (post.getTenBaiVietJa()!=null) {
					//Bài viết là tiếng việt
					listAccountByStatus = getAcc.listAccountByStatus(history.getTaikhoan().getIdTaiKhoan(),"ja");
				}
				request.setAttribute("listAccountByStatus", listAccountByStatus);
				
			}
			request.setAttribute("note", note);
			request.setAttribute("languagePost", languagePost);
			request.setAttribute("accountErrorTranslate", accountErrorTranslate);
			request.setAttribute("idPost", idPost);
			request.setAttribute("listAccountCTV", listAccountCTV);
			request.setAttribute("status", status);
			RequestDispatcher requestDis = request
					.getRequestDispatcher("SendPost.jsp");
			changeStatusBo.closeConnection();
			requestDis.forward(request, response);
	
				}else{
					RequestDispatcher requestDis = request
							.getRequestDispatcher("Login.jsp");
					requestDis.forward(request, response);
				}	
	
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
		String status = request.getParameter("status");
		
		ChangeStatusBO changestatus = new ChangeStatusBO();
		if(status.contains("LoiDich")){
			changestatus.changeStatusHistory("LoiDich", idPost,idAccount);
			//changestatus.changeStatusPost("DangDich", idPost, message);
		}
		else{
			changestatus.changeStatusHistory("ChuyenDich", idPost,idAccount);
		}
		changestatus.changeStatusPost("DangDich", idPost,message);
		request.setAttribute("resultSend", "Bài viết đã được chuyển cho cộng tác viên - 記事が協力者に転送できた。");
		request.setAttribute("idPost", idPost);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowDetailPostsServlet");
		changestatus.closeConnection();
		dispatcher.forward(request, response);

	}

}
