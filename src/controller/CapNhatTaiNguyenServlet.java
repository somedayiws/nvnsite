package controller;

import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.QuangCaoBO;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.FileCleanerCleanup;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/admin/CapNhatTaiNguyenServlet")
public class CapNhatTaiNguyenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CapNhatTaiNguyenServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
		if (isMultipart) {
			String Image, imagee;
			String Image1, imagee1;
			
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
						filename = itemName.substring(itemName.lastIndexOf("\\") + 1);
						String realPath = getServletContext().getRealPath("/")+ "images/" + filename;
						File savedFile = new File(realPath);
						savedFile.renameTo(new File(getServletContext().getRealPath("/")+ "images/" + "Capture.PNG"));
						System.out.println("Xem : " + realPath);
						@SuppressWarnings("unused")
						FileCleanerCleanup item2 = new FileCleanerCleanup();
						// Upload file len server
						item.write(savedFile);
					} catch (Exception e) {
						System.out.println("Lỗi ở đây");
						e.printStackTrace();
					}
					break;
				}
			}
			imagee = (String) params.get("Imagee");
			if(filename == null || filename.trim().equals("")) Image = imagee;
			else Image = "../images/" + filename;
			
			request.getRequestDispatcher("TaiNguyen.jsp").forward(request, response);
		}
	}

}
