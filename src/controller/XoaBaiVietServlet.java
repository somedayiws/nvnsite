package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.BaiVietBO;

@WebServlet("/Xoa-bai-viet")
public class XoaBaiVietServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XoaBaiVietServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		if(id!=null){
			BaiVietBO baiviet = new BaiVietBO();
			if(baiviet.XoaBaiViet(id))
				response.sendRedirect("Trang-ca-nhan?xuly=xoa-thanhcong");
			else
				response.sendRedirect("Trang-ca-nhan?xuly=xoa-thatbai");
		}else{
			response.sendRedirect("TrangChuServlet");
		}
	}

}
