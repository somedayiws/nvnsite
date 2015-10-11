package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.LICHSU;
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
		TAIKHOAN accountErrorTranslate = getAcc.getAccErrorTranslate(idPost);
		ArrayList<TAIKHOAN> listAccountCTV = new ArrayList<TAIKHOAN>();
		listAccountCTV.add(accountErrorTranslate);
		ChangeStatusBO changeStatus = new ChangeStatusBO();
		
		//changeStatus.updateStatusHistory("LoiDich", idPost, accountErrorTranslate.getIdTaiKhoan());
		request.setAttribute("status", "LoiDich");
		request.setAttribute("listAccountCTV", listAccountCTV);
		request.setAttribute("accountErrorTranslate", accountErrorTranslate);
		request.setAttribute("note", changeStatus.getNotePost(idPost));
		request.setAttribute("idPost", idPost);
		RequestDispatcher dispatcher = request.getRequestDispatcher("SendPost.jsp");
		getAcc.closeConnection();
		changeStatus.closeConnection();
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
