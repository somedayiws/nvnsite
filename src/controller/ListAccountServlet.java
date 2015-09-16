package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.ListAccountBO;

/**
 * Servlet implementation class ListAccountServlet
 */
@WebServlet("/admin/ListAccountServlet")
public class ListAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListAccountServlet() {
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

		String result = (String) request.getAttribute("result");
		TAIKHOAN[] account = (TAIKHOAN[])request.getAttribute("account");
		String button = (String)request.getAttribute("button");
		String resultUpdate, resultDelete;

		
	
		System.out.println("button: "+button);
		System.out.println("account: "+account);
		System.out.println("result: "+result);
		if (result != null) {
			if (result.contains("Update")) {
				if (result.contains("success")) {

					resultUpdate = "Chỉnh sửa thành công";
				} else {
					resultUpdate = "Chỉnh sửa thất bại";
				}
				request.setAttribute("result", resultUpdate);
			}
			else
			{
				if (result.contains("success")) {

					resultDelete= "Xóa tài khoản thành công";
				} else {
					resultDelete = "Xóa tài khoản thất bại";
				}
				request.setAttribute("result", resultDelete);
			}
		}
		//Paging page = new Paging();
		//int currentPage = page.currentPage("", 1);
	
		ListAccountBO listAcc = new ListAccountBO();
		
		//int totalPage = listAcc.totalRecord();
		int page = 1;
		listAcc.setMenu(10, 5);
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
		TAIKHOAN[] listAccount = listAcc.getDataAccountInfor(page);
		//System.out.println("Leng contrller : " + listAccount.length);
		String pageNav = listAcc.getMenuPhanTrang();
		request.setAttribute("pageNav", pageNav);
		//System.out.println("Menu : " + pageNav);
		request.setAttribute("account", account);
		request.setAttribute("button", button);
		//request.setAttribute("totalPage",totalPage);
		//request.setAttribute("currentPage", currentPage);
		request.setAttribute("listAccount", listAccount);
		RequestDispatcher requestDis_result = request
				.getRequestDispatcher("ListAccount.jsp");
		requestDis_result.forward(request, response);

	}

}
