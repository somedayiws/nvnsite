package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.BaiVietBO;

@WebServlet("/ctv/UpDatePhanHoiServlet")
public class UpDatePhanHoiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpDatePhanHoiServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		BaiVietBO baiviet = new BaiVietBO();
		String id = request.getParameter("id");
		String bluan = request.getParameter("bluan");
		baiviet.setBinhLuan(id, bluan);
		baiviet.closeConnection();
	}

}
