package controller;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.BaiVietBO;
import model.bo.TaiKhoanBO;

@WebServlet("/ctv/Cap-nhat-tai-khoan")
public class CapNhatThongTinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CapNhatThongTinServlet() {
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
				user.setTenTaiKhoan(taikhoan);
				user.setHoTen(hoten);
				user.setDiaChi(diachi);
				user.setDienThoai(dienthoai);
				user.setEmail(email);
				user.setMatKhau(matkhau);
				TaiKhoanBO tk = new TaiKhoanBO();
				if(tk.UpdateThongTin(user))
					request.setAttribute("meg", "<div class='alert alert-success' role='alert'>Cập nhật thành công - 更新を成功する.</div>");
				else
					request.setAttribute("meg", "<div class='alert alert-danger' role='alert'>Cập nhật thất bại - 更新を失敗する.</div>");
				tk.closeConnection();
			}else{
				request.setAttribute("meg", "<div class='alert alert-success' role='alert'><p>Chào bạn " + user.getHoTen() + ", Chúc bạn một ngày làm việc vui vẻ.</p>"
						+ "<br>ようこそ <p>"+user.getHoTen()+" 良い一日を迎えるように.</p></div>");
			}

			BaiVietBO baiviet = new BaiVietBO();
			
			int tongbv = baiviet.TongBaiViet(user.getIdTaiKhoan(), "");
			int tongbvok = baiviet.TongBaiViet(user.getIdTaiKhoan(), "Ok");
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
			request.getRequestDispatcher("ThongTinCTV.jsp").forward(request, response);
		}else{
			response.sendRedirect("Trang-chu");
		}
	}
}
