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
import model.bo.CreateCategoryBO;

/**
 * Servlet implementation class CreateCategoryServlet
 */
@WebServlet("/admin/CreateCategoryServlet")
public class CreateCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateCategoryServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		boolean isMultipart = ServletFileUpload
				.isMultipartContent(request);
		String nameCategoryVi;
		String nameCategoryJa;
		String icon;
		String display;
		if (!isMultipart) {
		/** Get data from client */
		 nameCategoryVi = request.getParameter("nameCategoryVi");
		 nameCategoryJa = request.getParameter("nameCategoryJa");
		 display = request.getParameter("display");
		 icon = request.getParameter("Image");
		}else{			
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
			
			nameCategoryVi = (String) params.get("nameCategoryVi");
			nameCategoryJa = (String) params.get("nameCategoryJa");
			display = (String) params.get("display");
			
			if(filename == null || filename.trim().equals("")) icon = "icondefault.png";
			else icon = filename;
			
		}
				
		System.out.println("display: "+display);
		int show;

		CreateCategoryBO createCategory = new CreateCategoryBO();

		/** Create Object */
		DANHMUC category = new DANHMUC();

		/** Put data into object */
		category.setTenDanhMucVi(nameCategoryVi);
		category.setTenDanhMucJa(nameCategoryJa);
		category.setIcon(icon);
		/** Check validate */
		if (createCategory.checkValidate(category, display)) {
			if (display.equals("yes"))
				show = 1;
			else
				show = 0;
			category.setHienThi(show);
			/** Check exist */
			if (createCategory.checkExist(category)) {
				// Exist
				request.setAttribute("error", "Danh mục đã tồn tại trong hệ thống - 項目は既にシステム上に存在される");
				RequestDispatcher requestDis_error = request
						.getRequestDispatcher("Error.jsp");
				createCategory.closeConnection();
				requestDis_error.forward(request, response);

			} else {
				// Not exist
				String id_Category = createCategory
						.id_Category_after_increase();
				if (id_Category == null) {
					request.setAttribute(
							"error",
							"Không thể tăng ID danh mục");
					RequestDispatcher requestDis_error = request
							.getRequestDispatcher("Error.jsp");
					createCategory.closeConnection();
					requestDis_error.forward(request, response);
				} else {
					category.setIdDanhMuc(id_Category);
					/** Insert into DB */
					if (createCategory.insertCategory(category)) {
						//Insert success
						request.setAttribute("resultInsert", "Insert success");
						RequestDispatcher requsetDis_result = request.getRequestDispatcher("ListCategoryServlet");
						createCategory.closeConnection();
						requsetDis_result.forward(request, response);
					}
					else{
						//Insert fail
						request.setAttribute("resultInsert", "Insert fail");
						RequestDispatcher requestDis_error = request
								.getRequestDispatcher("ListCategoryServlet");
						createCategory.closeConnection();
						requestDis_error.forward(request, response);
					}
				}
			}

		} else {
			request.setAttribute("error", "Bạn phải nhập đầy đủ thông tin - あなたの情報を全て入力しなかった.");
			RequestDispatcher requestDis_error = request
					.getRequestDispatcher("Error.jsp");
			requestDis_error.forward(request, response);
		}
		

	}

}
