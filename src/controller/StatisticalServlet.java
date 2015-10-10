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

import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.TAIKHOAN;
import model.bo.StatisticalBO;

/**
 * Servlet implementation class StatisticalServlet
 */
@WebServlet("/admin/StatisticalServlet")
public class StatisticalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatisticalServlet() {
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
		
		String dayStart = request.getParameter("dayStart");
		String dayFinish = request.getParameter("dayFinish");
		String type = request.getParameter("type");
		String btnStatistical = request.getParameter("btnStatistical");
		
	
		
		StatisticalBO statisticalBo = new StatisticalBO();		 
		ArrayList<TAIKHOAN> listResultAccount = new ArrayList<TAIKHOAN>();
		ArrayList<DANHMUC> listResultCategory = new ArrayList<DANHMUC>();
		ArrayList<BAIVIET> listResultPost = new ArrayList<BAIVIET>();
		ArrayList<String> arrayNumberUser = null;
		ArrayList<String> arrayNumberCategory = null;
		ArrayList<String> arrayNumberPost = null;
		
		/*************************************************************
		* *********************** Thống kê người dùng ****************
		* *************************************************************/
			String resultStatisticUsers = "<strong>Tất cả người dùng - すべてのユーザーです。:</strong> <span class='badge'>"+statisticalBo.countUsers(1)+"</span><br>"+
					"<strong>Người dùng là User - 使用している会員はユーザーです。:</strong> <span class='badge'>"+statisticalBo.countUsers(2)+"</span><br>"+
					"<strong>Người dùng là CTV - ユーザーは協力者です。:</strong> <span class='badge'>"+statisticalBo.countUsers(3)+"</span><br>"+
					"<strong>Người dùng bị khóa tài khoản - ユーザーのアカウントがを禁止された。:</strong> <span class='badge'>"+statisticalBo.countUsers(4)+"</span><br>"+
					"<strong>Người dùng bị xóa tài khoản - ユーザーのアカウントがを削除された。:</strong> <span class='badge'>"+statisticalBo.countUsers(5)+"</span><br>"+
					"<strong>Người dùng có ngôn ngữ là tiếng việt - ベトナム語で使う。:</strong> <span class='badge'>"+statisticalBo.countUsers(6)+"</span><br>"+
					"<strong>Người dùng có ngôn ngữ là tiếng nhật - 日本語で使う。:</strong> <span class='badge'>"+statisticalBo.countUsers(7)+"</span><br>"+
					"<strong>Số cộng tác viên dịch từ tiếng việt sang tiếng nhật - ベトナム語から日本語へ翻訳する協力者の数です。:</strong> <span class='badge'>"+statisticalBo.countUsers(8)+"</span><br>"+
					"<strong>Số cộng tác viên dịch từ tiếng nhật sang tiếng việt - 日本語からベトナム語へ翻訳する協力者の数です。:</strong> <span class='badge'>"+statisticalBo.countUsers(9)+"</span><br>";
			
			if(btnStatistical!=null){
				if(type.equals("TKUser")){				
					for(int i=1;i<=4;i++){
						if(i<=2)
						listResultAccount.add(statisticalBo.getUsers(i, 2, dayStart, dayFinish));
						else
					
						listResultAccount.add(statisticalBo.getUsers(i, 1, null, null));
						
					}
					arrayNumberUser = statisticalBo.arrayNumber_Account;				
				}
				else if(type.equals("TKCTV")){				
					for(int i=1;i<=4;i++){
						if(i<=2)
						listResultAccount.add(statisticalBo.getUsers(i, 1, null, null));
						else
						listResultAccount.add(statisticalBo.getUsers(i, 2, dayStart, dayFinish));					
					}					
					arrayNumberUser = statisticalBo.arrayNumber_Account;
				}
				else{
					for(int i=1;i<=4;i++){
						listResultAccount.add(statisticalBo.getUsers(i, 1, null, null));
					}
				}
			}else{
				arrayNumberUser = statisticalBo.arrayNumber_Account;
				for(int i=1;i<=4;i++){
					listResultAccount.add(statisticalBo.getUsers(i, 1, null, null));
				}
			}
			
			
			/*************************************************************
			* *********************** Thống kê danh mục ****************
			* *************************************************************/
			String resultStatisticCategory = "<strong>Tất cả danh mục - すべて項目:</strong> <span class='badge'>"+statisticalBo.countCategorys(1)+"</span><br>"+
					"<strong>Danh mục bị xóa - 削除された項目です。:</strong> <span class='badge'>"+statisticalBo.countCategorys(2)+"</span><br>";
			if(btnStatistical!=null){
				if (type.equals("TKCat")){
					arrayNumberCategory = statisticalBo.arrayNumber_Category;
					for(int i=1;i<=2;i++){
						listResultCategory.add(statisticalBo.getCategory(i, 2, dayStart, dayFinish));
					}
				}else{
					arrayNumberCategory = statisticalBo.arrayNumber_Category;
					for(int i=1;i<=2;i++){
						listResultCategory.add(statisticalBo.getCategory(i, 1, null, null));
					}
				}
			}else{
				arrayNumberCategory = statisticalBo.arrayNumber_Category;
				for(int i=1;i<=2;i++){
					listResultCategory.add(statisticalBo.getCategory(i, 1, null, null));
				}
			}
			
