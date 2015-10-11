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

@WebServlet("/admin/editAdvertisementServlet")
public class editAdvertisementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public editAdvertisementServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		boolean isMultipart = ServletFileUpload
				.isMultipartContent(request);
		
		if (isMultipart) {
			String id;
			String company, dienthoai, email;
			String link;
			String page;
			String position;
			String numberOfDay;
			String Image, imagee, ChonUrl;
			String price;
			
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
						filename = itemName.substring(itemName
								.lastIndexOf("\\") + 1);
						String realPath = getServletContext().getRealPath("/")+ "images/quangcao/" + filename;
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
			//Thông tin đối tác
			company = (String) params.get("company");
			dienthoai = (String) params.get("dienthoai");
			email = (String) params.get("email");
			//Thông tin quảng cáo
			id = (String) params.get("idQC");	
			link = (String) params.get("link");		
			page = (String) params.get("page");
			imagee = (String) params.get("Imagee");
			if(page.equals("1"))
				position = (String) params.get("positionInHome");
			else
				position = (String) params.get("positionInNoHome");
			numberOfDay = (String) params.get("numberOfDay");
			price = (String) params.get("price");
			ChonUrl = (String) params.get("ChonUrl");
			if(ChonUrl.equals("1"))
				if(filename == null || filename.trim().equals("")) Image = imagee;
				else Image = "images/quangcao/" + filename;
			else
				Image = (String) params.get("Image1");
			
			//Thêm dữ liệu vào hệ thống
			QuangCaoBO qcBO = new QuangCaoBO();
			if(qcBO.SuaQuangCao(id, company, dienthoai, email, link, page, position, numberOfDay, price, Image)){
				request.setAttribute("mes", "<div class='alert alert-success tbmeg' role='alert'>Cập nhật thành công.</div>");
			}else{
				request.setAttribute("mes", "<div class='alert alert-danger tbmeg' role='alert'>Cập nhật không thành công.</div>");
			}
			qcBO.closeConnection();
			request.getRequestDispatcher("AdvertisementServlet").forward(request, response);
		}
	}

}
