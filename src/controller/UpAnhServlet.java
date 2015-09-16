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

@WebServlet("/UpAnhServlet")
public class UpAnhServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpAnhServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	@SuppressWarnings({ "rawtypes", "unused", "unchecked" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
			try {
				boolean isMultipart = ServletFileUpload
						.isMultipartContent(request);
				if (!isMultipart) {
					RequestDispatcher requestDispatcher = request
							.getRequestDispatcher("ThemSanPham.jsp");
					requestDispatcher.forward(request, response);
				} else {

					FileItemFactory factory = new DiskFileItemFactory();
					ServletFileUpload upload = new ServletFileUpload(factory);
					List items = null;

					String id;
					String tensanpham;
					String mota;
					String giaban;
					String hinhanh;

					try {
						items = upload.parseRequest(request);
					} catch (FileUploadException e) {
						e.printStackTrace();
					}

					Iterator iter = items.iterator();
					Hashtable params = new Hashtable();
					String filename = null;

					while (iter.hasNext()) {

						FileItem item = (FileItem) iter.next();
						if (item.isFormField()) {
							// GetFieldName -> Parameter
							// GetString -> Value of Form
							// GetName -> file name of file component
							// out.println(item.getFieldName()+"@@@@@@"+item.getName()+
							// "@@@@@@@@@@@"+ item.getString());
							params.put(item.getFieldName(),item.getString("UTF-8"));
							System.out.println("Du lieu: " + item.getString()
									+ "       " + item.getFieldName());
						} else {
							try {
								// out.println(item.getFieldName() + "@@@@@@"
								// + item.getName() + "@@@@@@@@@@@"
								// + item.getString());
								String itemName = item.getName();

								filename = itemName.substring(itemName
										.lastIndexOf("\\") + 1);
								
//								filename = "IMG"
//										+ filename.substring(filename
//												.indexOf("."));
								String realPath = getServletContext()
										.getRealPath("/")
										+ "images\\" + filename;

								System.out.println(realPath);

								File savedFile = new File(realPath);
								FileCleanerCleanup item2 = new FileCleanerCleanup();
								// Upload file l�n server
								item.write(savedFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
					}

					id = (String) params.get("id");
					tensanpham = (String) params.get("tensanpham");
					mota = (String) params.get("mota");
					giaban = (String) params.get("giaban");
					hinhanh = filename;
					System.out.println("file name : image/" + filename);
				}
			} catch (Exception e) {
				System.out.println("Throw exception upload file!");
			}
	}
}
