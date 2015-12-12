package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TAIKHOAN;
import model.bo.TaiKhoanBO;
import Utils.APIWrapper;
import Utils.Utils;

/**
 * Servlet implementation class LoginFacebook
 */
@WebServlet("/DirectLink")
public class LoginRedirectLink extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginRedirectLink() {
		super();
	} 

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String url = request.getParameter("url");
		System.out.println(type + url);
		if(type.equals("fb")){
			response.sendRedirect(url);
		}else if(type.equals("gg"))
		{
			response.sendRedirect(url);
		}
//	}catch (Exception e){
//		response.sendRedirect("Trang-chu");
//	}
	}

}
