package model.bean;

import com.google.gson.annotations.SerializedName;

public class TAIKHOAN {
	private String IdTaiKhoan;
	private String TenTaiKhoan;
	private String MatKhau;
	@SerializedName(value="name")
	private String HoTen;
	private String DiaChi;
	private String DienThoai;
	@SerializedName(value="email")
	private String Email;
	private String QuyenQuanTri;
	private String NgonNgu;
	private String TinhTrang;
	@SerializedName(value="id")
	private String FacebookID;
	private String FacebookLink;
	private String GoogleID;
	private String picture;
	
	public String getGoogleID() {
		return GoogleID;
	}

	public void setGoogleID(String googleID) {
		GoogleID = googleID;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getFacebookID() {
		return FacebookID;
	}

	public void setFacebookID(String facebookID) {
		FacebookID = facebookID;
	}

	public String getFacebookLink() {
		return FacebookLink;
	}

	public void setFacebookLink(String facebookLink) {
		FacebookLink = facebookLink;
	}

	public String getTinhTrang() {
		return TinhTrang;
	}

	public void setTinhTrang(String tinhTrang) {
		TinhTrang = tinhTrang;
	}

	public String getQuyenQuanTri() {
		return QuyenQuanTri;
	}

	public void setQuyenQuanTri(String quyenQuanTri) {
		QuyenQuanTri = quyenQuanTri;
	}
	public String getNgonNgu() {
		return NgonNgu;
	}

	public void setNgonNgu(String ngonNgu) {
		NgonNgu = ngonNgu;
	}
	public TAIKHOAN() {
		super();
	}

	public TAIKHOAN(String idTaiKhoan, String tenTaiKhoan, String matKhau, String hoTen,
			String diaChi, String dienThoai, String email, String quyenQuanTri) {
		super();
		IdTaiKhoan = idTaiKhoan;
		TenTaiKhoan = tenTaiKhoan;
		MatKhau = matKhau;
		HoTen = hoTen;
		DiaChi = diaChi;
		DienThoai = dienThoai;
		Email = email;
		QuyenQuanTri = quyenQuanTri;
	}

	public String getIdTaiKhoan() {
		return IdTaiKhoan;
	}

	public void setIdTaiKhoan(String idTaiKhoan) {
		IdTaiKhoan = idTaiKhoan;
	}

	public String getTenTaiKhoan() {
		return TenTaiKhoan;
	}

	public void setTenTaiKhoan(String tenTaiKhoan) {
		TenTaiKhoan = tenTaiKhoan;
	}

	public String getMatKhau() {
		return MatKhau;
	}

	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}

	public String getHoTen() {
		return HoTen;
	}

	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}

	public String getDiaChi() {
		return DiaChi;
	}

	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}

	public String getDienThoai() {
		return DienThoai;
	}

	public void setDienThoai(String dienThoai) {
		DienThoai = dienThoai;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	@Override
	public String toString() {
		return "TAIKHOAN [IdTaiKhoan=" + IdTaiKhoan + ", TenTaiKhoan="
				+ TenTaiKhoan + ", MatKhau=" + MatKhau + ", HoTen=" + HoTen
				+ ", DiaChi=" + DiaChi + ", DienThoai=" + DienThoai
				+ ", Email=" + Email + ", QuyenQuanTri=" + QuyenQuanTri
				+ ", NgonNgu=" + NgonNgu + ", TinhTrang=" + TinhTrang
				+ ", FacebookID=" + FacebookID + ", GoogleID=" + GoogleID
				+ ", picture=" + picture + ", FacebookLink=" + FacebookLink
				+ "]";
	}
}
