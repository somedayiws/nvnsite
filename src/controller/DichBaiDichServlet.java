package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bean.TAIKHOAN;
import model.bo.BaiVietBO;

@WebServlet("/ctv/Dich-bai")
public class DichBaiDichServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DichBaiDichServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		
		if(id != null && !"".equals(id)){
			String submit =  request.getParameter("submit");
			BaiVietBO baiviet = new BaiVietBO();
			BAIVIET bviet = null;
			if(submit==null){
				bviet = baiviet.getBaiViet(id);
				request.setAttribute("baiviet", bviet);
				TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
				String info = baiviet.getInfo(id, user.getIdTaiKhoan());
				request.setAttribute("TinhTrang", info.split(",")[0]);
				request.setAttribute("NgayGui", info.split(",")[1]);
				baiviet.closeConnection();
				request.getRequestDispatcher("DichBai.jsp").forward(request, response);
			}else{
				TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
				String tieude =  request.getParameter("tieude");
				String mota =  request.getParameter("mota");
				String noidung =  request.getParameter("noidung");
				String kqua = "";
				if(submit.equals("luu")){
					if(baiviet.CapNhatBaiViet(id, tieude, mota, noidung, "DangDich", user.getNgonNgu(), user.getIdTaiKhoan())) kqua="?xuly=luu-thanhcong";
					else kqua="?xuly=luu-thatbai";
				}else if(submit.equals("gui")){
					if(baiviet.CapNhatBaiViet(id, tieude, mota, noidung, "DangBai", user.getNgonNgu(), user.getIdTaiKhoan())) kqua="?xuly=gui-thanhcong";
					else kqua="?xuly=gui-thatbai";
				}else if(submit.equals("huy")){
					if(baiviet.CapNhatBaiViet(id, "HuyDich", user.getIdTaiKhoan())) kqua="?xuly=huy-thanhcong";
					else kqua="?xuly=huy-thatbai";
				}
				baiviet.closeConnection();
				response.sendRedirect("Danh-sach-bai-dich"+kqua);
			}
		}else{
			response.sendRedirect("Trang-chu");
		}
	}

}
