package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.DANHMUC;
import model.bo.DanhMucBO;

@WebServlet("/DataDanhMucServlet")
public class DataDanhMucServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DataDanhMucServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String vitri = request.getParameter("vitri");
		if(vitri == null || vitri.contains("NaN")) vitri = "0";
		DanhMucBO danhmucbo = new DanhMucBO();
		ArrayList<DANHMUC> list = danhmucbo.getListDanhMuc(vitri, "4");
		request.setAttribute("list", list);
		danhmucbo.closeConnection();
		request.getRequestDispatcher("DataDanhMuc.jsp").forward(request, response);
	}

}
