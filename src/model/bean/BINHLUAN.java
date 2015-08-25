package model.bean;

public class BINHLUAN {
	int IdComent;
	BAIVIET BaiViet;
	TAIKHOAN TaiKhoan;
	String PhanHoiVi;
	String PhanHoiJa;
	public int getIdComent() {
		return IdComent;
	}
	public void setIdComent(int idComent) {
		IdComent = idComent;
	}
	public BAIVIET getBaiViet() {
		return BaiViet;
	}
	public void setBaiViet(BAIVIET baiViet) {
		BaiViet = baiViet;
	}
	public TAIKHOAN getTaiKhoan() {
		return TaiKhoan;
	}
	public void setTaiKhoan(TAIKHOAN taiKhoan) {
		TaiKhoan = taiKhoan;
	}
	public String getPhanHoiVi() {
		return PhanHoiVi;
	}
	public void setPhanHoiVi(String phanHoiVi) {
		PhanHoiVi = phanHoiVi;
	}
	public String getPhanHoiJa() {
		return PhanHoiJa;
	}
	public void setPhanHoiJa(String phanHoiJa) {
		PhanHoiJa = phanHoiJa;
	}
}
