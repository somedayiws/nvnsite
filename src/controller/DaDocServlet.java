package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.LienHeBO;

@WebServlet("/admin/DaDocServlet")
public class DaDocServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DaDocServlet() {
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
			LienHeBO tb = new LienHeBO();
			
			String id = request.getParameter("id");
			
			tb.capNhat(id);
			
			tb.closeConnection();
		}
	}
}
