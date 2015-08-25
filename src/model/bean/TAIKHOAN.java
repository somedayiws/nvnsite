package model.bean;

public class TAIKHOAN {
	private String IdTaiKhoan;
	private String TenTaiKhoan;
	private String MatKhau;
	private String HoTen;
	private String DiaChi;
	private String DienThoai;
	private String Email;
	private String QuyenQuanTri;
	private String NgonNgu;
	private String TinhTrang;
	
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

}
