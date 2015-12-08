package controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.FileCleanerCleanup;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.imgscalr.Scalr;

import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.TAIKHOAN;
import model.bo.AdminEditPostsBO;
import model.bo.BaiVietBO;
import model.bo.DanhMucBO;
import model.bo.TaiNguyenBO;

/**
 * Servlet implementation class AdminEditPostsServlet
 */
@WebServlet("/admin/AdminEditPostsServlet")
public class AdminEditPostsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEditPostsServlet() {
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
		String idPost ="";
		String namePostVi = "";
		String namePostJa  = "";
		String idcategory  = "";
		
		String idaccount = "";
		String contentVi = "";
		String contentJa = "";
		String descriptionVi = "";
		String descriptionJa = "";
		String HinhAnh = "", linkan = "";
		try{
		boolean isMultipart = ServletFileUpload
				.isMultipartContent(request);
		if (isMultipart) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			@SuppressWarnings("rawtypes")
			List items = null;
			
			try {
				items = upload.parseRequest(request);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}

			@SuppressWarnings("rawtypes")
			Iterator iter = items.iterator();
			@SuppressWarnings("rawtypes")
			Hashtable params = new Hashtable();
			String filename = null;

			while (iter.hasNext()) {

				FileItem item = (FileItem) iter.next();
				if (item.isFormField()) {
					params.put(item.getFieldName(),item.getString("UTF-8"));
					idPost = (String) params.get("IdPost");
				} else {
					try {
						String itemName = item.getName();
						filename = itemName.substring(itemName
								.lastIndexOf("\\") + 1);
						filename = idPost
								+ filename.substring(filename
										.indexOf("."));
						String realPath = getServletContext().getRealPath("/")+ "images/Thumbs/" + filename;
						System.out.println(realPath);
						File savedFile = new File(realPath);
						@SuppressWarnings("unused")
						FileCleanerCleanup item2 = new FileCleanerCleanup();
						// Upload file l�n server
						BufferedImage img = ImageIO.read(item.getInputStream());
						BufferedImage scaledImg = Scalr.resize(img, 800);
						ImageIO.write(scaledImg, filename.substring(filename
								.indexOf(".")+1), savedFile);
						System.out.println("file extension : "+filename.substring(filename
								.indexOf(".")+1));
					} catch (Exception e) {
						System.out.println("Trùng file ban đầu.");
					}
				}
			}
			
			 idPost = (String) params.get("IdPost");
			 namePostVi = (String) params.get("namePostVi");
			 namePostJa = (String) params.get("namePostJa");
			 idcategory = (String) params.get("category");
			
			 idaccount = (String) params.get("account");
			 contentVi = (String) params.get("contentVi");
			 contentJa = (String) params.get("contentJa");
			 descriptionVi = (String) params.get("descriptionVi");
			 descriptionJa = (String) params.get("descriptionJa");
			 linkan = (String) params.get("linkan");

			if(filename == null || filename.trim().equals(""))
				if(linkan.equals("") || linkan == null) HinhAnh = "images/baiviet.jpg";
				else HinhAnh = linkan;
			else HinhAnh = "images/Thumbs/"+filename;
		}
		} catch (Exception e) {
			System.out.println("Throw exception upload file!");
			response.sendRedirect("Trang-chu");
		}
		
		if(namePostVi == null){
			namePostVi = "";
		}
		if(namePostJa == null){
			namePostJa = "";
		}
		if(contentVi == null){
			contentVi = "";
		}
		if(contentJa == null){
			contentJa = "";
		}
		if(descriptionVi == null){
			descriptionVi = "";
		}
		if(descriptionJa == null){
			descriptionJa = "";
		}
		
		String resultEdit;
		BAIVIET post = new BAIVIET();
		
		post.setIdBaiViet(idPost);
		post.setTenBaiVietVi(namePostVi);
		post.setTenBaiVietJa(namePostJa);
		post.setNoiDungVi(contentVi);
		post.setNoiDungJa(contentJa);
		post.setMoTaVi(descriptionVi);
		post.setMoTaJa(descriptionJa);
		post.setLienKet(HinhAnh);
		/**update posts in database*/
		AdminEditPostsBO adminEditPosts = new AdminEditPostsBO();
		
		if(adminEditPosts.updatePost(post, idcategory, idaccount)){
			resultEdit = "Chỉnh sửa bài viết thành công - 記事が修正できた";
		}
		else{
			resultEdit = "Chỉnh sửa bài viết thất bại - 記事が修正できない。";
		}
		request.setAttribute("resultEdit", resultEdit);
		RequestDispatcher requestDis_edit = request.getRequestDispatcher("ShowAdminEditPostsServlet?idPost="+idPost+"&from=detail");
		adminEditPosts.closeConnection();
		requestDis_edit.forward(request, response);
	}

}
