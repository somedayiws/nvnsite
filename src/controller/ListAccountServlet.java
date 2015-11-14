package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		//Check session exist
		HttpSession session_user = request.getSession();
		String username =(String)session_user.getAttribute("username");	
		if(username!=null){
			String result = (String) request.getAttribute("result");
			String result_Restore = (String)request.getAttribute("result_Restore");
			//Nhận kết quả tìm kiếm
			ArrayList<TAIKHOAN> account = (ArrayList<TAIKHOAN>)request.getAttribute("account");
			String pageNavSearch = (String)request.getAttribute("pageNavSearch");
			String button = (String)request.getAttribute("button");
			
			String resultUpdate, resultDelete,resultCreate;
			if (result != null) {
				if (result.contains("Cập nhật")) {
					if (result.contains("thành công")) {
						resultUpdate = "Chỉnh sửa thành công - 修正でた";
					} else {
						resultUpdate = "Chỉnh sửa thất bại - 修正がまだできない";
					}
					request.setAttribute("result", resultUpdate);
				}
				else if(result.contains("Phục hồi")){
					request.setAttribute("result", result);
				}
				else if(result.contains("khoản")){
					
					if(result.contains("tồn tại")){
						resultCreate = "Tài khoản đã tồn tại trong hệ thống - アカウントが既にシステム上に存在する。";
					}else{
						resultCreate = "Tạo tài khoản thành công - アカウントが作成できた";
					}
					request.setAttribute("result", resultCreate);
				}
				else
				{
					if (result.contains("success")) {
						resultDelete= "Xóa tài khoản thành công - アカウントが削除された";
					} else {
						resultDelete = "Xóa tài khoản thất bại - アカウントがまだ削除できない";
					}
					request.setAttribute("result", resultDelete);
				}
			}
			if(account!=null){
				request.setAttribute("pageNavSearch", pageNavSearch);
				request.setAttribute("account", account);
				request.setAttribute("button", button);
			}
			else{
			ListAccountBO listAcc = new ListAccountBO();
			
			int page = 1;
			listAcc.setMenu(10, 5);
			try {
				page = Integer.parseInt(request.getParameter("page"));
			} catch (NumberFormatException e) {
				page = 1;
			}
			ArrayList<TAIKHOAN> accounts = listAcc.getDataAccountInfor(page);
			String pageNav = listAcc.getMenuPhanTrang();
			
			request.setAttribute("pageNav", pageNav);		
			
			request.setAttribute("accounts", accounts);
			}
			request.setAttribute("result_Restore", result_Restore);
			RequestDispatcher requestDis_result = request
					.getRequestDispatcher("ListAccount.jsp");
			requestDis_result.forward(request, response);
		}else{
			RequestDispatcher requestDis = request.getRequestDispatcher("Login.jsp");
			requestDis.forward(request, response);
		}
	}
}
