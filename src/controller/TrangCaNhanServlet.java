package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;
import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.QUANGCAO;
import model.bean.TAIKHOAN;
import model.bean.THONGBAO;
import model.bo.BaiVietBO;
import model.bo.DanhMucBO;
import model.bo.QuangCaoBO;
import model.bo.TaiKhoanBO;
import model.bo.TaiNguyenBO;
import model.bo.ThongBaoBO;

@WebServlet("/Trang-ca-nhan")
public class TrangCaNhanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TrangCaNhanServlet() {
		super();
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

		TAIKHOAN user = (TAIKHOAN) request.getSession().getAttribute("user");
		if (user != null) {
			request.setAttribute("meg",
					"<div class='alert alert-success' role='alert'><p>Chào bạn "
							+ user.getHoTen()
							+ ", Chúc bạn một ngày làm việc vui vẻ.<br>ようこそ "
							+ user.getHoTen() + ", 良い一日を迎えるように.</p></div>");
			BaiVietBO bv = new BaiVietBO();
			DanhMucBO danhmuc = new DanhMucBO();
			int page = 1;
			bv.setMenu(10, 10);
			try {
				page = Integer.parseInt(request.getParameter("page"));
			} catch (NumberFormatException e) {
				page = 1;
			}
			ArrayList<BAIVIET> listBV = bv.getListBaiViet(user.getIdTaiKhoan(),
					page);
			// Danh mục hiển thị
			ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc("");
			// Danh sách bài viết host
			ArrayList<BAIVIET> topmoi = bv.getTopBaiViet("Moi");

			// List thông báo
			ThongBaoBO thongBaoBO = new ThongBaoBO();
			ArrayList<THONGBAO> listthongbao = thongBaoBO.getListHienThi("",
					"1", "DienDan");
			request.setAttribute("listthongbao", listthongbao);

			// Danh sách quảng cáo
			QuangCaoBO quangCaoBO = new QuangCaoBO();
			ArrayList<QUANGCAO> listquangcao = quangCaoBO
					.getDanhSachQuangCao((int) 2);
			request.setAttribute("listquangcao", listquangcao);

			request.setAttribute("topmoi", topmoi);
			String pageNav = bv.getMenuPhanTrang();
			request.setAttribute("pageNav", pageNav);
			request.setAttribute("dsbaidang", listBV);
			request.setAttribute("listdanhmuc", listdanhmuc);
			TaiNguyenBO tainguyenBO = new TaiNguyenBO();

			String ThongDiep = tainguyenBO.getValue("ThongDiep");
			String LienHe = tainguyenBO.getValue("LienHe");
			String DienThoai = tainguyenBO.getValue("DienThoai");
			String Email = tainguyenBO.getValue("Email");

			request.setAttribute("ThongDiep", ThongDiep);
			request.setAttribute("LienHe", LienHe);
			request.setAttribute("DienThoai", DienThoai);
			request.setAttribute("Email", Email);

			tainguyenBO.closeConnection();
			bv.closeConnection();
			danhmuc.closeConnection();
			thongBaoBO.closeConnection();
			quangCaoBO.closeConnection();
			request.getRequestDispatcher("TrangCaNhan.jsp").forward(request,
					response);
		} else {
			response.sendRedirect("Trang-chu");
		}
	}

}
