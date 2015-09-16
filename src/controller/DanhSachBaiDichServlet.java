package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bean.TAIKHOAN;
import model.bo.BaiVietBO;

@WebServlet("/ctv/DanhSachBaiDichServlet")
public class DanhSachBaiDichServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DanhSachBaiDichServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String view = request.getParameter("view");
		BaiVietBO baiviet = new BaiVietBO();
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
		ArrayList<BAIVIET> listbaiviet = new ArrayList<BAIVIET>();
		if(user != null){
			int page = 1;
			baiviet.setMenu(10, 10);
			try {
				page = Integer.parseInt(request.getParameter("page"));
			} catch (NumberFormatException e) {
				page = 1;
			}
			if(view != null && view.equals("qua-han")){
				listbaiviet = baiviet.getListPhanCong(user.getIdTaiKhoan(), "qua-han", page);
			}else if(view != null && view.equals("moi")){
				listbaiviet = baiviet.getListPhanCong(user.getIdTaiKhoan(), "moi", page);
			}else if(view != null && view.equals("dich")){
				listbaiviet = baiviet.getListPhanCong(user.getIdTaiKhoan(), "dich", page);
			}else {
				listbaiviet = baiviet.getListPhanCong(user.getIdTaiKhoan(), page);
			}
			String pageNav = baiviet.getMenuPhanTrang();
			request.setAttribute("pageNav", pageNav);
			request.setAttribute("listbaiviet", listbaiviet);
			request.getRequestDispatcher("ListBaiDich.jsp").forward(request, response);
		}else{
			response.sendRedirect("TrangChuCTVServlet");
		}
	}
}
