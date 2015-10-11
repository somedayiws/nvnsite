package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.ThongBaoBO;

@WebServlet("/CheckEmailServlet")
public class CheckEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckEmailServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		TAIKHOAN user = (TAIKHOAN) request.getSession().getAttribute("user");
		if (user != null) {
			ThongBaoBO tb = new ThongBaoBO();
			request.setAttribute("soEmail",
					tb.CheckMail(user.getIdTaiKhoan(), user.getTenTaiKhoan()));
			tb.closeConnection();
			request.getRequestDispatcher("CheckEmail.jsp").forward(request,
					response);
		}
	}

}
