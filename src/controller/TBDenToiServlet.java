package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.swing.internal.plaf.basic.resources.basic;

import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.QUANGCAO;
import model.bean.TAIKHOAN;
import model.bean.THONGBAO;
import model.bo.BaiVietBO;
import model.bo.DanhMucBO;
import model.bo.QuangCaoBO;
import model.bo.ThongBaoBO;

@WebServlet("/Thong-bao")
public class TBDenToiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TBDenToiServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		BaiVietBO bv = new BaiVietBO();
		DanhMucBO danhmuc = new DanhMucBO();
		ThongBaoBO tb = new ThongBaoBO();
		int page = 1;
		bv.setMenu(10, 10);
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
		//Danh mục hiển thị
		ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc("");
		//Danh sách bài viết host
		ArrayList<BAIVIET> topmoi = bv.getTopBaiViet("Moi");
		ArrayList<THONGBAO> list = tb.getListThongBao(" GuiDen like N'"+user.getIdTaiKhoan()+"' or GuiDen like N'"+user.getTenTaiKhoan()+"' " , page);
		request.setAttribute("topmoi", topmoi);
		String pageNav = bv.getMenuPhanTrang();
		
		// List thông báo
		ArrayList<THONGBAO> listthongbao = tb.getListHienThi("", "1","DienDan");
		request.setAttribute("listthongbao", listthongbao);

		// Danh sách quảng cáo
		QuangCaoBO quangCaoBO = new QuangCaoBO();
		ArrayList<QUANGCAO> listquangcao = quangCaoBO.getDanhSachQuangCao((int) 2);
		request.setAttribute("listquangcao", listquangcao);
		
		request.setAttribute("pageNav", pageNav);
		request.setAttribute("listdanhmuc", listdanhmuc);
		request.setAttribute("list", list);
		
		bv.closeConnection();
		danhmuc.closeConnection();
		tb.closeConnection();
		quangCaoBO.closeConnection();
		
		request.getRequestDispatcher("TBDenToi.jsp").forward(request, response);
	}

}
