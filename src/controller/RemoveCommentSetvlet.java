package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.CommentBO;

/**
 * Servlet implementation class RemoveCommentSetvlet
 */
@WebServlet("/admin/RemoveCommentSetvlet")
public class RemoveCommentSetvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveCommentSetvlet() {
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
		
		/*Xóa bình luận bài viết*/
		CommentBO commentBo = new CommentBO();
		String resultDeleteComment;
		if(commentBo.deleteComent(id)){
			resultDeleteComment = "Xóa bình luận thành công - コメントを削除できた.";
		}else{
			resultDeleteComment = "Xóa bình luận thất bại - コメントをまだ削除できなかった.";
		}
		request.setAttribute("result", resultDeleteComment);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Message.jsp");
		commentBo.closeConnection();
		requestDispatcher.forward(request, response);
		
	}

}
