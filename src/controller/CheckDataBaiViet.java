package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.BaiVietBO;
import model.bo.ThongBaoBO;

@WebServlet("/admin/CheckDataBaiViet")
public class CheckDataBaiViet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckDataBaiViet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		BaiVietBO tb = new BaiVietBO();
		request.setAttribute("baimoi", tb.getCountBaiViet("moi")+"");
		request.setAttribute("dichxong", tb.getCountBaiViet("xong")+"");
		request.setAttribute("huydich", tb.getCountBaiViet("huy")+"");
		tb.closeConnection();
		request.getRequestDispatcher("KetQuaCheckData.jsp").forward(request,response);
	}

}
