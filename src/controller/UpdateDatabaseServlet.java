package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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

@WebServlet("/UpdateDatabaseAdmin")
public class UpdateDatabaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateDatabaseServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String key = request.getParameter("key");
		
//		if(key.equals("Zxcvbnm1233")){
//			TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
//			if(taiKhoanBO.updateMd5Code()){
//				taiKhoanBO.closeConnection();
//				RequestDispatcher dispatcher = request
//						.getRequestDispatcher("Result.jsp");
//				request.setAttribute("Message",
//						"Cập nhật thành công - 更新を成功する。");
//				request.setAttribute("type", "success");
//				dispatcher.forward(request, response);
//			}else
//			{
//				taiKhoanBO.closeConnection();
//				RequestDispatcher dispatcher = request
//						.getRequestDispatcher("Result.jsp");
//				request.setAttribute("Message",
//						"Cập nhật thất bại - 更新を成功する。");
//				request.setAttribute("type", "fail");
//				dispatcher.forward(request, response);
//			}
//		}else{
			response.sendRedirect("Trang-chu");
//		}
	}

}
