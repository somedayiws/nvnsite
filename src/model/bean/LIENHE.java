package model.bean;

public class LIENHE {
	private String IdLienHe;
	private String TaiKhoan;
	private String HoTen;
	private String SoDienThoai;
	private String Email;
	private String TieuDe;
	private String NoiDung;
	private String NgayGui;
	private int DaDoc;

	public String getIdLienHe() {
		return IdLienHe;
	}

	public void setIdLienHe(String idLienHe) {
		IdLienHe = idLienHe;
	}

	public String getTaiKhoan() {
		return TaiKhoan;
	}

	public void setTaiKhoan(String taiKhoan) {
		TaiKhoan = taiKhoan;
	}

	public String getHoTen() {
		return HoTen;
	}

	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}

	public String getSoDienThoai() {
		return SoDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		SoDienThoai = soDienThoai;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getTieuDe() {
		return TieuDe;
	}

	public void setTieuDe(String tieuDe) {
		TieuDe = tieuDe;
	}

	public String getNoiDung() {
		return NoiDung;
	}

	public void setNoiDung(String noiDung) {
		NoiDung = noiDung;
	}

	public String getNgayGui() {
		return NgayGui;
	}

	public void setNgayGui(String ngayGui) {
		NgayGui = ngayGui;
	}

	public int getDaDoc() {
		return DaDoc;
	}

	public void setDaDoc(int daDoc) {
		DaDoc = daDoc;
	}

	public LIENHE() {
		super();
	}

	public LIENHE(String idLienHe, String taiKhoan, String hoTen,
			String soDienThoai, String email, String tieuDe, String noiDung,
			String ngayGui, int daDoc) {
		super();
		IdLienHe = idLienHe;
		TaiKhoan = taiKhoan;
		HoTen = hoTen;
		SoDienThoai = soDienThoai;
		Email = email;
		TieuDe = tieuDe;
		NoiDung = noiDung;
		NgayGui = ngayGui;
		DaDoc = daDoc;
	}

}
