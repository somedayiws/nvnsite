package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.BinhLuanBO;

@WebServlet("/UpDateDataBinhLuan")
public class UpDateDataBinhLuan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpDateDataBinhLuan() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("idbaiviet");
		String ngonngu = request.getParameter("ngonngu");
		String binhluan = request.getParameter("binhluan");
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
		if(user != null){
			BinhLuanBO bl = new BinhLuanBO();
			if(ngonngu.equals("vi")){
				bl.addBinhLuanVi(id, user.getIdTaiKhoan(), binhluan);
			}else{
				bl.addBinhLuanJa(id, user.getIdTaiKhoan(), binhluan);
			}
			bl.closeConnection();
		}
	}

}
