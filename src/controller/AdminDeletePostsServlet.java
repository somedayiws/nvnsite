package controller;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.AdminDeletePostsBO;
import model.bo.EmailUtility;
import model.bo.ShowAdminEditPostsBO;
import model.bo.ThongBaoBO;

/**
 * Servlet implementation class AdminDeletePostsServlet
 */
@WebServlet("/admin/AdminDeletePostsServlet")
public class AdminDeletePostsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeletePostsServlet() {
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
		String idPost =  request.getParameter("Idposts");
		
		/***
		 * fix send notice for user who post articles when delete posts
		 * date: 05 - 12 - 2015 
		 * 
		 * */
		ServletContext context = getServletContext();
		
		final String host = context.getInitParameter("host");
		final String port = context.getInitParameter("port");
		final String user1 = context.getInitParameter("user");
		final String pass = context.getInitParameter("pass");
		
		final String MESSAGE_1 = "Bài viết của bạn đã bị xóa";
		final String MESSAGE_2 = "Bài viết của bạn đã bị xóa vì không đúng nội quy của website";
		ShowAdminEditPostsBO checkID = new ShowAdminEditPostsBO();
		String message_input = request.getParameter("message_input");
		String message_default = request.getParameter("message_default");
		ThongBaoBO tb = new ThongBaoBO();
		final String tieude = "Thông báo hủy bài viết[記事を削除することのお知らせ] "+idPost;
		final String noidung = (message_input.trim().equals(""))? ((message_default.equals("message_2")) ? MESSAGE_2 : MESSAGE_1 ) : message_input;
		String guiden = checkID.post(idPost).getTaiKhoan().getTenTaiKhoan();
		System.out.println("Xuat thong bao huy bai thanh cong");
		tb.ThemThongBaoClient(tieude, noidung, guiden);
		/**end fix by Hai*/
		final String email = checkID.post(idPost).getTaiKhoan().getEmail();

		try {
			EmailUtility.sendEmailThread(host, port, user1, pass, email, tieude, noidung);
		} catch (AddressException e) {
			System.out.println("Lỗi : " + e.toString());
		} catch (MessagingException e) {
			System.out.println("Lỗi : " + e.toString());
		}
		
		String resultDelete;
		AdminDeletePostsBO admindeletePost = new AdminDeletePostsBO();
		
		if(admindeletePost.deletePost(idPost)){
			resultDelete = "Xóa bài viết thành công - 記事を削除することができた。";
		}
		else{
			resultDelete = "Xóa bài viết thất bại - 記事を削除することができない。";
		}
		
		
		request.setAttribute("resultDelete", resultDelete);
		RequestDispatcher requestDis_delete = request.getRequestDispatcher("ListPostsServlet");
		admindeletePost.closeConnection();
		requestDis_delete.forward(request, response);
	}

}
