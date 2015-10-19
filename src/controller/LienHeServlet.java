package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.LIENHE;
import model.bo.LienHeBO;

@WebServlet("/admin/LienHeServlet")
public class LienHeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LienHeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		if(request.getSession().getAttribute("username")==null){
			response.sendRedirect("LoginServlet");
		}else{
			LienHeBO lienhe = new LienHeBO();
			String timtheo = request.getParameter("timtheo");
			String txtFind = request.getParameter("txtFind");
			if(txtFind==null) txtFind = "";
			if(timtheo==null) timtheo = "1";
			int page = 1;
			lienhe.setMenu(10, 10);
			try {
				page = Integer.parseInt(request.getParameter("page"));
			} catch (NumberFormatException e) {
				page = 1;
			}
			ArrayList<LIENHE> list = lienhe.getListLienHe(timtheo, txtFind, page);
			String pageNav = lienhe.getMenuPhanTrang();
			request.setAttribute("pageNav", pageNav);
			request.setAttribute("list", list);
			lienhe.closeConnection();
			request.getRequestDispatcher("LienHe.jsp").forward(request, response);
		}
	}

}
