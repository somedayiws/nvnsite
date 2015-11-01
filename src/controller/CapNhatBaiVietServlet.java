package controller;

import java.awt.image.BufferedImage;
import java.awt.image.ColorConvertOp;
import java.io.File;
import java.io.IOException;
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

@WebServlet("/Cap-nhat-bai-viet")
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
		// List thông báo
		ThongBaoBO thongBaoBO = new ThongBaoBO();
		ArrayList<THONGBAO> listthongbao = thongBaoBO.getListHienThi("","1", "DienDan");
		request.setAttribute("listthongbao", listthongbao);
		// Danh sách quảng cáo
		QuangCaoBO quangCaoBO = new QuangCaoBO();
		ArrayList<QUANGCAO> listquangcao = quangCaoBO.getDanhSachQuangCao((int) 2);
		request.setAttribute("listquangcao", listquangcao);
		try {
			boolean isMultipart = ServletFileUpload
					.isMultipartContent(request);
			if (!isMultipart) {
				String id = request.getParameter("id");
				if(id!=null){
					DanhMucBO danhmuc = new DanhMucBO();
					BaiVietBO baiviet = new BaiVietBO();
					ArrayList<DANHMUC> listdanhmuc = danhmuc.getDanhSachDanhMuc("");
					ArrayList<BAIVIET> topmoi = baiviet.getTopBaiViet("Moi");
					BAIVIET bv = baiviet.getBaiViet(id);
					TaiNguyenBO tainguyenBO = new TaiNguyenBO();
					String sotu = tainguyenBO.getValue("SoTuDich");
					String giaVN = tainguyenBO.getValue("ThanhTienVN");
					String giaJA = tainguyenBO.getValue("ThanhTienJA");
					String banggiadich = tainguyenBO.getValue("BangGiaDich");
					request.setAttribute("sotu", sotu);
					request.setAttribute("giaVN", giaVN);
					request.setAttribute("giaJA", giaJA);
					request.setAttribute("banggiadich", banggiadich);
					request.setAttribute("baiviet", bv);
					request.setAttribute("listdanhmuc", listdanhmuc);
					request.setAttribute("topmoi", topmoi);
					
					String ThongDiep = tainguyenBO.getValue("ThongDiep");
					String LienHe = tainguyenBO.getValue("LienHe");
					String DienThoai = tainguyenBO.getValue("DienThoai");
					String Email = tainguyenBO.getValue("Email");
					
					request.setAttribute("ThongDiep", ThongDiep);
					request.setAttribute("LienHe", LienHe);
					request.setAttribute("DienThoai", DienThoai);
					request.setAttribute("Email", Email);
					
					baiviet.closeConnection();
					danhmuc.closeConnection();
					tainguyenBO.closeConnection();
					thongBaoBO.closeConnection();
					quangCaoBO.closeConnection();
					
					request.getRequestDispatcher("CapNhatBaiViet.jsp").forward(request, response);
				}else{
					response.sendRedirect("Trang-chu");
				}
			} else {
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				
				@SuppressWarnings("rawtypes")
				List items = null;
				
				String id = "";
				String ngonngu;
				String TieuDe, TieuDeVi, TieuDeJa;
				String MoTa, MoTaVi, MoTaJa;
				String TheLoai;
				String NoiDung, NoiDungVi, NoiDungJa;
				String DangBai, DichBai;
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
						id = (String) params.get("id");
					} else {
						try {
							String itemName = item.getName();
							filename = itemName.substring(itemName
									.lastIndexOf("\\") + 1);
							filename = id
									+ filename.substring(filename
											.indexOf("."));
							String realPath = getServletContext().getRealPath("/")+ "images/Thumbs/" + filename;
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
				id = (String) params.get("id");
				ngonngu = (String) params.get("NgonNgu");
				TheLoai = (String) params.get("TheLoai");
				linkan = (String) params.get("linkan");
				DangBai = (String) params.get("dangbai");
				DichBai = (String) params.get("dichbai");
				
				String ketqua = "";
				if(filename == null || filename.trim().equals(""))
					if(linkan.equals("") || linkan == null) HinhAnh = "images/baiviet.jpg";
					else HinhAnh = linkan;
				else HinhAnh = "images/Thumbs/"+filename;
				BaiVietBO baivietBO = new BaiVietBO();
				if(ngonngu.equals("0")){
					TieuDe = (String) params.get("TieuDe");
					MoTa = (String) params.get("MoTa");
					NoiDung = (String) params.get("NoiDung");
					
					if(DangBai != null){
						if(DichBai!=null && DichBai.equals("khong")) DichBai = "KhongDich";
						else if(DichBai.equals("dich")) DichBai = "MoiDang";
						else DichBai = "SoanThao";
						if(baivietBO.CapNhatBaiVietVi(id, TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan, HinhAnh, DichBai)) ketqua="capnhat-thanhcong";
						else ketqua="capnhat-thatbai";
					}
					else {
						if(baivietBO.CapNhatBaiVietVi(id, TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan, HinhAnh, "SoanThao")) ketqua="capnhat-thanhcong";
						else ketqua="capnhat-thatbai";
					}
					
				}else if(ngonngu.equals("1")){
					TieuDe = (String) params.get("TieuDe");
					MoTa = (String) params.get("MoTa");
					NoiDung = (String) params.get("NoiDung");
					
					if(DangBai != null) {
						if(DichBai!=null && DichBai.equals("khong")) DichBai = "KhongDich";
						else if(DichBai.equals("dich")) DichBai = "MoiDang";
						else DichBai = "SoanThao";
						if(baivietBO.CapNhatBaiVietJa(id, TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan,HinhAnh, DichBai)) ketqua="capnhat-thanhcong";
						else ketqua="capnhat-thatbai";
					}
					else {
						if(baivietBO.CapNhatBaiVietJa(id, TieuDe, MoTa, NoiDung, TheLoai, TaiKhoan,HinhAnh, "SoanThao")) ketqua="capnhat-thanhcong";
						else ketqua="capnhat-thatbai";
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
						if(baivietBO.CapNhatBaiViet(id, TieuDeVi, MoTaVi, NoiDungVi, TieuDeJa, MoTaJa, NoiDungJa, TheLoai, TaiKhoan, HinhAnh, DichBai)) ketqua="capnhat-thanhcong";
						else ketqua="capnhat-thatbai";
					}
					else {
						if(baivietBO.CapNhatBaiViet(id, TieuDeVi, MoTaVi, NoiDungVi, TieuDeJa, MoTaJa, NoiDungJa, TheLoai, TaiKhoan,HinhAnh, "SoanThao")) ketqua="capnhat-thanhcong";
						else ketqua="capnhat-thatbai";
					}
				}
				baivietBO.closeConnection();
				quangCaoBO.closeConnection();
				thongBaoBO.closeConnection();
				response.sendRedirect("Trang-ca-nhan?xuly=" + ketqua);
			}
		} catch (Exception e) {
			System.out.println("Throw exception upload file!");
			response.sendRedirect("Trang-chu");
		}
	}

}