			/*************************************************************
			* *********************** Thống kê bài viết ****************
			* *************************************************************/
			String resultStatisticPosts = null;
			if(btnStatistical!=null){
				if (type.equals("TKPosts")){
				resultStatisticPosts = "<strong>Tất cả bài viết - すべての記事です。:</strong> <span class='badge'>"+statisticalBo.countPosts(1, 2, dayStart, dayFinish)+"</span><br>"+
						"<strong>Số bài viết bị xóa - 削除された記事の数です。:</strong> <span class='badge'>"+statisticalBo.countPosts(2, 2, dayStart, dayFinish)+"</span><br>"+
						"<strong>Số bài viết đăng lên trang chủ - ホームに投稿された記事の数です。:</strong> <span class='badge'>"+statisticalBo.countPosts(3, 2, dayStart, dayFinish)+"</span><br>"+
						"<strong>Số bài viết mới đăng - 投稿したばかり記事の数です。:</strong> <span class='badge'>"+statisticalBo.countPosts(4, 2, dayStart, dayFinish)+"</span><br>"+
						"<strong>Số bài viết đang dịch - 翻訳中の記事の数です。:</strong> <span class='badge'>"+statisticalBo.countPosts(5, 2, dayStart, dayFinish)+"</span><br>"+
						"<strong>Số bài viết tiếng việt - ベトナム語での記事の数:</strong> <span class='badge'>"+statisticalBo.countPosts(6, 2, dayStart, dayFinish)+"</span><br>"+
						"<strong>Số bài viết tiếng nhật - 日本語で一番多い記事です。:</strong> <span class='badge'>"+statisticalBo.countPosts(7, 2, dayStart, dayFinish)+"</span><br>";
				arrayNumberPost = statisticalBo.arrayNumber_Post;
				for(int i=1;i<=3;i++){
					listResultPost.add(statisticalBo.getPost(i, 1, null, null));
					}
				}
				else if(type.equals("TKPost")){
					resultStatisticPosts = "<strong>Tất cả bài viết - すべての記事です。:</strong> <span class='badge'>"+statisticalBo.countPosts(1, 1, null, null)+"</span><br>"+
							"<strong>Số bài viết bị xóa - 削除された記事の数です。:</strong> <span class='badge'>"+statisticalBo.countPosts(2, 1, null, null)+"</span><br>"+
							"<strong>Số bài viết đăng lên trang chủ - ホームに投稿された記事の数です。:</strong> <span class='badge'>"+statisticalBo.countPosts(3, 1, null, null)+"</span><br>"+
							"<strong>Số bài viết mới đăng - 投稿したばかり記事の数です。:</strong> <span class='badge'>"+statisticalBo.countPosts(4, 1, null, null)+"</span><br>"+
							"<strong>Số bài viết đang dịch - 翻訳中の記事の数です。:</strong> <span class='badge'>"+statisticalBo.countPosts(5, 1, null, null)+"</span><br>"+
							"<strong>Số bài viết tiếng việt - ベトナム語での記事の数:</strong> <span class='badge'>"+statisticalBo.countPosts(6, 1, null, null)+"</span><br>"+
							"<strong>Số bài viết tiếng nhật - 日本語で一番多い記事です。:</strong> <span class='badge'>"+statisticalBo.countPosts(7, 1, null, null)+"</span><br>";
					arrayNumberPost = statisticalBo.arrayNumber_Post;
					for(int i=1;i<=3;i++){
						listResultPost.add(statisticalBo.getPost(i, 2, dayStart, dayFinish));
						}
				}
				
				else{
					resultStatisticPosts = "<strong>Tất cả bài viết - すべての記事です。:</strong> <span class='badge'>"+statisticalBo.countPosts(1, 1, null, null)+"</span><br>"+
							"<strong>Số bài viết bị xóa - 削除された記事の数です。:</strong> <span class='badge'>"+statisticalBo.countPosts(2, 1, null, null)+"</span><br>"+
							"<strong>Số bài viết đăng lên trang chủ - ホームに投稿された記事の数です。:</strong> <span class='badge'>"+statisticalBo.countPosts(3, 1, null, null)+"</span><br>"+
							"<strong>Số bài viết mới đăng - 投稿したばかり記事の数です。:</strong> <span class='badge'>"+statisticalBo.countPosts(4, 1, null, null)+"</span><br>"+
							"<strong>Số bài viết đang dịch - 翻訳中の記事の数です。:</strong> <span class='badge'>"+statisticalBo.countPosts(5, 1, null, null)+"</span><br>"+
							"<strong>Số bài viết tiếng việt - ベトナム語での記事の数:</strong> <span class='badge'>"+statisticalBo.countPosts(6, 1, null, null)+"</span><br>"+
							"<strong>Số bài viết tiếng nhật - 日本語で一番多い記事です。:</strong> <span class='badge'>"+statisticalBo.countPosts(7, 1, null, null)+"</span><br>";
					arrayNumberPost = statisticalBo.arrayNumber_Post;
					for(int i=1;i<=3;i++){
						listResultPost.add(statisticalBo.getPost(i, 1, null, null));
						}
				}
				
			}
			else{
				resultStatisticPosts = "<strong>Tất cả bài viế - すべての記事です。:</strong> <span class='badge'>"+statisticalBo.countPosts(1, 1, null, null)+"</span><br>"+
					"<strong>Số bài viết bị xóa - 削除された記事の数です。:</strong> <span class='badge'>"+statisticalBo.countPosts(2, 1, null, null)+"</span><br>"+
					"<strong>Số bài viết đăng lên trang chủ - ホームに投稿された記事の数です。:</strong> <span class='badge'>"+statisticalBo.countPosts(3, 1, null, null)+"</span><br>"+
					"<strong>Số bài viết mới đăng - 投稿したばかり記事の数です。:</strong> <span class='badge'>"+statisticalBo.countPosts(4, 1, null, null)+"</span><br>"+
					"<strong>Số bài viết đang dịch - 翻訳中の記事の数です。:</strong> <span class='badge'>"+statisticalBo.countPosts(5, 1, null, null)+"</span><br>"+
					"<strong>Số bài viết tiếng việt - ベトナム語での記事の数:</strong> <span class='badge'>"+statisticalBo.countPosts(6, 1, null, null)+"</span><br>"+
					"<strong>Số bài viết tiếng nhật - 日本語で一番多い記事です。:</strong> <span class='badge'>"+statisticalBo.countPosts(7, 1, null, null)+"</span><br>";
				arrayNumberPost = statisticalBo.arrayNumber_Post;
				for(int i=1;i<=3;i++){
					listResultPost.add(statisticalBo.getPost(i, 1, null, null));
					}
			}
					
					
			
			
			/*Gởi thống kê người dùng về client*/
			request.setAttribute("arrayNumberUser", arrayNumberUser);
			request.setAttribute("listResultAccount", listResultAccount);
			request.setAttribute("resultStatisticUsers", resultStatisticUsers);
			
			/*Gởi thống kê danh mục*/
			request.setAttribute("resultStatisticCategory", resultStatisticCategory);
			request.setAttribute("listResultCategory", listResultCategory);
			request.setAttribute("arrayNumberCategory", arrayNumberCategory);
			
			/*Gởi thống kê bài viết*/
			request.setAttribute("resultStatisticPosts", resultStatisticPosts);
			request.setAttribute("listResultPost", listResultPost);
			request.setAttribute("arrayNumberPost", arrayNumberPost);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("statistical.jsp");
			requestDispatcher.forward(request, response);		
		
			
				}
				else{
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");
					requestDispatcher.forward(request, response);		
				
				}
	}

}
