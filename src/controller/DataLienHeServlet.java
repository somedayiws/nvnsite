package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.LIENHE;
import model.bo.LienHeBO;

@WebServlet("/admin/DataLienHeServlet")
public class DataLienHeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DataLienHeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		LienHeBO tb = new LienHeBO();
		String id = request.getParameter("id");
		LIENHE tbao = tb.getLienHe(id);
		request.setAttribute("thongbao", tbao);
		tb.closeConnection();
		request.getRequestDispatcher("DataLienHe.jsp").forward(request, response);
	}

}
