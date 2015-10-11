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
import model.bo.AdminSearchBO;

/**
 * Servlet implementation class AdminSearchSevlet
 */
@WebServlet("/admin/AdminSearchSevlet")
public class AdminSearchSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminSearchSevlet() {
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		String type = request.getParameter("type");
		
		String typeFind = request.getParameter("typeFind");
		String stringFind = request.getParameter("stringFind");
		String btnFind = request.getParameter("btnFind");
		AdminSearchBO adminSearch = new AdminSearchBO();
		int page = 1;
		adminSearch.setMenu(10, 5);
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}

		
		ArrayList<TAIKHOAN> account = adminSearch.selectAccount(typeFind, stringFind,page,type);
		
		
		String pageNav = adminSearch.getMenuPhanTrang();		
		
		
		request.setAttribute("pageNavSearch", pageNav);
		request.setAttribute("account", account);
		request.setAttribute("button", btnFind);
		RequestDispatcher dispatcher;
		if(type.equals("CTV"))
		{
			dispatcher = request
					.getRequestDispatcher("CTVServlet");
		}else{
		dispatcher= request
				.getRequestDispatcher("ListAccountServlet");
		}
		adminSearch.closeConnection();
		dispatcher.forward(request, response);
	}

}
