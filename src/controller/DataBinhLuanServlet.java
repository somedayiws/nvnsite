package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BINHLUAN;
import model.bo.BinhLuanBO;

@WebServlet("/DataBinhLuanServlet")
public class DataBinhLuanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DataBinhLuanServlet() {
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
		String vitri = request.getParameter("vitri");
		if(ngonngu == null) ngonngu = "vi";
		if(vitri == null) vitri = "0";
		BinhLuanBO bl = new BinhLuanBO();
		ArrayList<BINHLUAN> list = bl.getListBinhLuan(id, ngonngu, vitri);
		request.setAttribute("list", list);
		bl.closeConnection();
		request.getRequestDispatcher("DataBinhLuan.jsp").forward(request, response);
	}

}
