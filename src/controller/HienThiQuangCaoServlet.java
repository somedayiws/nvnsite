package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.QuangCaoBO;

@WebServlet("/admin/HienThiQuangCaoServlet")
public class HienThiQuangCaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HienThiQuangCaoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String idQC = request.getParameter("idQC");
		String hienthi = request.getParameter("hienthi");
		
		if(idQC!=null){
			QuangCaoBO quangCaoBo = new QuangCaoBO();
			if(quangCaoBo.HienThiQuangCao(idQC, hienthi)){
				if(hienthi.equals("1"))
					request.setAttribute("mes", "<div class='alert alert-success tbmeg' role='alert'>Gỡ bỏ thành công.</div>");
				else
					request.setAttribute("mes", "<div class='alert alert-success tbmeg' role='alert'>Đăng quảng cáo thành công.</div>");
			}else{
				if(hienthi.equals("1"))
					request.setAttribute("mes", "<div class='alert alert-danger tbmeg' role='alert'>Gỡ bỏ không thành công.</div>");
				else
					request.setAttribute("mes", "<div class='alert alert-danger tbmeg' role='alert'>Đăng quảng cáo không thành công.</div>");
			}
		}else{
			request.setAttribute("mes", "<div class='alert alert-warning tbmeg' role='alert'>Bạn không có thẩm quyền cho thao tác này.</div>");
		}
		request.getRequestDispatcher("AdvertisementServlet").forward(request, response);
	}

}
