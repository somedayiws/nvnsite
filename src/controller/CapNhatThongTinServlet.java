package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.TaiKhoanBO;

@WebServlet("/ctv/CapNhatThongTinServlet")
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
				tk.UpdateThongTin(user);
				request.setAttribute("meg", "Cập nhật thành công.");
			}else{
				request.setAttribute("meg", "Chào bạn " + user.getHoTen() + ", Chúc bạn một ngày làm việc vui vẻ.");
			}
			request.getRequestDispatcher("ThongTinCTV.jsp").forward(request, response);
		}else{
			response.sendRedirect("TrangChuCTVServlet");
		}
	}
}
