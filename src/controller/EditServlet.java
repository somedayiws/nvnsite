package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.EditBO;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/admin/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
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
	
		/**Get data from client*/
		String name = request.getParameter("name");
		String adress = request.getParameter("adress");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		/**Create Object*/
		TAIKHOAN account = new TAIKHOAN();
		EditBO edit = new EditBO();
		String resultSubmit;
		
		/** Put data into object */
		account.setHoTen(name);
		account.setDiaChi(adress);
		account.setDienThoai(phone);
		account.setEmail(email);
		
		/**Check validate*/
		if(edit.checkAccount(account))
		{
			if(edit.updateAccountInfor(account))
			{
				resultSubmit = "Update Success!";				
			}
			else{
				resultSubmit = "Update fail!";
			}
			request.setAttribute("result", resultSubmit);
			RequestDispatcher requestDis_error = request
					.getRequestDispatcher("GetInforAccountServlet");
			edit.closeConnection();
			requestDis_error.forward(request, response);
		}
		else
		{
			resultSubmit = edit.error;
			request.setAttribute("error", resultSubmit);
			RequestDispatcher requestDis_error = request
					.getRequestDispatcher("Error.jsp");
			edit.closeConnection();
			requestDis_error.forward(request, response);
		}
	}

}
