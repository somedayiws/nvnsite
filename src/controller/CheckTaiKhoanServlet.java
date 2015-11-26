package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.TaiKhoanBO;

@WebServlet("/CheckTaiKhoanServlet")
public class CheckTaiKhoanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckTaiKhoanServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String taikhoan = request.getParameter("tk");
		TaiKhoanBO tk = new TaiKhoanBO();
		
		if(tk.kiemTraTonTai(taikhoan)){
			response.getWriter().print("<label id='loitk' class='error'>Tài khoản đã tồn tại - アカウントが既に存在された.</label>");
		}
	}

}
