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

@WebServlet("/ctv/Trang-chu")
public class TrangChuCTVServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TrangChuCTVServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
		if(user == null){
			request.setAttribute("meg", "");
			request.getRequestDispatcher("TrangChuCTV.jsp").forward(request, response);
		}else{
			BaiVietBO baiviet = new BaiVietBO();
			ArrayList<BAIVIET> listmoi = baiviet.getListPhanCong(user.getIdTaiKhoan(), "moi", 1);
			ArrayList<BAIVIET> listtre = baiviet.getListPhanCong(user.getIdTaiKhoan(), "qua-han", 1);
			request.setAttribute("listmoi", listmoi);
			request.setAttribute("listtre", listtre);
			
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
			
			request.getRequestDispatcher("HomeCTV.jsp").forward(request, response);
		}
	}
}
