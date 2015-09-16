package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.TAIKHOAN;
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
		String idPost = request.getParameter("idPost");
		ShowAdminEditPostsBO checkID = new ShowAdminEditPostsBO();
		ChangeStatusBO updateStatus = new ChangeStatusBO();
		if(idPost!=null && checkID.checkExist_Post(idPost)){
			HttpSession session = request.getSession();
			String username = (String)session.getAttribute("username");
			
			ListAccountBO acc = new ListAccountBO();
			TAIKHOAN account = acc.getAccountbyUser(username);
			 @SuppressWarnings("unused")
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		       //get current date time with Date()
		       Date date = new Date();
			updateStatus.changeStatusHistory("DangDich", idPost, account.getIdTaiKhoan(),date);
			response.sendRedirect("ShowDetailPostsServlet?id="+idPost);
			
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
