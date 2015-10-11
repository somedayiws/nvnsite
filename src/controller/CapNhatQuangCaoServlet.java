package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.QUANGCAO;
import model.bo.QuangCaoBO;

@WebServlet("/admin/CapNhatQuangCaoServlet")
public class CapNhatQuangCaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CapNhatQuangCaoServlet() {
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
		String id = request.getParameter("id");
		QuangCaoBO qcBO = new QuangCaoBO();
		QUANGCAO qc = qcBO.getQuangCao(id);
		request.setAttribute("quangcao", qc);
		qcBO.closeConnection();
		request.getRequestDispatcher("SuaQuangCao.jsp").forward(request, response);
	}
	}
}
