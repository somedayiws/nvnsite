package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		//Check session exist
				HttpSession session_user = request.getSession();
				String username =(String)session_user.getAttribute("username");	
			
				if(username!=null){
		//Nhận kết quả tạo tài khoản từ AdminCreateServlet,AdminDeleteServlet,AdminEditServlet
		String result = (String)request.getAttribute("result");
		String button = request.getParameter("btnFind");
		String typeFind = request.getParameter("typeFind");
		String stringFind = request.getParameter("stringFind");
		
		String result_Restore = (String)request.getAttribute("result_Restore");
		if(result!=null)
		{
			 if(result.contains("Delete success")) result = "Xóa cộng tác viên thành công - 協力者がロックされた";
			 else if(result.contains("Delete fail")) result = "Xóa cộng tác viên thất bại - 協力者がまだロックできない";
		}
		if(result_Restore!=null) result = result_Restore;
		
		CTVBO ctvBo = new CTVBO();
			/*listAll có 6 phần tử
			 * 
			 * 		1: Danh sách cộng tác viên và số bài đang dịch
			 * 		2: ...
			 */
		int page = 1;
		ctvBo.setMenu(10, 5);
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
		ArrayList<CTV> ctv;
		if(button!=null){
			//Nhấn button tìm kiếm
			ctv = ctvBo.getListCTV(page, typeFind, stringFind);
		}else{
			ctv = ctvBo.getListCTV(page,null,null);
		}
			String pageNav = ctvBo.getMenuPhanTrang();
			
		request.setAttribute("ctv", ctv);
		request.setAttribute("pageNav", pageNav);	
		request.setAttribute("result", result);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("CTV.jsp");
		ctvBo.closeConnection();
		requestDispatcher.forward(request, response);
	}else{
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");
		requestDispatcher.forward(request, response);
	}
	}
	
}
