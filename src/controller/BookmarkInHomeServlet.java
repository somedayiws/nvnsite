package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.ChangeStatusBO;

/**
 * Servlet implementation class BookmarkInHomeServlet
 */
@WebServlet("/admin/BookmarkInHomeServlet")
public class BookmarkInHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookmarkInHomeServlet() {
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
		
		String id = request.getParameter("id");
		
		//Đếm số bài viết đã ghim trong cơ sở dữ liệu
		ChangeStatusBO changeStatusBo = new ChangeStatusBO();
		
		int numberOfPostBookmark = changeStatusBo.numberOfPostsBookmark();
		String resultChangeStatusBookmark = null;
		
		if(numberOfPostBookmark<=20){
			//thay đổi trường gim bài viết
			if(changeStatusBo.changeBookmark(id)){
				int bookmarkOfPost = changeStatusBo.getPostBookmarkById(id);
				if(bookmarkOfPost==1){
				resultChangeStatusBookmark = "Bài viết đã được ghim lên trang chủ - ";
				}else{
					resultChangeStatusBookmark = "Bài viết đã được gỡ bỏ gim lên trang chủ - ";
				}
			}else{
				resultChangeStatusBookmark = "Thay đổi thất bại - ";
			}
			
		}else{
			resultChangeStatusBookmark = "Số lượng bài viết đã tối đa, bạn cần thay đổi các bài đã ghim để ghim các bài khác - ";
		}
		request.setAttribute("result", resultChangeStatusBookmark);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Message.jsp");
		requestDispatcher.forward(request, response);
	}

}
