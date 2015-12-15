package controller;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bean.TAIKHOAN;
import model.bo.BaiVietBO;
import model.bo.BinhLuanBO;
import model.bo.EmailUtility;
import model.bo.ThongBaoBO;

@WebServlet("/UpDateDataBinhLuan")
public class UpDateDataBinhLuan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpDateDataBinhLuan() {
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
		String id = request.getParameter("idbaiviet");
		String ngonngu = request.getParameter("ngonngu");
		String binhluan = request.getParameter("binhluan");
		TAIKHOAN user = (TAIKHOAN) request.getSession().getAttribute("user");
		if (user != null) {
			BinhLuanBO bl = new BinhLuanBO();
			ServletContext context = getServletContext();

			final String host = context.getInitParameter("host");
			final String port = context.getInitParameter("port");
			final String user1 = context.getInitParameter("user");
			final String pass = context.getInitParameter("pass");

			BaiVietBO bv = new BaiVietBO();
			ThongBaoBO tb = new ThongBaoBO();

			BAIVIET bv1 = bv.getBaiViet(id);
			final String email = bv1.getTaiKhoan().getEmail();

			if (!email.equals(user.getEmail())) {
				final String tieude = "JPVN.NET - Bài viết " + id
						+ " được chú ý";
				String noidung = "Chào bạn " + bv1.getTaiKhoan().getHoTen();
				noidung += "\nBài viết "
						+ (bv1.getTenBaiVietVi() != null
								&& !bv1.getTenBaiVietVi().equals("") ? bv1
								.getTenBaiVietVi() : "")
						+ "    "
						+ (bv1.getTenBaiVietJa() != null
								&& !bv1.getTenBaiVietJa().equals("") ? bv1
								.getTenBaiVietJa() : "");
				noidung += "\nĐã nhận được phản hồi từ các thành viên(他の会員から返事が届いた).\nVui lòng truy cập http://jpvn.net/Xem-bai-viet?id="
						+ id + " trên để biết thêm chi tiết.";
				String noidungtb = "Chào bạn <strong>"
						+ bv1.getTaiKhoan().getHoTen() + "</strong>";
				noidungtb += "<br>Bài viết <strong>"
						+ (bv1.getTenBaiVietVi() != null
								&& !bv1.getTenBaiVietVi().equals("") ? bv1
								.getTenBaiVietVi() : "")
						+ "    "
						+ (bv1.getTenBaiVietJa() != null
								&& !bv1.getTenBaiVietJa().equals("") ? bv1
								.getTenBaiVietJa() : "") + "</strong>";
				noidungtb += "<br>Bạn vừa nhận được phản hồi từ các thành viên(他の会員から返事が届いた).<br>Vui lòng truy cập <a href='http://jpvn.net/Xem-bai-viet?id="
						+ id
						+ "'>http://jpvn.net/Xem-bai-viet?id="
						+ id
						+ "</a> để biết thêm chi tiết.";
				tb.ThemThongBaoClient(tieude, noidungtb, bv1.getTaiKhoan()
						.getIdTaiKhoan());
				final String contentMail = noidung;
				try {
					EmailUtility.sendEmailThread(host, port, user1, pass, email,
							tieude, contentMail);
				} catch (AddressException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (ngonngu.equals("vi")) {
				bl.addBinhLuanVi(id, user.getIdTaiKhoan(), binhluan);
			} else {
				bl.addBinhLuanJa(id, user.getIdTaiKhoan(), binhluan);
			}
			tb.closeConnection();
			bv.closeConnection();
			bl.closeConnection();
		}
	}

}
