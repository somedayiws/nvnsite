package controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bean.TAIKHOAN;
import model.bo.BaiVietBO;

@WebServlet("/ctv/Danh-sach-bai-dich")
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
		
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
		
		if(user != null){
			int page = 1;
			BaiVietBO baiviet = new BaiVietBO();
			ArrayList<BAIVIET> listbaiviet = new ArrayList<BAIVIET>();
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

			int tongbv = baiviet.TongBaiViet(user.getIdTaiKhoan(), "");
			int tongbvok = baiviet.TongBaiViet(user.getIdTaiKhoan(), "DaDich");
			int tongbvhuy = baiviet.TongBaiViet(user.getIdTaiKhoan(), "HuyDich");
			int tongbvloi = baiviet.TongBaiViet(user.getIdTaiKhoan(), "LoiDich");
			
			DecimalFormat df = new DecimalFormat("0.00");
			
			if(tongbv!=0){
				request.setAttribute("tongbvok", df.format(tongbvok*100.00/tongbv));
				request.setAttribute("tongbvhuy", df.format(tongbvhuy*100.00/tongbv));
			}else{
				request.setAttribute("tongbvok", 100);
				request.setAttribute("tongbvhuy", 0);
			}
			request.setAttribute("tongbvloi", tongbvloi);
			
			baiviet.closeConnection();
			request.getRequestDispatcher("ListBaiDich.jsp").forward(request, response);
		}else{
			response.sendRedirect("Trang-chu");
		}
	}
}
