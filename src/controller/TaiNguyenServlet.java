package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.TaiNguyenBO;

@WebServlet("/admin/TaiNguyenServlet")
public class TaiNguyenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TaiNguyenServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		TaiNguyenBO tainguyenBO = new TaiNguyenBO();
		String sotu = tainguyenBO.getValue("SoTuDich");
		String giaVN = tainguyenBO.getValue("ThanhTienVN");
		String giaJA = tainguyenBO.getValue("ThanhTienJA");
		String banggiadich = tainguyenBO.getValue("BangGiaDich");
		String banggiaqc = tainguyenBO.getValue("BangGiaQuangCao");
		request.setAttribute("sotu", sotu);
		request.setAttribute("giaVN", giaVN);
		request.setAttribute("giaJA", giaJA);
		request.setAttribute("banggiadich", banggiadich);
		request.setAttribute("banggiaqc", banggiaqc);
		request.getRequestDispatcher("TaiNguyen.jsp").forward(request, response);
	}

}
