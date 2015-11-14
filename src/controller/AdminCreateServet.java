package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;

@WebServlet("/admin/AdminCreateServet")
public class AdminCreateServet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminCreateServet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String type = request.getParameter("type");
		
		
		// Get data from Client
		String name = request.getParameter("name");
		String adress = request.getParameter("adress");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String re_password = request.getParameter("re_password");
		String typeUser = request.getParameter("typeUser");				
		String language = request.getParameter("language");
		
		/** Create Object */
		model.bo.AdminCreateBO adminCreate = new model.bo.AdminCreateBO();
		TAIKHOAN account = new TAIKHOAN();
		String resultSubmit = null;
		
		/** Put data into object */
		account.setHoTen(name);
		account.setDiaChi(adress);
		account.setDienThoai(phone);
		account.setEmail(email);
		account.setTenTaiKhoan(username);
		account.setMatKhau(password);
		account.setQuyenQuanTri(typeUser);		
		account.setNgonNgu(language);
		account.setTinhTrang("MoiTao");
		
		
		/** Check validate data and data exist in the system */

		if (adminCreate.checkAccount(account)
				&& adminCreate.checkException(re_password, password)
				&& adminCreate.checkAccountexist(account.getTenTaiKhoan(),
						account.getEmail())) {

			// Correct
			account.setIdTaiKhoan(adminCreate.id_Account_after_increase());
			// insert
			if (adminCreate.insertAccount(account)) {
				resultSubmit = "Tạo tài khoản thành công - アカウントが作成できた";	
				
				System.out.println("resultSubmit: "+resultSubmit);
				request.setAttribute("result", resultSubmit);
				RequestDispatcher dispatcher;
				if(type.equals("CTV")){
					dispatcher = request.getRequestDispatcher("CTVServlet");
				}
				else{
					dispatcher = request.getRequestDispatcher("ListAccountServlet");
				}
				adminCreate.closeConnection();
				dispatcher.forward(request, response);
			} else {

				resultSubmit = "Tạo tài khoản thất bại";
				System.out.println("resultSubmit: "+resultSubmit);
				request.setAttribute("error", resultSubmit);
				RequestDispatcher requestDis_error = request
						.getRequestDispatcher("Error.jsp");
				adminCreate.closeConnection();
				requestDis_error.forward(request, response);

			}
		} else {
			// Incorrect
			// if user existed
			resultSubmit = adminCreate.error;
			if (resultSubmit != null
					&& resultSubmit
							.contains("tồn tại")) {
				System.out.println("resultSubmit: "+resultSubmit);
				request.setAttribute("result", resultSubmit);
				RequestDispatcher dispatcher;
				if(type.equals("CTV")){
					dispatcher = request.getRequestDispatcher("CTVServlet");
				}
				else{
					dispatcher = request.getRequestDispatcher("ListAccountServlet");
				}
				adminCreate.closeConnection();
				dispatcher.forward(request, response);
			}
			// if not exist
			else {
				System.out.println("resultSubmit: "+resultSubmit);
				request.setAttribute("error", resultSubmit);
				RequestDispatcher requestDis_error = request
						.getRequestDispatcher("Error.jsp");
				adminCreate.closeConnection();
				requestDis_error.forward(request, response);
			}
		}
	}

}
