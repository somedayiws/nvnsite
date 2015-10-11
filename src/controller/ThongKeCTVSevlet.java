package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.BaiVietBO;

@WebServlet("/ctv/Thong-ke")
public class ThongKeCTVSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ThongKeCTVSevlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		BaiVietBO bviet = new BaiVietBO();
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
		if(user!=null){
		String all = bviet.getCountAll(user.getIdTaiKhoan());
		String moi = bviet.getCountMoi(user.getIdTaiKhoan());
		String dich = bviet.getCountDich(user.getIdTaiKhoan());
		String tre = bviet.getCountTre(user.getIdTaiKhoan());
		
		request.setAttribute("all", all);
		request.setAttribute("moi", moi);
		request.setAttribute("dich", dich);
		request.setAttribute("tre", tre);
		
		bviet.closeConnection();
		request.getRequestDispatcher("ThongKeCTV.jsp").forward(request, response);
		}
	}

}
