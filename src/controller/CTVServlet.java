package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.CTV;
import model.bo.CTVBO;

/**
 * Servlet implementation class CTVServlet
 */
@WebServlet("/admin/CTVServlet")
public class CTVServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CTVServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
//		String type = request.getParameter("type");
		
		CTVBO ctvBo = new CTVBO();
		
//		if(type!=null){
//			
//			ArrayList<CTV> listCTV = ctvBo.getListCTV(Integer.parseInt(type));
//			request.setAttribute("listCTV", listCTV);
//		}
//		else{
			/*listAll có 6 phần tử
			 * 
			 * 		1: Danh sách cộng tác viên và số bài đang dịch
			 * 		2: ...
			 */
			ArrayList<CTV> ctv = ctvBo.getListCTV();
			System.out.println("size: "+ctv.size());
			request.setAttribute("ctv", ctv);
			
		//}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("CTV.jsp");
		requestDispatcher.forward(request, response);
	}

}
