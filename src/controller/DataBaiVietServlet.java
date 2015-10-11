package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bo.BaiVietBO;

@WebServlet("/DataBaiVietServlet")
public class DataBaiVietServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DataBaiVietServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String n = request.getParameter("vitri");
		String id = request.getParameter("id");
		String txtFind = request.getParameter("txtFind");
		String chon = request.getParameter("chon");
		if(n == null) n = "10";
		BaiVietBO baiviet = new BaiVietBO();
		ArrayList<BAIVIET> listbaiviet = null;
		if(txtFind==null) listbaiviet = baiviet.getDanhSachBaiViet(id, Integer.parseInt(n), "5");
		else listbaiviet = baiviet.getFind(chon, txtFind, n, "5");
		request.setAttribute("listbaiviet", listbaiviet);
		request.setAttribute("n", n);
		baiviet.closeConnection();
		request.getRequestDispatcher("DataBaiViet.jsp").forward(request, response);
	}

}
