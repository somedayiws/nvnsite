package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.THONGBAO;
import model.bo.ThongBaoBO;

@WebServlet("/admin/DataThongBaoServlet")
public class DataThongBaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DataThongBaoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ThongBaoBO tb = new ThongBaoBO();
		String id = request.getParameter("id");
		THONGBAO tbao = tb.getThongBao(id);
		request.setAttribute("thongbao", tbao);
		tb.closeConnection();
		request.getRequestDispatcher("DataThongBao.jsp").forward(request, response);
	}
}
