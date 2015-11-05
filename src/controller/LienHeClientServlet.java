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
import model.bo.LienHeBO;
import model.bo.QuangCaoBO;
import model.bo.TaiNguyenBO;
import model.bo.ThongBaoBO;

@WebServlet("/Lien-he")
public class LienHeClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LienHeClientServlet() {
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
		try {
			DanhMucBO danhmuc = new DanhMucBO();
			BaiVietBO baiviet = new BaiVietBO();
			String submit = request.getParameter("submit");
			String txtFind = (String) request.getAttribute("txtFind");
			if (txtFind == null)
				txtFind = "";
			// Danh mục và bài viết tiêu biểu
			ArrayList<DANHMUC> list = danhmuc.getListDanhMuc("0", "10");
			// Danh mục hiển thị
			ArrayList<DANHMUC> listdanhmuc = danhmuc
					.getDanhSachDanhMuc(txtFind);
			// Danh sách bài viết host
			request.setAttribute("list", list);
			request.setAttribute("listdanhmuc", listdanhmuc);
			ArrayList<BAIVIET> topmoi = baiviet.getTopBaiViet("Moi");
			request.setAttribute("topmoi", topmoi);

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

			TaiNguyenBO tainguyenBO = new TaiNguyenBO();

			String ThongDiep = tainguyenBO.getValue("ThongDiep");
			String LienHe = tainguyenBO.getValue("LienHe");
			String DienThoai = tainguyenBO.getValue("DienThoai");
			String Email = tainguyenBO.getValue("Email");

			request.setAttribute("ThongDiep", ThongDiep);
			request.setAttribute("LienHe", LienHe);
			request.setAttribute("DienThoai", DienThoai);
			request.setAttribute("Email", Email);
			if (submit == null) {
				request.setAttribute("loi", "");
				
				TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
				if(user !=null){
					request.setAttribute("taikhoan_lh", user.getIdTaiKhoan());
					request.setAttribute("email_lh", user.getEmail());
					request.setAttribute("hovaten_lh", user.getHoTen());
					request.setAttribute("dienthoai_lh", user.getDienThoai());
				}
				danhmuc.closeConnection();
				baiviet.closeConnection();
				thongBaoBO.closeConnection();
				quangCaoBO.closeConnection();
				tainguyenBO.closeConnection();
				request.getRequestDispatcher("LienHe.jsp").forward(request,
						response);
			} else {
				String taikhoan = request.getParameter("taikhoan");
				String hoten = request.getParameter("hoten");
				String dienthoai = request.getParameter("dienthoai");
				String email = request.getParameter("email");
				String tieude = request.getParameter("tieude");
				String noidung = request.getParameter("noidung");
				if (email != "" && tieude != "" && noidung != "" && hoten != "") {
					LienHeBO lienHeBO = new LienHeBO();
					lienHeBO.addLienHe(taikhoan, hoten, dienthoai, email,
							tieude, noidung);
					request.setAttribute("loi", "");
					danhmuc.closeConnection();
					baiviet.closeConnection();
					thongBaoBO.closeConnection();
					quangCaoBO.closeConnection();
					tainguyenBO.closeConnection();
					lienHeBO.closeConnection();
					request.getRequestDispatcher("Trang-chu").forward(request,
							response);
				}
				request.setAttribute(
						"loi",
						"<div class='alert alert-danger' role='alert'><p>Bạn chưa nhập đầy đủ thông tin.</p></div>");
				danhmuc.closeConnection();
				baiviet.closeConnection();
				thongBaoBO.closeConnection();
				quangCaoBO.closeConnection();
				tainguyenBO.closeConnection();
				request.getRequestDispatcher("LienHe.jsp").forward(request,
						response);
			}
		} catch (Exception e) {

		}
	}
}
