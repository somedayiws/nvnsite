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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String taikhoan = request.getParameter("taikhoan");
		String hoten = request.getParameter("hoten");
		String diachi = request.getParameter("diachi");
		String dienthoai = request.getParameter("dienthoai");
		String email = request.getParameter("email");
		String matkhau = request.getParameter("matkhau");
		
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
		if(user!=null){
			if(taikhoan != null && matkhau != null){
				String remoteAddr = request.getRemoteAddr();
				//Nhận giá trị 2 biến do Ajax Engine gửi đến
				String challenge = request.getParameter("recaptcha_challenge_field");
				String uresponse = request.getParameter("recaptcha_response_field");
				
				ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
				reCaptcha.setPrivateKey("6LeIbgwTAAAAAOPCOI-VANpsDzAl_bMsS8e10NIV");
				ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse); 
				if(reCaptchaResponse.isValid()) //Kiểm tra hợp lệ của response
				{
					user.setTenTaiKhoan(taikhoan);
					user.setHoTen(hoten);
					user.setDiaChi(diachi);
					user.setDienThoai(dienthoai);
					user.setEmail(email);
					user.setMatKhau(matkhau);
					TaiKhoanBO tk = new TaiKhoanBO();
					tk.UpdateThongTin(user);
					tk.closeConnection();
					request.setAttribute("meg", "<div class='alert alert-success' role='alert'><p>Cập nhật thành công - 更新を成功する.</p></div>");
				}
				else 
				{
					request.setAttribute("meg", "<div class='alert alert-danger' role='alert'>Mã xác nhận không đúng - 確認コードが正しくありません.</div>");
				}
			}else{
				request.setAttribute("meg", "<div class='alert alert-success' role='alert'><p>Chào bạn " + user.getHoTen() + ", Chúc bạn một ngày làm việc vui vẻ.<br>ようこそ " + user.getHoTen() + ", 良い一日を迎えるように.</p></div>");
			}
			BaiVietBO bv = new BaiVietBO();
			DanhMucBO danhmuc = new DanhMucBO();
			int page = 1;
			bv.setMenu(10, 10);
			try {
				page = Integer.parseInt(request.getParameter("page"));
			} catch (NumberFormatException e) {
				page = 1;
			}
			ArrayList<BAIVIET> listBV = bv.getListBaiViet(user.getIdTaiKhoan(), page);
			//Danh mục hiển thị
			ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc("");
			//Danh sách bài viết host
			ArrayList<BAIVIET> topmoi = bv.getTopBaiViet("Moi");
			
			// List thông báo
			ThongBaoBO thongBaoBO = new ThongBaoBO();
			ArrayList<THONGBAO> listthongbao = thongBaoBO.getListHienThi("","1", "DienDan");
			request.setAttribute("listthongbao", listthongbao);

			// Danh sách quảng cáo
			QuangCaoBO quangCaoBO = new QuangCaoBO();
			ArrayList<QUANGCAO> listquangcao = quangCaoBO.getDanhSachQuangCao((int) 2);
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
			request.getRequestDispatcher("TrangCaNhan.jsp").forward(request, response);
		}else{
			response.sendRedirect("Trang-chu");
		}
	}

}
