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
	public ArrayList<BAIVIET> getDanhSachBaiViet(String id,int vtri, String top) {
		// TODO Auto-generated method stub
		return baiviet.getListBaiViet(id, vtri + "", top);
	}
	/*
	 * Thêm bài viết bằng tiếng việt
	 * return true/false
	 */
	public boolean ThemBaiVietVi(String tieuDe, String moTa, String noiDung,
			String theLoai, String taiKhoan, String hinhAnh, String trangThai) {
		// TODO Auto-generated method stub
		if(tieuDe==null || "".equals(tieuDe)) return false;
		if(moTa==null || "".equals(moTa)) return false;
		if(noiDung==null || "".equals(noiDung)) return false;
		
		return baiviet.ThemBaiVietVi(tieuDe, moTa, noiDung, theLoai, taiKhoan, hinhAnh, trangThai);
	}
	/*
	 * Thêm bài viết bằng tiếng nhat
	 * return true/false
	 */
	public boolean ThemBaiVietJa(String tieuDe, String moTa, String noiDung,
			String theLoai, String taiKhoan, String hinhAnh, String trangThai) {
		// TODO Auto-generated method stub
		if(tieuDe==null || "".equals(tieuDe)) return false;
		if(moTa==null || "".equals(moTa)) return false;
		if(noiDung==null || "".equals(noiDung)) return false;
		
		return baiviet.ThemBaiVietJa(tieuDe, moTa, noiDung, theLoai, taiKhoan, hinhAnh, trangThai);
	}
	/*
	 * Dùng cho trang client
	 * Lấy danh sách 10 bài viết có lược view lớn nhất
	 * return ArrayList<BAIVIET> or null
	 */
	public ArrayList<BAIVIET> getTopBaiViet(String loai) {
		// TODO Auto-generated method stub
		return baiviet.getTopBaiViet(loai);
	}
	/*
	 * Dùng cho trang client
	 * Lấy danh sách các bài viết phù hợp với nội dung tìm kiếm
	 * return ArrayList<BAIVIET> or null
	 */
	public ArrayList<BAIVIET> getFind(String txtFind, String vitri, String top) {
		// TODO Auto-generated method stub
		return baiviet.getFind(txtFind, vitri, top);
	}
	public ArrayList<BAIVIET> getFind(String kieu, String txtFind, String vitri, String top) {
		// TODO Auto-generated method stub
		return baiviet.getFind(kieu, txtFind, vitri, top);
	}
	/*
	 * Dùng cho trang cộng tác viên
	 * Lấy danh sách bài viết tương ứng với tài khoản được phân công
	 * return ArrayList<BAIVIET> or null
	 */
	public ArrayList<BAIVIET> getListPhanCong(String idTaiKhoan, int page) {
		// TODO Auto-generated method stub
		return baiviet.getListPhanCong(idTaiKhoan, page);
	}
	/*
	 * Dùng cho trang cộng tác viên, admin
	 * Cập nhật trạng thái bài dịch(ChuyenDich, DangDich, DaDich, Ok, HuyDich, LoiDich, DangBai, MoiPost)
	 * return bool(kết quả cập nhật)
	 */
	public boolean CapNhatBaiViet(String id, String tieude, String mota,
			String noidung, String tinhtrang, String ngonNgu, String idTaiKhoan) {
		// TODO Auto-generated method stub
		return baiviet.CapNhatBaiViet(id, tieude, mota, noidung, tinhtrang, ngonNgu, idTaiKhoan);
	}
	/*
	 * Dùng cho trang cộng tác viên, admin
	 * Cập nhật trạng thái bài dịch(ChuyenDich, DangDich, DaDich, Ok, HuyDich, LoiDich, DangBai, MoiPost)
	 * return bool(kết quả cập nhật)
	 */
	public boolean CapNhatBaiViet(String id, String tinhtrang, String idTaiKhoan) {
		// TODO Auto-generated method stub
		return baiviet.CapNhatBaiViet(id, tinhtrang, idTaiKhoan);
	}
	/*
	 * Dùng cho trang cộng tác viên
	 * Lấy danh sách bài dịch được phân công cho cộng tác viên x, với tùy chọn(Bài quá hạn, mới, đang dịch)
	 * return ArrayList<BAIVIET>
	 */
	public ArrayList<BAIVIET> getListPhanCong(String idTaiKhoan, String view, int page) {
		// TODO Auto-generated method stub
		return baiviet.getListPhanCong(idTaiKhoan, view, page);
	}
	/*
	 * Dùng cho trang cộng tác viên, admin
	 * Cập nhật bình luận bài viết qua lại giữa ctv và admin
	 * return bool(true(Thành công)/false(Thất bại))
	 */
	public void setBinhLuan(String id, String bluan) {
		// TODO Auto-generated method stub
		baiviet.setBinhLuan(id, bluan);
	}
	/*
	 * Dùng cho trang cộng tác viên
	 * Đếm số lượng bài viết có trong danh sách đươc chọn(Tất cả, Mới chuyển, Dịch Bài, Quá hạn)
	 * return String = count(list)
	 */
	public String getCountAll(String taikhoan) {
		// TODO Auto-generated method stub
		return baiviet.getCount("all", taikhoan);
	}
	/*
	 * Dùng cho trang cộng tác viên
	 * Lấy thông tin bài viết có Id và được dịch bởi ctv có id = idTaiKhoan
	 * return String = "Trạng thái bài dịch hiện tại, Ngày gửi bài đó tới cho cộng tác viên dịch"
	 */
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
	/*
	 * Dùng cho trang client
	 * Lấy danh sách bài viết của 1 user (Đã đăng, Đang duyệt, Bị hủy)
	 * return ArrayList<BAIVIET>
	 */
	public ArrayList<BAIVIET> getListBaiViet(String idTaiKhoan, int page) {
		// TODO Auto-generated method stub
		return baiviet.getListBaiViet(idTaiKhoan, page);
	}
	/*
	 * Thêm bài viết song ngữ mới
	 * return true/false
	 */
	public boolean ThemBaiViet(String tieuDeVi, String moTaVi, String noiDungVi,
			String tieuDeJa, String moTaJa, String noiDungJa, String theLoai,
			String taiKhoan, String hinhAnh, String trangThai) {
		// TODO Auto-generated method stub
		if(tieuDeVi==null || "".equals(tieuDeVi)) return false;
		if(moTaVi==null || "".equals(moTaVi)) return false;
		if(noiDungVi==null || "".equals(noiDungVi)) return false;
		
		if(tieuDeJa==null || "".equals(tieuDeJa)) return false;
		if(moTaJa==null || "".equals(moTaJa)) return false;
		if(noiDungJa==null || "".equals(noiDungJa)) return false;
		
		return baiviet.ThemBaiViet(tieuDeVi, moTaVi, noiDungVi, tieuDeJa, moTaJa, noiDungJa, theLoai, taiKhoan, hinhAnh, trangThai);
	}
	
	public String getTongTrang() {
		// TODO Auto-generated method stub
		return baiviet.getTongTrang();
	}
	
	public String getMenuPhanTrang(){
		return baiviet.getMenuPhanTrang();
	}
	
	public void setMenu(int nBangghi, int ntrang){
		baiviet.setMenu(nBangghi, ntrang);
	}
	public boolean CapNhatBaiVietVi(String id, String tieuDe, String moTa, String noiDung,
			String theLoai, String taiKhoan, String hinh, String tinhTrang) {
		// TODO Auto-generated method stub
		if(tieuDe==null || "".equals(tieuDe)) return false;
		if(moTa==null || "".equals(moTa)) return false;
		if(noiDung==null || "".equals(noiDung)) return false;
		
		return baiviet.CapNhatBaiViet(id, tieuDe, moTa, noiDung, theLoai, hinh, "vi", taiKhoan, tinhTrang);
	}
	public boolean CapNhatBaiVietJa(String id, String tieuDe, String moTa, String noiDung,
			String theLoai, String taiKhoan, String hinh, String tinhTrang) {
		// TODO Auto-generated method stub
		if(tieuDe==null || "".equals(tieuDe)) return false;
		if(moTa==null || "".equals(moTa)) return false;
		if(noiDung==null || "".equals(noiDung)) return false;
		
		return baiviet.CapNhatBaiViet(id, tieuDe, moTa, noiDung, theLoai, hinh, "ja", taiKhoan, tinhTrang);
	}
	public boolean CapNhatBaiViet(String id, String tieuDeVi, String moTaVi,
			String noiDungVi, String tieuDeJa, String moTaJa, String noiDungJa,
			String theLoai, String taiKhoan, String hinh, String tinhTrang) {
		// TODO Auto-generated method stub
		if(tieuDeVi==null || "".equals(tieuDeVi)) return false;
		if(moTaVi==null || "".equals(moTaVi)) return false;
		if(noiDungVi==null || "".equals(noiDungVi)) return false;
		if(tieuDeJa==null || "".equals(tieuDeJa)) return false;
		if(moTaJa==null || "".equals(moTaJa)) return false;
		if(noiDungJa==null || "".equals(noiDungJa)) return false;
		
		return baiviet.CapNhatBaiViet(id, tieuDeVi, tieuDeJa, moTaVi, moTaJa, noiDungVi, noiDungJa, theLoai, hinh, taiKhoan, tinhTrang);
	}
	public boolean XoaBaiViet(String id) {
		// TODO Auto-generated method stub
		return baiviet.XoaBaiViet(id);
	}
	public int TongBaiViet(String tk, String trangthai){
		return baiviet.TongBaiViet(tk, trangthai);
	}
	public int getCountBaiViet(String loai) {
		// TODO Auto-generated method stub
		return baiviet.getCountBaiViet(loai);
	}
	public boolean HuyBaiDich(String id) {
		// TODO Auto-generated method stub
		return baiviet.HuyBaiDich(id);
	}
	public String getID(){
		return baiviet.getID();
	}
	public void closeConnection(){
		baiviet.closeConnection();
	}
}
