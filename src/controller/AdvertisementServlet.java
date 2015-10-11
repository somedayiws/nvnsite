package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.QUANGCAO;
import model.bo.AdvertisementBO;

@WebServlet("/admin/AdvertisementServlet")
public class AdvertisementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdvertisementServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		if(request.getSession().getAttribute("username")==null){
			response.sendRedirect("LoginServlet");
		}else{
		
		//Nhận lại danh sách các quảng cáo
		AdvertisementBO listAdvertisement = new AdvertisementBO();
		
		//Trang đầu tiên
		int page = 1;
		//Hiển thị ra 10 bảng ghi, hiển thị từ trang 1-> trang 5, nhiều hơn thì xuất hiện dấu chấm
		listAdvertisement.setMenu(10, 5);
		
		try {
			//Lấy giá trị page
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
		ArrayList<QUANGCAO> listHienThi = listAdvertisement.getAdvertisement(page, true);
		ArrayList<QUANGCAO> listDangKy = listAdvertisement.getAdvertisement(page, false);
		String pageNav = listAdvertisement.getMenuPhanTrang();
		request.setAttribute("listHienThi", listHienThi);
		request.setAttribute("listDangKy", listDangKy);
		request.setAttribute("pageNav", pageNav);
		
		RequestDispatcher requestDis = request.getRequestDispatcher("Advertisement.jsp");
		listAdvertisement.closeConnection();
		requestDis.forward(request, response);
	}
	}
}
