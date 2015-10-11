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

@WebServlet("/ctv/Xem-bai-dich")
public class XemBaiDichServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XemBaiDichServlet() {
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
			BaiVietBO baiviet = new BaiVietBO();
			BAIVIET bviet = null;
			bviet = baiviet.getBaiViet(id);
			TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
			String info = baiviet.getInfo(id, user.getIdTaiKhoan());
			request.setAttribute("TinhTrang", info.split(",")[0]);
			request.setAttribute("NgayGui", info.split(",")[1]);
			request.setAttribute("baiviet", bviet);
			baiviet.closeConnection();
			request.getRequestDispatcher("XemBaiDich.jsp").forward(request, response);
		}else{
			response.sendRedirect("Dang-nhap");
		}
	}

}
