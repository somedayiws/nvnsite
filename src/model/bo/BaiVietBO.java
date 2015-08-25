package model.bo;

import java.util.ArrayList;

import model.bean.BAIVIET;
import model.dao.BaiVietDAO;

public class BaiVietBO {

	BaiVietDAO baiviet = new BaiVietDAO();
	/*
	 * Lấy bài viết có id tương ứng
	 * return BAIVIET
	 */
	public BAIVIET getBaiViet(String id) {
		return baiviet.getBaiViet(id);
	}
	/*
	 * Lấy danh sách top bài viết từ vị trí nào đó trở đi
	 * return ArrayList<BAIVIET>/null
	 */
	public ArrayList<BAIVIET> getDanhSachBaiViet(int n, String top) {
		return baiviet.getDanhSachBaiViet(n, top);
	}
	/*
	 * Lấy danh sách top bài viết từ vị trí nào đó trở đi tương ứng của danh mục id
	 * return ArrayList<BAIVIET>/null
	 */
	public ArrayList<BAIVIET> getDanhSachBaiViet(String id, String top) {
		// TODO Auto-generated method stub
		return baiviet.getListBaiViet(id, "0", top);
	}

	public void ThemBaiVietVi(String tieuDe, String moTa, String noiDung,
			String theLoai, String taiKhoan, String hinhAnh) {
		// TODO Auto-generated method stub
		baiviet.ThemBaiVietVi(tieuDe, moTa, noiDung, theLoai, taiKhoan, hinhAnh);
	}

	public void ThemBaiVietJa(String tieuDe, String moTa, String noiDung,
			String theLoai, String taiKhoan, String hinhAnh) {
		// TODO Auto-generated method stub
		baiviet.ThemBaiVietJa(tieuDe, moTa, noiDung, theLoai, taiKhoan, hinhAnh);
	}

	public ArrayList<BAIVIET> getTopBaiViet() {
		// TODO Auto-generated method stub
		return baiviet.getTopBaiViet();
	}
	public ArrayList<BAIVIET> getFind(String txtFind, String vitri, String top) {
		// TODO Auto-generated method stub
		return baiviet.getFind(txtFind, vitri, top);
	}

	public ArrayList<BAIVIET> getListPhanCong(String idTaiKhoan) {
		// TODO Auto-generated method stub
		return baiviet.getListPhanCong(idTaiKhoan);
	}

	public void CapNhatBaiViet(String id, String tieude, String mota,
			String noidung, String tinhtrang, String ngonNgu, String idTaiKhoan) {
		// TODO Auto-generated method stub
		baiviet.CapNhatBaiViet(id, tieude, mota, noidung, tinhtrang, ngonNgu, idTaiKhoan);
	}

	public void CapNhatBaiViet(String id, String tinhtrang, String idTaiKhoan) {
		// TODO Auto-generated method stub
		baiviet.CapNhatBaiViet(id, tinhtrang, idTaiKhoan);
	}

	public ArrayList<BAIVIET> getListPhanCong(String idTaiKhoan, String view) {
		// TODO Auto-generated method stub
		return baiviet.getListPhanCong(idTaiKhoan, view);
	}

	public void setBinhLuan(String id, String bluan) {
		// TODO Auto-generated method stub
		baiviet.setBinhLuan(id, bluan);
	}

	public String getCountAll(String taikhoan) {
		// TODO Auto-generated method stub
		return baiviet.getCount("all", taikhoan);
	}

	public String getCountMoi(String taikhoan) {
		// TODO Auto-generated method stub
		return baiviet.getCount("moi", taikhoan);
	}

	public String getCountDich(String taikhoan) {
		// TODO Auto-generated method stub
		return baiviet.getCount("dich", taikhoan);
	}

	public String getCountTre(String taikhoan) {
		// TODO Auto-generated method stub
		return baiviet.getCount("tre", taikhoan);
	}

	public String getInfo(String id, String idTaiKhoan) {
		// TODO Auto-generated method stub
		return baiviet.getInfo(id, idTaiKhoan);
	}

	public ArrayList<BAIVIET> getListBaiViet(String idTaiKhoan) {
		// TODO Auto-generated method stub
		return baiviet.getListBaiViet(idTaiKhoan);
	}

	public void ThemBaiViet(String tieuDeVi, String moTaVi, String noiDungVi,
			String tieuDeJa, String moTaJa, String noiDungJa, String theLoai,
			String taiKhoan, String hinhAnh) {
		// TODO Auto-generated method stub
		baiviet.ThemBaiViet(tieuDeVi, moTaVi, noiDungVi, tieuDeJa, moTaJa, noiDungJa, theLoai, taiKhoan, hinhAnh);
	}
}
