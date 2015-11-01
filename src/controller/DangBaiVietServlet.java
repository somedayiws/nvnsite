package controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.QUANGCAO;
import model.bean.TAIKHOAN;
import model.bean.THONGBAO;
import model.bo.BaiVietBO;
import model.bo.DanhMucBO;
import model.bo.QuangCaoBO;
import model.bo.TaiNguyenBO;
import model.bo.ThongBaoBO;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.FileCleanerCleanup;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.imgscalr.Scalr;

@WebServlet("/Dang-bai-viet")
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
				ArrayList<BAIVIET> topmoi = baiviet.getTopBaiViet("Moi");
				request.setAttribute("listdanhmuc", listdanhmuc);
				request.setAttribute("topmoi", topmoi);
				
				// List thông báo
				ThongBaoBO thongBaoBO = new ThongBaoBO();
				ArrayList<THONGBAO> listthongbao = thongBaoBO.getListHienThi("","1", "DienDan");
				request.setAttribute("listthongbao", listthongbao);

				// Danh sách quảng cáo
				QuangCaoBO quangCaoBO = new QuangCaoBO();
				ArrayList<QUANGCAO> listquangcao = quangCaoBO.getDanhSachQuangCao((int) 2);
				request.setAttribute("listquangcao", listquangcao);
				
				TaiNguyenBO tainguyenBO = new TaiNguyenBO();
				String sotu = tainguyenBO.getValue("SoTuDich");
				String giaVN = tainguyenBO.getValue("ThanhTienVN");
				String giaJA = tainguyenBO.getValue("ThanhTienJA");
				String banggiadich = tainguyenBO.getValue("BangGiaDich");
				request.setAttribute("sotu", sotu);
				request.setAttribute("giaVN", giaVN);
				request.setAttribute("giaJA", giaJA);
				request.setAttribute("banggiadich", banggiadich);
				
				String ThongDiep = tainguyenBO.getValue("ThongDiep");
				String LienHe = tainguyenBO.getValue("LienHe");
				String DienThoai = tainguyenBO.getValue("DienThoai");
				String Email = tainguyenBO.getValue("Email");
				
				request.setAttribute("ThongDiep", ThongDiep);
				request.setAttribute("LienHe", LienHe);
				request.setAttribute("DienThoai", DienThoai);
				request.setAttribute("Email", Email);
				
				danhmuc.closeConnection();
				baiviet.closeConnection();
				thongBaoBO.closeConnection();
				quangCaoBO.closeConnection();
				tainguyenBO.closeConnection();
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
				BaiVietBO baivietBO = new BaiVietBO();
				while (iter.hasNext()) {

					FileItem item = (FileItem) iter.next();
					if (item.isFormField()) {
						params.put(item.getFieldName(),item.getString("UTF-8"));
					} else {
						try {
							String itemName = item.getName();
							filename = itemName.substring(itemName
									.lastIndexOf("\\") + 1);
							String id = baivietBO.getID();
							filename = id
									+ filename.substring(filename
											.indexOf("."));
							String realPath = getServletContext().getRealPath("/")+ "images/Thumbs/" + filename;
							System.out.println(realPath);
							File savedFile = new File(realPath);
							@SuppressWarnings("unused")
							FileCleanerCleanup item2 = new FileCleanerCleanup();
							// Upload file l�n server
//							item.write(savedFile);
							BufferedImage img = ImageIO.read(item.getInputStream());
							BufferedImage scaledImg = Scalr.resize(img, 800);
							ImageIO.write(scaledImg, filename.substring(filename
									.indexOf(".")+1), savedFile);
							System.out.println("file extension : "+filename.substring(filename
									.indexOf(".")+1));
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
				if(ngonngu.equals("0")){
					TieuDe = (String) params.get("TieuDe");
					MoTa = (String) params.get("MoTa");
					NoiDung = (String) params.get("NoiDung");
					if(DangBai != null) {
						if(DichBai!=null && DichBai.equals("khong")) DichBai = "KhongDich";
						else if(DichBai.equals("dich")) DichBai = "MoiDang";
						else DichBai = "SoanThao";
						if(baivietBO.ThemBaiVietVi(TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan, "images/Thumbs/" + HinhAnh, DichBai)) ketqua = "them-thanhcong";
						else ketqua = "them-thatbai";
					}
					else {
						if(baivietBO.ThemBaiVietVi(TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan, "images/Thumbs/" + HinhAnh, "SoanThao")) ketqua = "them-thanhcong";
						else ketqua = "them-thatbai";
					}
				}else if(ngonngu.equals("1")){
					TieuDe = (String) params.get("TieuDe");
					MoTa = (String) params.get("MoTa");
					NoiDung = (String) params.get("NoiDung");
					if(DangBai != null) {
						if(DichBai!=null && DichBai.equals("khong")) DichBai = "KhongDich";
						else if(DichBai.equals("dich")) DichBai = "MoiDang";
						else DichBai = "SoanThao";
						if(baivietBO.ThemBaiVietJa(TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan, "images/Thumbs/" + HinhAnh, DichBai)) ketqua = "them-thanhcong";
						else ketqua = "them-thatbai";
					}
					else {
						if(baivietBO.ThemBaiVietJa(TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan, "images/Thumbs/" + HinhAnh, "SoanThao")) ketqua = "them-thanhcong";
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
						else if(DichBai.equals("dich")) DichBai = "MoiDang";
						else DichBai = "SoanThao";
						if(baivietBO.ThemBaiViet(TieuDeVi, MoTaVi, NoiDungVi, TieuDeJa, MoTaJa, NoiDungJa, TheLoai, TaiKhoan, "images/Thumbs/" + HinhAnh, DichBai)) ketqua = "them-thanhcong";
						else ketqua = "them-thatbai";
					}
					else baivietBO.ThemBaiViet(TieuDeVi, MoTaVi, NoiDungVi, TieuDeJa, MoTaJa, NoiDungJa, TheLoai, TaiKhoan, "images/Thumbs/" + HinhAnh, "SoanThao");
				}
				baivietBO.closeConnection();
				response.sendRedirect("Trang-ca-nhan?xuly=" + ketqua);
			}
		} catch (Exception e) {
			System.out.println("Throw exception upload file!");
			response.sendRedirect("Trang-ca-nhan?xuly=loi-he-thong");
		}
	}

}
