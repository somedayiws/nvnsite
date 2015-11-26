package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.BaiVietBO;

@WebServlet("/admin/HuyBaiDichServlet")
public class HuyBaiDichServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HuyBaiDichServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		BaiVietBO bv = new BaiVietBO();
		String id = request.getParameter("id");
		if(bv.HuyBaiDich(id)){
			request.setAttribute("KetQua", "Hủy bài dịch thành công - 翻訳の削除ができた.");
		}else{
			request.setAttribute("KetQua", "Hủy bài dịch không thành công - 翻訳の削除ができなかった.");
		}
		bv.closeConnection();
		request.getRequestDispatcher("KetQuaHuyDich.jsp").forward(request, response);
	}

}
