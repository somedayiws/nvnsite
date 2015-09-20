package model.bean;

import java.util.ArrayList;

public class BAIVIET {
	String IdBaiViet;
	String TenBaiVietVi;
	String TenBaiVietJa;
	String MoTaVi;
	String MoTaJa;
	DANHMUC DanhMuc;
	TAIKHOAN TaiKhoan;
	ArrayList<BINHLUAN> BinhLuanVi;
	ArrayList<BINHLUAN> BinhLuanJa;
	String NoiDungVi;
	String NoiDungJa;
	String TrangThai;
	String GhiChu;
	int LuotXem;
	String LienKet;
	String NgayDang;
	int GimTrangChu;
	public int getGimTrangChu() {
		return GimTrangChu;
	}
	public void setGimTrangChu(int gimTrangChu) {
		GimTrangChu = gimTrangChu;
	}
	public int getLuotXem() {
		return LuotXem;
	}
	public void setLuotXem(int luotXem) {
		LuotXem = luotXem;
	}
	public String getLienKet() {
		return LienKet;
	}
	public void setLienKet(String lienKet) {
		LienKet = lienKet;
	}
	
	public String getNgayDang() {
		return NgayDang;
	}
	public void setNgayDang(String ngayDang) {
		NgayDang = ngayDang;
	}
	public BAIVIET() {
		super();
	}
	public BAIVIET(String idBaiViet, String tenBaiVietVi, String tenBaiVietJa,
			DANHMUC danhMuc, TAIKHOAN taiKhoan, String noiDungVi,
			String noiDungJa, String trangThai, String ghiChu) {
		IdBaiViet = idBaiViet;
		TenBaiVietVi = tenBaiVietVi;
		TenBaiVietJa = tenBaiVietJa;
		DanhMuc = danhMuc;
		TaiKhoan = taiKhoan;
		NoiDungVi = noiDungVi;
		NoiDungJa = noiDungJa;
		TrangThai = trangThai;
		GhiChu = ghiChu;
	}
	
	public ArrayList<BINHLUAN> getBinhLuanVi() {
		return BinhLuanVi;
	}
	public void setBinhLuanVi(ArrayList<BINHLUAN> binhLuans) {
		BinhLuanVi = binhLuans;
	}
	public ArrayList<BINHLUAN> getBinhLuanJa() {
		return BinhLuanJa;
	}
	public void setBinhLuanJa(ArrayList<BINHLUAN> binhLuans) {
		BinhLuanJa = binhLuans;
	}
	public String getIdBaiViet() {
		return IdBaiViet;
	}
	public void setIdBaiViet(String idBaiViet) {
		IdBaiViet = idBaiViet;
	}
	public String getTenBaiVietVi() {
		return TenBaiVietVi;
	}
	public void setTenBaiVietVi(String tenBaiVietVi) {
		TenBaiVietVi = tenBaiVietVi;
	}
	public String getMoTaVi() {
		return MoTaVi;
	}
	public void setMoTaVi(String moTaVi) {
		MoTaVi = moTaVi;
	}
	public String getMoTaJa() {
		return MoTaJa;
	}
	public void setMoTaJa(String moTaJa) {
		MoTaJa = moTaJa;
	}
	public String getTenBaiVietJa() {
		return TenBaiVietJa;
	}
	public void setTenBaiVietJa(String tenBaiVietJa) {
		TenBaiVietJa = tenBaiVietJa;
	}
	public DANHMUC getDanhMuc() {
		return DanhMuc;
	}
	public void setDanhMuc(DANHMUC danhMuc) {
		DanhMuc = danhMuc;
	}
	public TAIKHOAN getTaiKhoan() {
		return TaiKhoan;
	}
	public void setTaiKhoan(TAIKHOAN taiKhoan) {
		TaiKhoan = taiKhoan;
	}
	public String getNoiDungVi() {
		return NoiDungVi;
	}
	public void setNoiDungVi(String noiDungVi) {
		NoiDungVi = noiDungVi;
	}
	public String getNoiDungJa() {
		return NoiDungJa;
	}
	public void setNoiDungJa(String noiDungJa) {
		NoiDungJa = noiDungJa;
	}
	public String getTrangThai() {
		return TrangThai;
	}
	public void setTrangThai(String trangThai) {
		TrangThai = trangThai;
	}
	public String getGhiChu() {
		return GhiChu;
	}
	public void setGhiChu(String ghiChu) {
		GhiChu = ghiChu;
	}
}
