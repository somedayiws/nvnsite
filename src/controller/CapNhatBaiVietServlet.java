package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.TAIKHOAN;
import model.bo.BaiVietBO;
import model.bo.DanhMucBO;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.FileCleanerCleanup;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/CapNhatBaiVietServlet")
public class CapNhatBaiVietServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CapNhatBaiVietServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		try {
			boolean isMultipart = ServletFileUpload
					.isMultipartContent(request);
			if (!isMultipart) {
				String id = request.getParameter("id");
				if(id!=null){
					DanhMucBO danhmuc = new DanhMucBO();
					BaiVietBO baiviet = new BaiVietBO();
					ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc("");
					ArrayList<BAIVIET> topbaiviet = baiviet.getTopBaiViet();
					BAIVIET bv = baiviet.getBaiViet(id);
					request.setAttribute("baiviet", bv);
					request.setAttribute("listdanhmuc", listdanhmuc);
					request.setAttribute("topbaiviet", topbaiviet);
					request.getRequestDispatcher("CapNhatBaiViet.jsp").forward(request, response);
				}else{
					response.sendRedirect("TrangChuServlet");
				}
			} else {
				System.out.println("Làm đây 2");
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				
				@SuppressWarnings("rawtypes")
				List items = null;
				
				String id;
				String ngonngu;
				String TieuDe, TieuDeVi, TieuDeJa;
				String MoTa, MoTaVi, MoTaJa;
				String TheLoai;
				String NoiDung, NoiDungVi, NoiDungJa;
				String DangBai;
				@SuppressWarnings("unused")
				String HinhAnh, linkan;
				String TaiKhoan = ((TAIKHOAN)request.getSession().getAttribute("user")).getIdTaiKhoan();
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
						System.out.println("Du lieu: " + item.getString()
								+ "       " + item.getFieldName());
					} else {
						try {
							String itemName = item.getName();
							filename = itemName.substring(itemName
									.lastIndexOf("\\") + 1);
							String realPath = getServletContext().getRealPath("/")+ "images/" + filename;
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
				id = (String) params.get("id");
				ngonngu = (String) params.get("NgonNgu");
				TheLoai = (String) params.get("TheLoai");
				linkan = (String) params.get("linkan");
				DangBai = (String) params.get("DangBai");
				String ketqua = "";
				if(filename == null || filename.trim().equals("")) HinhAnh = "baiviet.jpg";
				else HinhAnh = filename;
				BaiVietBO baivietBO = new BaiVietBO();
				if(ngonngu.equals("0")){
					TieuDe = (String) params.get("TieuDe");
					MoTa = (String) params.get("MoTa");
					NoiDung = (String) params.get("NoiDung");
					
//					baivietBO.CapNhatBaiVietVi(id, TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan, "images/" + HinhAnh);
					
					if(DangBai != null){
						if(baivietBO.CapNhatBaiVietVi(id, TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan, "images/" + HinhAnh, "MoiDang")) ketqua="capnhat-thanhcong";
						else ketqua="capnhat-thatbai";
					}
					else {
						if(baivietBO.CapNhatBaiVietVi(id, TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan, "images/" + HinhAnh, "SoanThao")) ketqua="capnhat-thanhcong";
						else ketqua="capnhat-thatbai";
					}
					
				}else if(ngonngu.equals("1")){
					TieuDe = (String) params.get("TieuDe");
					MoTa = (String) params.get("MoTa");
					NoiDung = (String) params.get("NoiDung");
//					baivietBO.CapNhatBaiVietJa(id, TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan, "images/" + HinhAnh);
					if(DangBai != null) {
						if(baivietBO.CapNhatBaiVietJa(id, TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan, "images/" + HinhAnh, "MoiDang")) ketqua="capnhat-thanhcong";
						else ketqua="capnhat-thatbai";
					}
					else {
						if(baivietBO.CapNhatBaiVietJa(id, TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan, "images/" + HinhAnh, "SoanThao")) ketqua="capnhat-thanhcong";
						else ketqua="capnhat-thatbai";
					}
				}else{
					TieuDeVi = (String) params.get("TieuDeVi");
					TieuDeJa = (String) params.get("TieuDeJa");
					
					MoTaVi = (String) params.get("MoTaVi");
					MoTaJa = (String) params.get("MoTaJa");
					
					NoiDungVi = (String) params.get("NoiDungVi");
					NoiDungJa = (String) params.get("NoiDungJa");
					
//					baivietBO.CapNhatBaiViet(id, TieuDeVi, MoTaVi, NoiDungVi, TieuDeJa, MoTaJa, NoiDungJa, TheLoai, TaiKhoan, "images/" + HinhAnh);
					
					if(DangBai != null) {
						if(baivietBO.CapNhatBaiViet(id, TieuDeVi, MoTaVi, NoiDungVi, TieuDeJa, MoTaJa, NoiDungJa, TheLoai, TaiKhoan, "images/" + HinhAnh, "MoiDang")) ketqua="capnhat-thanhcong";
						else ketqua="capnhat-thatbai";
					}
					else {
						if(baivietBO.CapNhatBaiViet(id, TieuDeVi, MoTaVi, NoiDungVi, TieuDeJa, MoTaJa, NoiDungJa, TheLoai, TaiKhoan, "images/" + HinhAnh, "SoanThao")) ketqua="capnhat-thanhcong";
						else ketqua="capnhat-thatbai";
					}
				}
				response.sendRedirect("TrangCaNhanServlet?xuly=" + ketqua);
			}
		} catch (Exception e) {
			System.out.println("Throw exception upload file!");
		}
	}

}

