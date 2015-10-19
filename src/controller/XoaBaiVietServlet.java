package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bo.BaiVietBO;
import model.bo.ThongBaoBO;

@WebServlet("/Xoa-bai-viet")
public class XoaBaiVietServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XoaBaiVietServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		if(id!=null){
			BaiVietBO baiviet = new BaiVietBO();
			if(baiviet.XoaBaiViet(id)){
				//Add thông báo
				ThongBaoBO tb = new ThongBaoBO();
				BAIVIET bv = baiviet.getBaiViet(id);
				String tieude = "Thông báo hủy bài viết "+id + " :"+bv.getTenBaiVietVi() + " "+ bv.getTenBaiVietJa();
				String noidung = "Kết quả xét duyệt bài viết: "+ bv.getTenBaiVietVi() + " "+ bv.getTenBaiVietJa() +" .Bài viết của bạn đã bị hủy do vi phạm các điều khoản của website! Để hiểu rõ hơn lý do xóa bài viết vui lòng Xem mục quy định của website. Hoặc liên hệ với quản trị viên để giải đáp! Xin cảm ơn.";
				String guiden = bv.getTaiKhoan().getTenTaiKhoan();
				System.out.println("Xuat thong bao huy bai thanh cong");
				tb.ThemThongBaoClient(tieude, noidung, guiden);
				response.sendRedirect("Trang-ca-nhan?xuly=xoa-thanhcong");
			}
			else
				response.sendRedirect("Trang-ca-nhan?xuly=xoa-thatbai");
			baiviet.closeConnection();
		}else{
			response.sendRedirect("Trang-chu");
		}
	}

}
