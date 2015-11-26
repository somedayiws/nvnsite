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

import model.bo.TaiNguyenBO;

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
		if(request.getSession().getAttribute("username")==null){
			response.sendRedirect("LoginServlet");
		}else{
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
		if (isMultipart) {
			String Image, imagee;
			String Image1, imagee1;
			String SoTu, GiaVN, GiaJA;
			String ThongDiep, LienHe, DienThoai, Email, GioiThieu, NoiQuy;
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
			String filename[] = {"", ""} ;
			int i=0;

			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				if (item.isFormField()) {
					params.put(item.getFieldName(),item.getString("UTF-8"));
				} else {
					try {
						String itemName = item.getName();
						filename[i] = itemName.substring(itemName.lastIndexOf("\\") + 1);
						String realPath = getServletContext().getRealPath("/")+ "images/tainguyen/" + filename[i];
						File savedFile = new File(realPath);
						System.out.println(realPath);
						@SuppressWarnings("unused")
						FileCleanerCleanup item2 = new FileCleanerCleanup();
						// Upload file len server
						item.write(savedFile);
					} catch (Exception e) {
						System.out.println("Lỗi ở đây");
						e.printStackTrace();
					}
					i++;
				}
			}
			SoTu = (String) params.get("SoTuDich");
			GiaVN = (String) params.get("ThanhTienVN");
			GiaJA = (String) params.get("ThanhTienJA");
			imagee = (String) params.get("Imagee");
			imagee1 = (String) params.get("Imagee1");
			ThongDiep = (String) params.get("ThongDiep");
			GioiThieu = (String) params.get("txtGioiThieu");
			NoiQuy = (String) params.get("txtNoiQuy");
			LienHe = (String) params.get("LienHe");
			DienThoai = (String) params.get("DienThoai");
			Email = (String) params.get("Email");
			
			if(filename[0] == null || filename[0].trim().equals("")) Image = imagee;
			else Image = "images/tainguyen/" + filename[0];
			
			if(filename[1] == null || filename[1].trim().equals("")) Image1 = imagee1;
			else Image1 = "images/tainguyen/" + filename[1];
			
			TaiNguyenBO tn = new TaiNguyenBO();
			if(tn.CapNhatTaiNguyen(SoTu, GiaVN, GiaJA, Image, Image1, ThongDiep, LienHe, DienThoai, Email, GioiThieu, NoiQuy)){
				request.setAttribute("mes", "<div class='alert alert-success tbmeg' role='alert'>Cập nhật thành công - 更新を成功する.</div>");
			}else{
				request.setAttribute("mes", "<div class='alert alert-danger tbmeg' role='alert'>Cập nhật không thành công - 更新を失敗する.</div>");
			}
			tn.closeConnection();
			request.getRequestDispatcher("TaiNguyenServlet").forward(request, response);
		}
	}
	}
}
