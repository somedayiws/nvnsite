package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.BaiVietBO;

@WebServlet("/ctv/XuLyBaiVietServlet")
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
		BaiVietBO bviet = new BaiVietBO();
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
		if(fruits != null)
		{
			for(int i=0; i<fruits.length; i++)
			{
				if(submit.equals("gui")){
					bviet.CapNhatBaiViet(fruits[i], "Ok", user.getIdTaiKhoan());
					request.setAttribute("meg", "Đã gửi bài cho admin.");
				}else{
					bviet.CapNhatBaiViet(fruits[i], "HuyDich", user.getIdTaiKhoan());
					request.setAttribute("meg", "Đã hủy bài không mong muốn.");
				}
			}
		}else{
			request.setAttribute("meg", "Bạn chưa chọn bài nào cả.");
		}
		request.getRequestDispatcher("DanhSachBaiDichServlet").forward(request, response);
	}

}
