package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.QuangCaoBO;

@WebServlet("/admin/XoaQuangCaoServlet")
public class XoaQuangCaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XoaQuangCaoServlet() {
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
		String idQC = request.getParameter("idQC");
		if(idQC!=null){
			QuangCaoBO quangCaoBo = new QuangCaoBO();
			if(quangCaoBo.xoaQuangCao(idQC)){
				request.setAttribute("mes", "<div class='alert alert-success tbmeg' role='alert'>Xóa thành công.</div>");
			}else{
				request.setAttribute("mes", "<div class='alert alert-danger tbmeg' role='alert'>Xóa không thành công.</div>");
			}
			quangCaoBo.closeConnection();
		}else{
			request.setAttribute("mes", "<div class='alert alert-warning tbmeg' role='alert'>Bạn không có thẩm quyền cho thao tác này.</div>");
		}
		request.getRequestDispatcher("AdvertisementServlet").forward(request, response);
	}
	}
}
