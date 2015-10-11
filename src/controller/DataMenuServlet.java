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

@WebServlet("/DataMenuServlet")
public class DataMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DataMenuServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		DanhMucBO danhmuc = new DanhMucBO();
		ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc("");
		request.setAttribute("listdanhmuc", listdanhmuc);
		danhmuc.closeConnection();
		request.getRequestDispatcher("DataMenu.jsp").forward(request, response);
	}

}
