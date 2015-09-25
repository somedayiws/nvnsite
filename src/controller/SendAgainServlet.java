package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.ChangeStatusBO;
import model.bo.GetAccountBO;
import model.bo.ListAccountBO;
import model.bo.ListStatusHistoryBO;

/**
 * Servlet implementation class SendAgainServlet
 */
@WebServlet("/admin/SendAgainServlet")
public class SendAgainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendAgainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String idPost = request.getParameter("idPost");
		GetAccountBO getAcc = new GetAccountBO();
		TAIKHOAN accountErrorTranslate = getAcc.getAccErrorTranslate("DaDich");
		
		ChangeStatusBO changeStatus = new ChangeStatusBO();
		
		
		changeStatus.updateStatusHistory("LoiDich", idPost, accountErrorTranslate.getIdTaiKhoan());
		
		 ListStatusHistoryBO listStatus = new ListStatusHistoryBO();
			String status = listStatus.getStatus(idPost);
		 request.setAttribute("idPost", idPost);
		 request.setAttribute("accountErrorTranslate", accountErrorTranslate);
		 ListAccountBO listAcc = new ListAccountBO();
		 ArrayList<TAIKHOAN> accounts = listAcc.getDataAccountInfor(1);
		 request.setAttribute("accounts", accounts);
		 request.setAttribute("status", status);
			RequestDispatcher requestDis = request
					.getRequestDispatcher("SendPost.jsp");
			requestDis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
