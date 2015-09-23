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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.FileCleanerCleanup;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.TAIKHOAN;
import model.bo.BaiVietBO;
import model.bo.DanhMucBO;
import model.bo.TaiNguyenBO;

@WebServlet("/DangBaiVietServlet")
public class DangBaiVietServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DangBaiVietServlet() {
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
		try {
			boolean isMultipart = ServletFileUpload
					.isMultipartContent(request);
			if (!isMultipart) {
				DanhMucBO danhmuc = new DanhMucBO();
				BaiVietBO baiviet = new BaiVietBO();
				ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc("");
				ArrayList<BAIVIET> topbaiviet = baiviet.getTopBaiViet("XemNhieu");
				ArrayList<BAIVIET> topmoi = baiviet.getTopBaiViet("Moi");
				request.setAttribute("listdanhmuc", listdanhmuc);
				request.setAttribute("topbaiviet", topbaiviet);
				request.setAttribute("topmoi", topmoi);
				TaiNguyenBO tainguyenBO = new TaiNguyenBO();
				String sotu = tainguyenBO.getValue("SoTuDich");
				String giaVN = tainguyenBO.getValue("ThanhTienVN");
				String giaJA = tainguyenBO.getValue("ThanhTienJA");
				String banggiadich = tainguyenBO.getValue("BangGiaDich");
				request.setAttribute("sotu", sotu);
				request.setAttribute("giaVN", giaVN);
				request.setAttribute("giaJA", giaJA);
				request.setAttribute("banggiadich", banggiadich);
				request.getRequestDispatcher("DangBaiViet.jsp").forward(request, response);
			} else {
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				
				@SuppressWarnings("rawtypes")
				List items = null;

				String ngonngu;
				String TieuDe, TieuDeVi, TieuDeJa;
				String MoTa, MoTaVi, MoTaJa;
				String TheLoai;
				String NoiDung, NoiDungVi, NoiDungJa;
				String HinhAnh;
				String DangBai, DichBai;
				String ketqua = "";
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

				ngonngu = (String) params.get("NgonNgu");
				TheLoai = (String) params.get("TheLoai");
				DangBai = (String) params.get("dangbai");
				DichBai = (String) params.get("dichbai");
				if(filename == null || filename.trim().equals("")) HinhAnh = "baiviet.jpg";
				else HinhAnh = filename;
				BaiVietBO baivietBO = new BaiVietBO();
				if(ngonngu.equals("0")){
					TieuDe = (String) params.get("TieuDe");
					MoTa = (String) params.get("MoTa");
					NoiDung = (String) params.get("NoiDung");
					if(DangBai != null) {
						if(DichBai!=null && DichBai.equals("khong")) DichBai = "KhongDich";
						else DichBai = "MoiDang";
						if(baivietBO.ThemBaiVietVi(TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan, "images/" + HinhAnh, DichBai)) ketqua = "them-thanhcong";
						else ketqua = "them-thatbai";
					}
					else {
						if(baivietBO.ThemBaiVietVi(TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan, "images/" + HinhAnh, "SoanThao")) ketqua = "them-thanhcong";
						else ketqua = "them-thatbai";
					}
				}else if(ngonngu.equals("1")){
					TieuDe = (String) params.get("TieuDe");
					MoTa = (String) params.get("MoTa");
					NoiDung = (String) params.get("NoiDung");
					if(DangBai != null) {
						if(DichBai!=null && DichBai.equals("khong")) DichBai = "KhongDich";
						else DichBai = "MoiDang";
						if(baivietBO.ThemBaiVietJa(TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan, "images/" + HinhAnh, DichBai)) ketqua = "them-thanhcong";
						else ketqua = "them-thatbai";
					}
					else {
						if(baivietBO.ThemBaiVietJa(TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan, "images/" + HinhAnh, "SoanThao")) ketqua = "them-thanhcong";
						else ketqua = "them-thatbai";
					}
				}else{
					TieuDeVi = (String) params.get("TieuDeVi");
					TieuDeJa = (String) params.get("TieuDeJa");
					
					MoTaVi = (String) params.get("MoTaVi");
					MoTaJa = (String) params.get("MoTaJa");
					
					NoiDungVi = (String) params.get("NoiDungVi");
					NoiDungJa = (String) params.get("NoiDungJa");
					
					if(DangBai != null) {
						if(DichBai!=null && DichBai.equals("khong")) DichBai = "KhongDich";
						else DichBai = "MoiDang";
						if(baivietBO.ThemBaiViet(TieuDeVi, MoTaVi, NoiDungVi, TieuDeJa, MoTaJa, NoiDungJa, TheLoai, TaiKhoan, "images/" + HinhAnh, DichBai)) ketqua = "them-thanhcong";
						else ketqua = "them-thatbai";
					}
					else baivietBO.ThemBaiViet(TieuDeVi, MoTaVi, NoiDungVi, TieuDeJa, MoTaJa, NoiDungJa, TheLoai, TaiKhoan, "images/" + HinhAnh, "SoanThao");
				}
				response.sendRedirect("TrangCaNhanServlet?xuly=" + ketqua);
			}
		} catch (Exception e) {
			System.out.println("Throw exception upload file!");
			response.sendRedirect("TrangCaNhanServlet?xuly=loi-he-thong");
		}
	}

}
