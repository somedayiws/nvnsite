package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.ChangeStatusBO;
import model.bo.ListAccountBO;

/**
 * Servlet implementation class BanAccountServlet
 */
@WebServlet("/admin/BanAccountServlet")
public class BanAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BanAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		
		/**Thay đổi trạng thái người dùng
		 * Các trạng thái người dùng: 
		 * 		MoiTao: Mới được tạo
		 * 		CanhCao1: Cảnh cáo lần 1
		 * 		CanhCao2: Cảnh cáo lần 2
		 * 		CanhCao3: Cảnh cáo lần 3
		 * 		KhoaTK	: Khóa tài khoản
		 * 
		 * */
		
		/*Lấy trạng thái của user
		 * MoiTao -> CanhCao1 -> CanhCao2 -> CanhCao3 -> KhoaTK
		 */
		
		 final String MoiTao	=	"MoiTao";
		 final String CanhCao1	=	"CanhCao1";
		 final String CanhCao2	=	"CanhCao2";
		 final String CanhCao3	=	"CanhCao3";
		 final String KhoaTK	=	"KhoaTK";
		 final String DaKhoa 	=	"DaKhoa";
		
		 String statusChange;
		 String resultChangeStatusAccount;
		 /**
		  * resultChangeStatusAccount:
		  * 	1: Lỗi trạng thái không hợp lệ.
		  * 	2: Lỗi tài khoản này đã bị khóa.
		  * 	3: Lỗi thay đổi trạng thái.
		  * 	4: Thay đổi thành công.
		  * */
		 
		ListAccountBO listAccountBo = new ListAccountBO();
		
		String statusAccount = listAccountBo.getStatusAccount(id);
		
		if(statusAccount.equals(MoiTao)) 		statusChange = CanhCao1;
		else if(statusAccount.equals(CanhCao1)) statusChange = CanhCao2;
		else if(statusAccount.equals(CanhCao2)) statusChange = CanhCao3;
		else if(statusAccount.equals(CanhCao3)) statusChange = KhoaTK;
		else if(statusAccount.equals(KhoaTK))	statusChange = DaKhoa;
		else									statusChange	= null;
		/*Thay đổi trạng thái tài khoản*/
		 
		if(statusChange!=null)
		{
			if(!statusChange.equals(DaKhoa)){
				ChangeStatusBO changeStatusBo = new ChangeStatusBO();
				
				if(changeStatusBo.changeStatusAccount(id, statusChange)){
					resultChangeStatusAccount = "Thay đổi thành công";
				}
				else{
					resultChangeStatusAccount = "Lỗi thay đổi trạng thái";
				}
			}
			else{
				resultChangeStatusAccount = "Lỗi tài khoản này đã bị khóa.";
			}
		}else{
			resultChangeStatusAccount = "Lỗi trạng thái không hợp lệ";
		}
		request.setAttribute("result", statusChange);
		request.setAttribute("notice", resultChangeStatusAccount);
		request.setAttribute("id", id);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("MessageAccount.jsp");
		listAccountBo.closeConnection();
		requestDispatcher.forward(request, response);
		
	}

}
