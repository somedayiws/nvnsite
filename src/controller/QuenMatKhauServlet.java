package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
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
import model.bo.EmailUtility;
import model.bo.QuangCaoBO;
import model.bo.TaiKhoanBO;
import model.bo.TaiNguyenBO;
import model.bo.ThongBaoBO;

@WebServlet("/Quen-mat-khau")
public class QuenMatKhauServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QuenMatKhauServlet() {
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
		String txtFind = (String)request.getAttribute("txtFind");
		if(txtFind == null) txtFind="";
		// Danh sách quảng cáo
		QuangCaoBO quangCaoBO = new QuangCaoBO();
		ArrayList<QUANGCAO> listquangcao = quangCaoBO.getDanhSachQuangCao((int) 2);
		request.setAttribute("listquangcao", listquangcao);
		
		if(taikhoan != null){
			ServletContext context = getServletContext();
			
			String host = context.getInitParameter("host");
			String port = context.getInitParameter("port");
			String user = context.getInitParameter("user");
			String pass = context.getInitParameter("pass");
			TaiKhoanBO ctv = new TaiKhoanBO();
			TAIKHOAN tk = ctv.getTaiKhoan(taikhoan, "reset");
			
			DanhMucBO danhmuc = new DanhMucBO();
			BaiVietBO baiviet = new BaiVietBO();
			//Danh mục hiển thị
			ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc(txtFind);
			//Danh sách bài viết host
			request.setAttribute("listdanhmuc", listdanhmuc);
			ArrayList<BAIVIET> topmoi = baiviet.getTopBaiViet("Moi");
			request.setAttribute("topmoi", topmoi);
			
			// List thông báo
			ThongBaoBO thongBaoBO = new ThongBaoBO();
			ArrayList<THONGBAO> listthongbao = thongBaoBO.getListHienThi("", "1","DienDan");
			request.setAttribute("listthongbao", listthongbao);

			TaiNguyenBO tainguyenBO = new TaiNguyenBO();
			
			String ThongDiep = tainguyenBO.getValue("ThongDiep");
			String LienHe = tainguyenBO.getValue("LienHe");
			String DienThoai = tainguyenBO.getValue("DienThoai");
			String Email = tainguyenBO.getValue("Email");
			
			request.setAttribute("ThongDiep", ThongDiep);
			request.setAttribute("LienHe", LienHe);
			request.setAttribute("DienThoai", DienThoai);
			request.setAttribute("Email", Email);
			
			if(tk != null){
				String email = tk.getEmail();
				tk.setMatKhau(RandomPassword.password());
				String tieude = "JPVN.NET - Reset mật khẩu tài khoản[アカウントをのパスワードをリッセトして下さい]";
				String noidung = "Chào(ようこそ) " + tk.getHoTen() + "\nĐây là thông tin tài khoản của bạn sau khi reset(リッセト後、こちらのアカウントはあなたのものです)\n\nTài khoản(アカウント) : " 
				+ tk.getTenTaiKhoan() + "\nMật khẩu(パスワード) : " + tk.getMatKhau() + "\nVui lòng đăng nhập sớm và cập nhật lại mật khẩu của bạn(早めにログインし、パスワードを更新して下さい).\n\nCám ơn nhiều(誠にありがとうございます)!";
				if(ctv.UpdateThongTin(tk)){
					String resultMessage = "";
					try {
			            EmailUtility.sendEmail(host, port, user, pass, email, tieude,noidung);
			            resultMessage = "<div class='alert alert-success' role='alert'><p>Đã reset mật khẩu xong. Vui lòng vào mail kiểm tra lại. Cám ơn!<br>パスワードが既にリセットされたため、あなたのメールを改めて確認して下さい。ありがとうございます.</p></div>";
			        } catch (Exception ex) {
			            ex.printStackTrace();
			            resultMessage = "<div class='alert alert-danger' role='alert'><p>Tài khoản không tồn tại. Vui lòng kiểm tra lại.<br>アカウントを存在しないため、改めて確認して下さい</p></div>";
			        } finally {
			            request.setAttribute("meg", resultMessage);
			            tainguyenBO.closeConnection();
			            danhmuc.closeConnection();
			            baiviet.closeConnection();
			            thongBaoBO.closeConnection();
			            quangCaoBO.closeConnection();
			            request.getRequestDispatcher("QuenMatKhau.jsp").forward(request, response);
			        }
				} else {
					request.setAttribute("meg", "<div class='alert alert-warning' role='alert'><p>Lỗi hệ thống. Vui lòng Reset lại trang. Cám ơn!<br>システムのエラーを発生するため、ホームページをリセットして下さい。ありがとうございます.</p></div>");
					tainguyenBO.closeConnection();
					danhmuc.closeConnection();
		            baiviet.closeConnection();
		            thongBaoBO.closeConnection();
		            quangCaoBO.closeConnection();
					request.getRequestDispatcher("QuenMatKhau.jsp").forward(request, response);
		        }
			}else{
				request.setAttribute("meg", "<div class='alert alert-danger' role='alert'><p>Tài khoản không tồn tại. Vui lòng kiểm tra lại.</p></div>");
				tainguyenBO.closeConnection();
				danhmuc.closeConnection();
	            baiviet.closeConnection();
	            thongBaoBO.closeConnection();
	            quangCaoBO.closeConnection();
				request.getRequestDispatcher("QuenMatKhau.jsp").forward(request, response);
			}
		}else{
			request.getRequestDispatcher("QuenMatKhau.jsp").forward(request, response);
		}			
	}

}
