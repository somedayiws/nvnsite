package controller;

import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

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

import model.bean.DANHMUC;
import model.bo.EditCategoryBO;

/**
 * Servlet implementation class EditCategoryServlet
 */
@WebServlet("/admin/EditCategoryServlet")
public class EditCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idCategory = request.getParameter("id");
		EditCategoryBO editCategory = new EditCategoryBO();
		String resultChangeShowed;//biến lưu kết quả thay đổi
		//Kiểm tra id danh mục có tồn tại hay không
		if(editCategory.checkExistID(idCategory)){
			//Có tồn tại
			if(editCategory.changeShowed(idCategory)){
				//thay đổi thành công
				resultChangeShowed = "Thay đổi thành công - 変更を成功した.";
			}
			else{
				//thay đổi không thành công
				resultChangeShowed = "Thay đổi không thành công - 変更を失敗した.";
			}			
			request.setAttribute("resultChangeShowed", resultChangeShowed);
			RequestDispatcher requestDis = request.getRequestDispatcher("ListCategoryServlet");
			editCategory.closeConnection();
			requestDis.forward(request, response);
		}else{
			//Không tồn tại			
			request.setAttribute("resultChangeShowed", "ID danh mục không tồn tại trong hệ thống - 項目IDはシステム上に存在しない.");
			RequestDispatcher requestDis = request.getRequestDispatcher("Error.jsp");
			editCategory.closeConnection();
			requestDis.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		boolean isMultipart = ServletFileUpload
				.isMultipartContent(request);
		
		String IdCategory;
		String nameCategoryVi;
		String nameCategoryJa;
		String icon;
		String display;
		String imageIcon;
		
		if (!isMultipart) {
		 IdCategory = request.getParameter("idCategory");
		 nameCategoryVi = request.getParameter("nameCategoryVi");
		 nameCategoryJa = request.getParameter("nameCategoryJa");
		 display = request.getParameter("display");
		 imageIcon = request.getParameter("ImageIcon");
		 icon = request.getParameter("Image");
		 
		}
		else{			
		
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			@SuppressWarnings("rawtypes")
			List items = null;
			

			try {
				items = upload.parseRequest(request);
				System.out.println("items_: "+items);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}

			@SuppressWarnings("rawtypes")
			Iterator iter = items.iterator();
			System.out.println("iter: "+iter);
			@SuppressWarnings("rawtypes")
			Hashtable params = new Hashtable();
			String filename = null;
			
			while (iter.hasNext()) {

				FileItem item = (FileItem) iter.next();
				if (item.isFormField()) {
					params.put(item.getFieldName(),item.getString("UTF-8"));
				} else {
					try {
						String itemName = item.getName();
						System.out.println("itemName: "+itemName);
						filename = itemName.substring(itemName
								.lastIndexOf("\\") + 1);
						System.out.println("filename: "+filename);
						String realPath = getServletContext().getRealPath("/")+ "images/icons/" + filename;
						
						System.out.println("realPath: "+realPath);
						
						File savedFile = new File(realPath);
						@SuppressWarnings("unused")
						FileCleanerCleanup item2 = new FileCleanerCleanup();
						// Upload file l�n server
						item.write(savedFile);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			
			
			IdCategory = (String) params.get("idCategory");
			nameCategoryVi = (String) params.get("nameCategoryVi");
			nameCategoryJa = (String) params.get("nameCategoryJa");
			
			display = (String) params.get("display");			
			imageIcon = (String)params.get("ImageIcon");			
			
			if(filename == null || filename.trim().equals("")) icon = imageIcon;
			else icon = filename;
			
			System.out.println("IdCategory: "+IdCategory);
			System.out.println("nameCategoryVi: "+nameCategoryVi);
			System.out.println("nameCategoryJa: "+nameCategoryJa);
			System.out.println("display: "+display);
			System.out.println("imageIcon: "+imageIcon);
			
		}
		int show;
		String resultUpdate;
		
		if(display!=null && display.equals("no")) show = 0;
		else show = 1;
		
		
		DANHMUC category = new DANHMUC();
		EditCategoryBO editCategory = new EditCategoryBO();
		
		category.setIdDanhMuc(IdCategory);
		category.setTenDanhMucVi(nameCategoryVi);
		category.setTenDanhMucJa(nameCategoryJa);
		category.setHienThi(show);
		category.setIcon(icon);
		
		if(editCategory.checkValidate(category))
		{
			//Valid
			if(editCategory.checkExist(category)){
				//Exist
				request.setAttribute("error", "Danh mục đã tồn tại trong hệ thống - 項目は既にシステム上に存在される.");
				RequestDispatcher requestDis_error = request.getRequestDispatcher("Error.jsp");
				requestDis_error.forward(request, response);
			}
			else{
				//Not exist
				if(editCategory.updateCategory(category))
				{
					//Update success
					resultUpdate = "Update success";
				}
				else{
					//Update fail
					resultUpdate = "Update fail";
				}
				request.setAttribute("resultUpdate", resultUpdate);
				RequestDispatcher requestDis_Update = request.getRequestDispatcher("ListCategoryServlet");
				requestDis_Update.forward(request, response);
			}
		}else
		{
			//Invalid
			request.setAttribute("error", "Bạn phải nhập tên danh mục tiếng việt và tiếng nhật.<br>ベトナム語また日本をどちらかに入力して下さい.");
			RequestDispatcher requestDis_error = request.getRequestDispatcher("Error.jsp");
			requestDis_error.forward(request, response);
		}
		
		
	}

}
