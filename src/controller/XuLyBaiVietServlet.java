package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.BaiVietBO;

@WebServlet("/ctv/Gui-bai-dich")
public class XuLyBaiVietServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XuLyBaiVietServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String fruits[] = request.getParameterValues("chon");
		String submit = request.getParameter("submit");
		
		if(fruits != null)
		{
			BaiVietBO bviet = new BaiVietBO();
			TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
			for(int i=0; i<fruits.length; i++)
			{
				if(submit.equals("gui")){
					bviet.CapNhatBaiViet(fruits[i], "DangBai", user.getIdTaiKhoan());
					request.setAttribute("meg", "<div class='alert alert-success' role='alert'>Gửi bài dịch thành công.<br>翻訳の記事が送信できた。</div>");
				}else{
					bviet.CapNhatBaiViet(fruits[i], "HuyDich", user.getIdTaiKhoan());
					request.setAttribute("meg", "<div class='alert alert-success' role='alert'>Hủy bài dịch thành công.<br>翻訳の記事が削除できた。</div>");
				}
			}
			bviet.closeConnection();
		}else{
			request.setAttribute("meg", "<div class='alert alert-warning' role='alert'>Bạn chưa chọn bài nào cả.</div>");
		}
		request.getRequestDispatcher("Danh-sach-bai-dich").forward(request, response);
	}

}
