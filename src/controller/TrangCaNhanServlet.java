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
import model.bean.TAIKHOAN;
import model.bo.BaiVietBO;
import model.bo.DanhMucBO;
import model.bo.TaiKhoanBO;

@WebServlet("/TrangCaNhanServlet")
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
				reCaptcha.setPrivateKey("6LcUfwsTAAAAAA3VD4c_O4wK66-0AxVccisDCx8m");
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
					request.setAttribute("meg", "Cập nhật thành công.");
				}
				else 
				{
					request.setAttribute("meg", "Mã xác nhận không đúng");
				}
			}else{
				request.setAttribute("meg", "Chào bạn " + user.getHoTen() + ", Chúc bạn một ngày làm việc vui vẻ.");
			}
			BaiVietBO bv = new BaiVietBO();
			DanhMucBO danhmuc = new DanhMucBO();
			ArrayList<BAIVIET> listBV = bv.getListBaiViet(user.getIdTaiKhoan());
			//Danh mục hiển thị
			ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc("");
			//Danh sách bài viết host
			ArrayList<BAIVIET> topbaiviet = bv.getTopBaiViet();
			request.setAttribute("dsbaidang", listBV);
			request.setAttribute("listdanhmuc", listdanhmuc);
			request.setAttribute("topbaiviet", topbaiviet);
			request.getRequestDispatcher("TrangCaNhan.jsp").forward(request, response);
		}else{
			response.sendRedirect("TrangChuServlet");
		}
	}

}
