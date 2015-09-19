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
import model.bo.BaiVietBO;
import model.bo.DanhMucBO;
import model.bo.QuangCaoBO;

@WebServlet("/TrangChuServlet")
public class TrangChuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TrangChuServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String txtFind = (String) request.getAttribute("txtFind");
		if (txtFind == null)
			txtFind = "";
		DanhMucBO danhmuc = new DanhMucBO();
		BaiVietBO baiviet = new BaiVietBO();
		QuangCaoBO quangCaoBO = new QuangCaoBO();
		// Danh mục và bài viết tiêu biểu
		ArrayList<DANHMUC> list = danhmuc.getListDanhMuc("0", "10");
		request.setAttribute("list", list);
		// Danh mục hiển thị
		ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc(txtFind);
		request.setAttribute("listdanhmuc", listdanhmuc);
		// Danh sách bài viết hot
		ArrayList<BAIVIET> topbaiviet = baiviet.getTopBaiViet("XemNhieu");
		request.setAttribute("topbaiviet", topbaiviet);
		// Danh sách bài viết moi
		ArrayList<BAIVIET> topmoi = baiviet.getTopBaiViet("Moi");
		request.setAttribute("topmoi", topmoi);
		// Danh sách quảng cáo
		ArrayList<QUANGCAO> listquangcao = quangCaoBO.getDanhSachQuangCao();
		request.setAttribute("listquangcao", listquangcao);
		request.getRequestDispatcher("TrangChu.jsp").forward(request, response);
	}
}
