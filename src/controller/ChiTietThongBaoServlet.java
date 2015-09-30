package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.QUANGCAO;
import model.bean.TAIKHOAN;
import model.bean.THONGBAO;
import model.bo.BaiVietBO;
import model.bo.DanhMucBO;
import model.bo.QuangCaoBO;
import model.bo.ThongBaoBO;

/**
 * Servlet implementation class ChiTietThongBaoServlet
 */
@WebServlet("/ChiTietThongBaoServlet")
public class ChiTietThongBaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChiTietThongBaoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		BaiVietBO bv = new BaiVietBO();
		DanhMucBO danhmuc = new DanhMucBO();
		ThongBaoBO tb = new ThongBaoBO();
		String id = request.getParameter("id");
		bv.setMenu(10, 10);
		TAIKHOAN user = (TAIKHOAN) request.getSession().getAttribute("user");
		// Danh mục hiển thị
		ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc("");
		// Danh sách bài viết host
		ArrayList<BAIVIET> topbaiviet = bv.getTopBaiViet("XemNhieu");
		ArrayList<BAIVIET> topmoi = bv.getTopBaiViet("Moi");
		// List thông báo
		ThongBaoBO thongBaoBO = new ThongBaoBO();
		ArrayList<THONGBAO> listthongbao = thongBaoBO.getListHienThi("", "1","DienDan");
		request.setAttribute("listthongbao", listthongbao);

		// Danh sách quảng cáo
		QuangCaoBO quangCaoBO = new QuangCaoBO();
		ArrayList<QUANGCAO> listquangcao = quangCaoBO.getDanhSachQuangCao((int) 2);
		request.setAttribute("listquangcao", listquangcao);
		request.setAttribute("topmoi", topmoi);
		request.setAttribute("listdanhmuc", listdanhmuc);
		request.setAttribute("topbaiviet", topbaiviet);
		THONGBAO thongbao = tb.getThongBao(id);
		if(thongbao !=null){
			tb.setViewed(id);
		}
		request.setAttribute("thongbao", thongbao);
		request.getRequestDispatcher("ChiTietThongBao.jsp").forward(request, response);
	}

}