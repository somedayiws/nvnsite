package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bo.AdminEditPostsBO;
import model.bo.ChangeStatusBO;
import model.bo.ShowAdminEditPostsBO;
import model.bo.ThongBaoBO;

/**
 * Servlet implementation class UploadPostServlet
 */
@WebServlet("/admin/UploadPostServlet")
public class UploadPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadPostServlet() {
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
		String idPost = request.getParameter("idPost");
		
		String type = request.getParameter("type");
		String btn = request.getParameter("btn");
		
		if(btn.equals("btnSave") && type.equals("translate")){
			String namePostVi = request.getParameter("namePostVi");
			String namePostJa = request.getParameter("namePostJa");
			String decriptionVi = request.getParameter("decriptionVi");
			String decriptionJa = request.getParameter("decriptionJa");
			String contentVi = request.getParameter("contentVi");
			String contentJa = request.getParameter("contentJa");
			
			
			BAIVIET post = new BAIVIET();
			
			post.setIdBaiViet(idPost);
			post.setTenBaiVietVi(namePostVi);
			post.setTenBaiVietJa(namePostJa);
			post.setMoTaVi(decriptionVi);
			post.setMoTaJa(decriptionJa);
			post.setNoiDungVi(contentVi);
			post.setNoiDungJa(contentJa);
			
			
				request.setAttribute("post", post);
				RequestDispatcher dispatcher = request.getRequestDispatcher("SavePostServlet");
				dispatcher.forward(request, response);
			}
		else{
			
			if(type.equals("translate")){
				String namePostVi = request.getParameter("namePostVi");
				String namePostJa = request.getParameter("namePostJa");
				String decriptionVi = request.getParameter("decriptionVi");
				String decriptionJa = request.getParameter("decriptionJa");
				String contentVi = request.getParameter("contentVi");
				String contentJa = request.getParameter("contentJa");
				
				
				BAIVIET post = new BAIVIET();
				
				post.setIdBaiViet(idPost);
				post.setTenBaiVietVi(namePostVi);
				post.setTenBaiVietJa(namePostJa);
				post.setMoTaVi(decriptionVi);
				post.setMoTaJa(decriptionJa);
				post.setNoiDungVi(contentVi);
				post.setNoiDungJa(contentJa);
				String resultTranslate;
				AdminEditPostsBO adminEditPostBo = new AdminEditPostsBO();
				if(adminEditPostBo.updatePost_Translated(post)){
					resultTranslate = "Dịch bài viết thành công - 記事が翻訳できた";
				}
				else{
					resultTranslate = "Dịch bài viết thất bại - 記事がまだ翻訳できない";
				}
				adminEditPostBo.closeConnection();
				request.setAttribute("resultTranslate", resultTranslate);
			}
		
		ShowAdminEditPostsBO checkID = new ShowAdminEditPostsBO();
		ChangeStatusBO updateStatus = new ChangeStatusBO();
		if(idPost!=null && checkID.checkExist_Post(idPost)){
			updateStatus.changeStatusPost("OK", idPost, "Đã hoàn thành");
			request.setAttribute("idPost", idPost);
			request.setAttribute("resultOK", "Duyệt bài thành công - 記事が承認された");
			//Add thông báo
			ThongBaoBO tb = new ThongBaoBO();
			String tieude = "Thông báo duyệt bài viết[承認された記事のお知らせです] "+idPost;
			String noidung = "Bài viết của bạn đã được xét duyệt thành công(あなたの記事が承認された)!<br>Xem chi tiết bài viết tại địa chỉ(次のアドレスに記事を詳しく参照して下さい): <a href='http://jpvn.net/Xem-bai-viet?id="+idPost+"'>http://jpvn.net/Xem-bai-viet?id="+idPost+"</a>";
			String guiden = checkID.post(idPost).getTaiKhoan().getTenTaiKhoan();
			System.out.println("Xuat thong bao duyet bai thanh cong");
			tb.ThemThongBaoClient(tieude, noidung, guiden);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ShowDetailPostsServlet");
			checkID.closeConnection();
			updateStatus.closeConnection();
			dispatcher.forward(request, response);
		}else{
			checkID.closeConnection();
			updateStatus.closeConnection();
			response.sendRedirect("Error.jsp");
		}
	}
	}

}
