package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.AdminEditBO;

/**
 * Servlet implementation class AdminEditServlet
 */
@WebServlet("/admin/AdminEditServlet")
public class AdminEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEditServlet() {
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
		
		String name = request.getParameter("name");
		String adress = request.getParameter("adress");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String typeUser = request.getParameter("typeUser");
		String language = request.getParameter("language");
		String status = request.getParameter("status");
				
		
		TAIKHOAN account = new TAIKHOAN();
		AdminEditBO adminEdit = new AdminEditBO();
		String resultSubmit;
		
		account.setHoTen(name);
		account.setDiaChi(adress);
		account.setDienThoai(phone);
		account.setEmail(email);
		account.setTenTaiKhoan(username);
		account.setQuyenQuanTri(typeUser);
		if(!typeUser.equals("CTV")) account.setNgonNgu(null);
		else account.setNgonNgu(language);
		account.setTinhTrang(status);
		
		if(adminEdit.checkAccount(account))
		{
			//Data valid
			if(adminEdit.updateAccount(account))
			{
				//Update success
				resultSubmit = "Update success";
			}
			else
			{
				//Update fail
				resultSubmit = "Update fail";
			
			}
			request.setAttribute("result", resultSubmit);
			RequestDispatcher requestDis_error = request
					.getRequestDispatcher("ListAccountServlet");
			requestDis_error.forward(request, response);
		}
		else
		{
			
			//Data invalid
			resultSubmit = adminEdit.error;
			request.setAttribute("error", resultSubmit);
			RequestDispatcher requestDis_error = request
					.getRequestDispatcher("Error.jsp");
			requestDis_error.forward(request, response);
			
		}
		
	}

}
