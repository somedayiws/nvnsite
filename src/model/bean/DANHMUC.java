package model.bean;

import java.util.ArrayList;

public class DANHMUC {
	String IdDanhMuc;
	String TenDanhMucVi;
	String TenDanhMucJa;
	ArrayList<BAIVIET> BaiViets;
	int SoLuongBV = 0;
	int HienThi;
	String icon;
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public DANHMUC(String idDanhMuc, String tenDanhMucVi, String tenDanhMucJa,
			int hienThi) {
		super();
		IdDanhMuc = idDanhMuc;
		TenDanhMucVi = tenDanhMucVi;
		TenDanhMucJa = tenDanhMucJa;
		HienThi = hienThi;
	}
	public DANHMUC() {
		super();
	}
	public String getIdDanhMuc() {
		return IdDanhMuc;
	}
	public void setIdDanhMuc(String idDanhMuc) {
		IdDanhMuc = idDanhMuc;
	}
	public String getTenDanhMucVi() {
		return TenDanhMucVi;
	}
	public void setTenDanhMucVi(String tenDanhMucVi) {
		TenDanhMucVi = tenDanhMucVi;
	}
	public String getTenDanhMucJa() {
		return TenDanhMucJa;
	}
	public void setTenDanhMucJa(String tenDanhMucJa) {
		TenDanhMucJa = tenDanhMucJa;
	}
	public ArrayList<BAIVIET> getBaiViets() {
		return BaiViets;
	}
	public void setBaiViets(ArrayList<BAIVIET> baiViets) {
		BaiViets = baiViets;
	}
	public int getHienThi() {
		return HienThi;
	}
	public void setHienThi(int hienThi) {
		HienThi = hienThi;
	}
	public int getSoLuongBV() {
		return SoLuongBV;
	}
	public void setSoLuongBV(int sl) {
		SoLuongBV = sl;
	}
}
