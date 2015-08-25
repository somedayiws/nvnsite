package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.TAIKHOAN;

public class BaiVietDAO {

	DataBaseDAO db = new DataBaseDAO();
	/*
	 * Lấy bài viết có id tương ứng
	 * return BAIVIET
	 */
	public BAIVIET getBaiViet(String id) {
		// TODO Auto-generated method stub
		id = DinhDangSQL.FomatSQL(id);
		ResultSet rs = db.getResultSet("select IdBaiViet, TenBaiVietVi, TenBaiVietJa, MoTaVi, MoTaJa, danhmuc.IdDanhMuc, TenDanhMucVi, TenDanhMucJa, HienThi, taikhoan.IdTaiKhoan, TenTaiKhoan, MatKhau, HoTen, DiaChi, DienThoai, Email, QuyenQuanTri, NoiDungVi, NoiDungJa, TrangThai, GhiChu from baiviet inner join danhmuc on baiviet.IdDanhMuc=danhmuc.IdDanhMuc inner join taikhoan on baiviet.IdTaiKhoan=taikhoan.IdTaiKhoan where IdBaiViet='"+id+"'");
		BAIVIET bv = null;
		BinhLuanDAO bl = new BinhLuanDAO();
		try {
			if(rs.next()){
				bv = new BAIVIET();
				bv.setIdBaiViet(DinhDangSQL.DeFomatSQL(id));
				bv.setTenBaiVietVi(DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietVi")));
				bv.setTenBaiVietJa(DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietJa")));
				bv.setMoTaVi(DinhDangSQL.DeFomatSQL(rs.getString("MoTaVi")));
				bv.setMoTaJa(DinhDangSQL.DeFomatSQL(rs.getString("MoTaJa")));
				bv.setDanhMuc(new DANHMUC(DinhDangSQL.DeFomatSQL(rs.getString("IdDanhMuc")), DinhDangSQL.DeFomatSQL(rs.getString("TenDanhMucVi")), DinhDangSQL.DeFomatSQL(rs.getString("TenDanhMucJa")), rs.getInt("HienThi")));
				bv.setTaiKhoan( new TAIKHOAN(DinhDangSQL.DeFomatSQL(rs.getString("IdTaiKhoan")), DinhDangSQL.DeFomatSQL(rs.getString("TenTaiKhoan")), DinhDangSQL.DeFomatSQL(rs.getString("MatKhau")), DinhDangSQL.DeFomatSQL(rs.getString("HoTen")), DinhDangSQL.DeFomatSQL(rs.getString("DiaChi")), rs.getString("DienThoai"), DinhDangSQL.DeFomatSQL(rs.getString("Email")), DinhDangSQL.DeFomatSQL(rs.getString("QuyenQuanTri"))));
				bv.setNoiDungVi(DinhDangSQL.DeFomatSQL(rs.getString("NoiDungVi")));
				bv.setNoiDungJa(DinhDangSQL.DeFomatSQL(rs.getString("NoiDungJa")));
				bv.setTrangThai(DinhDangSQL.DeFomatSQL(rs.getString("TrangThai")));
				bv.setGhiChu(DinhDangSQL.DeFomatSQL(rs.getString("GhiChu")));
				db.updateData("update baiviet set LuotXem = LuotXem + 1 where IdBaiViet=N'"+id+"'");
				bv.setBinhLuanVi(bl.getListBinhLuan(id, "vi", "0"));
				bv.setBinhLuanJa(bl.getListBinhLuan(id, "ja", "0"));
				return bv;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bv;
	}
	/*
	 * Lấy danh sách top bài viết từ vị trí nào đó trở đi
	 * return ArrayList<BAIVIET>/null
	 */
	public ArrayList<BAIVIET> getDanhSachBaiViet(int n, String top) {
		// TODO Auto-generated method stub
		ArrayList<BAIVIET> list = new ArrayList<BAIVIET>();
		ResultSet rs = null;
		String sql = "select IdBaiViet, TenBaiVietVi, TenBaiVietJa, danhmuc.IdDanhMuc, TenDanhMucVi, TenDanhMucJa, HienThi, taikhoan.IdTaiKhoan, TenTaiKhoan, MatKhau, HoTen, DiaChi, DienThoai, Email, QuyenQuanTri, NoiDungVi, NoiDungJa, TrangThai, GhiChu from baiviet "
					+ "inner join danhmuc on baiviet.IdDanhMuc=danhmuc.IdDanhMuc "
					+ "inner join taikhoan on baiviet.IdTaiKhoan=taikhoan.IdTaiKhoan "
					+ "limit " + n + ", " + top;
		rs = db.getResultSet(sql);
		
		BinhLuanDAO bl = new BinhLuanDAO();
		
		try {
			while(rs.next()){
				String id = DinhDangSQL.DeFomatSQL(rs.getString("IdBaiViet"));
				BAIVIET bv = new BAIVIET(id, DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietVi")), DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietJa")), new DANHMUC(DinhDangSQL.DeFomatSQL(rs.getString("IdDanhMuc")), DinhDangSQL.DeFomatSQL(rs.getString("TenDanhMucVi")), DinhDangSQL.DeFomatSQL(rs.getString("TenDanhMucJa")), rs.getInt("HienThi")), new TAIKHOAN(DinhDangSQL.DeFomatSQL(rs.getString("IdTaiKhoan")), DinhDangSQL.DeFomatSQL(rs.getString("TenTaiKhoan")), DinhDangSQL.DeFomatSQL(rs.getString("MatKhau")), DinhDangSQL.DeFomatSQL(rs.getString("HoTen")), DinhDangSQL.DeFomatSQL(rs.getString("DiaChi")), rs.getString("DienThoai"), DinhDangSQL.DeFomatSQL(rs.getString("Email")), DinhDangSQL.DeFomatSQL(rs.getString("QuyenQuanTri"))), DinhDangSQL.DeFomatSQL(rs.getString("NoiDungVi")), DinhDangSQL.DeFomatSQL(rs.getString("NoiDungJa")), DinhDangSQL.DeFomatSQL(rs.getString("TrangThai")), DinhDangSQL.DeFomatSQL(rs.getString("GhiChu")));
				bv.setBinhLuanVi(bl.getListBinhLuan(id, "vi", "3"));
				list.add(bv);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/*
	 * Lấy danh sách top bài viết từ vị trí nào đó trở đi tương ứng của danh mục id
	 * return ArrayList<BAIVIET>/null
	 */
	public ArrayList<BAIVIET> getListBaiViet(String id, String vitri, String top) {
		// TODO Auto-generated method stub
		String sql = "select IdBaiViet,TenBaiVietVi,TenBaiVietJa,MoTaVi,MoTaJa,NoiDungVi,NoiDungJa,NgayDang,Lienket,LuotXem,HoTen from baiviet inner join taikhoan on baiviet.IdTaiKhoan=taikhoan.IdTaiKhoan where TrangThai=N'OK' and IdDanhMuc='"+id+"' limit " + vitri + ", " +top;
		ResultSet rs = db.getResultSet(sql);
		ArrayList<BAIVIET> list = new ArrayList<BAIVIET>();
		try {
			while(rs.next()){
				BAIVIET bv = new BAIVIET();
				bv.setIdBaiViet(rs.getString("IdBaiViet"));
				bv.setTenBaiVietVi(rs.getString("TenBaiVietVi"));
				bv.setTenBaiVietJa(rs.getString("TenBaiVietJa"));
				bv.setMoTaVi(rs.getString("MoTaVi"));
				bv.setMoTaJa(rs.getString("MoTaJa"));
				bv.setNgayDang(rs.getString("NgayDang"));
				bv.setLienKet(rs.getString("LienKet"));
				bv.setLuotXem(rs.getInt("LuotXem"));
				TAIKHOAN tk = new TAIKHOAN();
				tk.setHoTen(rs.getString("HoTen"));
				bv.setTaiKhoan(tk);
				list.add(bv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	/*
	 * Thêm bài viết song ngữ mới
	 * return true/false
	 */
	public boolean ThemBaiViet(String tieuDeVi, String moTaVi, String noiDungVi,
			String tieuDeJa, String moTaJa, String noiDungJa, String theLoai,
			String taiKhoan, String hinhAnh) {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sql = "insert into baiviet(IdBaiViet, TenBaiVietVi, TenBaiVietJa, IdDanhMuc, MotaVi, MotaJa, IdTaiKhoan, NoiDungVi, NoiDungJa, TrangThai, LuotXem, NgayDang, CoXoa) values "
				+ "(N'"+getID()+"', N'"+tieuDeVi+"', N'"+tieuDeJa+"', N'"+theLoai+"', N'"+moTaVi+"', N'"+moTaJa+"', N'"+taiKhoan+"', N'"+noiDungVi+"', N'"+noiDungJa+"', N'MoiPost', '0', '"+sdf.format(cal.getTime())+"', '0')";
		return db.updateData(sql);
	}
	/*
	 * Thêm bài viết bằng tiếng việt
	 * return true/false
	 */
	public boolean ThemBaiVietVi(String tieuDe, String moTa, String noiDung,
			String theLoai, String taiKhoan, String hinhAnh) {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sql = "insert into baiviet(IdBaiViet, TenBaiVietVi, IdDanhMuc, MotaVi, IdTaiKhoan, NoiDungVi, TrangThai, LuotXem, NgayDang, CoXoa) values "
				+ "(N'"+getID()+"', N'"+tieuDe+"', N'"+theLoai+"', N'"+moTa+"', N'"+taiKhoan+"', N'"+noiDung+"', N'MoiPost', '0', '"+sdf.format(cal.getTime())+"', '0')";
		
		return db.updateData(sql);
	}
	/*
	 * Thêm bài viết bằng tiếng nhật
	 * return true/false
	 */
	public boolean ThemBaiVietJa(String tieuDe, String moTa, String noiDung,
			String theLoai, String taiKhoan, String hinhAnh) {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sql = "insert into baiviet(IdBaiViet, TenBaiVietJa, IdDanhMuc, MotaJa, IdTaiKhoan, NoiDungJa, TrangThai, LuotXem, NgayDang, CoXoa) values "
				+ "(N'"+getID()+"', N'"+tieuDe+"', N'"+theLoai+"', N'"+moTa+"', N'"+taiKhoan+"', N'"+noiDung+"', N'MoiPost', '0', '"+sdf.format(cal.getTime())+"', '0')";
		return db.updateData(sql);
	}
	/*
	 * Lấy Mã bài viết tiếp theo trong Data
	 * return String
	 */
	public String getID(){
		String Id = "BV00000000";
		ResultSet rs = db.getResultSet("select IdBaiViet from baiviet order by IdBaiViet desc limit 1");
		try {
			if(rs.next()){
				int tam = Integer.parseInt(rs.getString(1).substring(2)) + 1;
				Id = Id.substring(0, 10 - (tam+"").length()) + tam;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Id;
	}
	/*
	 * Dùng cho trang client
	 * Lấy danh sách 10 bài viết có lược view lớn nhất
	 * return ArrayList<BAIVIET> or null
	 */
	public ArrayList<BAIVIET> getTopBaiViet() {
		// TODO Auto-generated method stub
		ArrayList<BAIVIET> list = new ArrayList<BAIVIET>();
		ResultSet rs = null;
		String sql = "select IdBaiViet, TenBaiVietVi, TenBaiVietJa, danhmuc.IdDanhMuc, TenDanhMucVi, TenDanhMucJa, HienThi, taikhoan.IdTaiKhoan, TenTaiKhoan, MatKhau, HoTen, DiaChi, DienThoai, Email, QuyenQuanTri, NoiDungVi, NoiDungJa, TrangThai, GhiChu from baiviet "
					+ "inner join danhmuc on baiviet.IdDanhMuc=danhmuc.IdDanhMuc "
					+ "inner join taikhoan on baiviet.IdTaiKhoan=taikhoan.IdTaiKhoan "
					+ "order by LuotXem desc limit 10";
		rs = db.getResultSet(sql);
		BinhLuanDAO bl = new BinhLuanDAO();
		try {
			while(rs.next()){
				String id = rs.getString("IdBaiViet");
				BAIVIET bv = new BAIVIET(id, rs.getString("TenBaiVietVi"), rs.getString("TenBaiVietJa"), new DANHMUC(rs.getString("IdDanhMuc"), rs.getString("TenDanhMucVi"), rs.getString("TenDanhMucJa"), rs.getInt("HienThi")), new TAIKHOAN(rs.getString("IdTaiKhoan"), rs.getString("TenTaiKhoan"), rs.getString("MatKhau"), rs.getString("HoTen"), rs.getString("DiaChi"), rs.getString("DienThoai"), rs.getString("Email"), rs.getString("QuyenQuanTri")), rs.getString("NoiDungVi"), rs.getString("NoiDungJa"), rs.getString("TrangThai"), rs.getString("GhiChu"));
				bv.setBinhLuanVi(bl.getListBinhLuan(id, "vi", "0"));
				bv.setBinhLuanVi(bl.getListBinhLuan(id, "ja", "0"));
				list.add(bv);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/*
	 * Dùng cho trang client
	 * Lấy danh sách các bài viết phù hợp với nội dung tìm kiếm
	 * return ArrayList<BAIVIET> or null
	 */
	public ArrayList<BAIVIET> getFind(String txtFind, String vitri, String top) {
		// TODO Auto-generated method stub
		ArrayList<BAIVIET> list = new ArrayList<BAIVIET>();
		ResultSet rs = null;
		String sql = "select IdBaiViet, TenBaiVietVi, TenBaiVietJa, danhmuc.IdDanhMuc, TenDanhMucVi, TenDanhMucJa, HienThi, taikhoan.IdTaiKhoan, TenTaiKhoan, MatKhau, HoTen, DiaChi, DienThoai, Email, QuyenQuanTri, NoiDungVi, NoiDungJa, TrangThai, GhiChu from baiviet "
						+ " inner join danhmuc on baiviet.IdDanhMuc=danhmuc.IdDanhMuc"
						+ " inner join taikhoan on baiviet.IdTaiKhoan=taikhoan.IdTaiKhoan"
						+ " where TenBaiVietJa like '%"+txtFind+"%' or TenBaiVietVi like '%"+txtFind+"%'"
						+ " or MotaJa like '%"+txtFind+"%' or MotaVi like '%"+txtFind+"%' limit "+vitri+", "+top;
		
		rs = db.getResultSet(sql);
		
		BinhLuanDAO bl = new BinhLuanDAO();
		
		try {
			while(rs.next()){
				String id = rs.getString("IdBaiViet");
				BAIVIET bv = new BAIVIET(id, rs.getString("TenBaiVietVi"), rs.getString("TenBaiVietJa"), new DANHMUC(rs.getString("IdDanhMuc"), rs.getString("TenDanhMucVi"), rs.getString("TenDanhMucJa"), rs.getInt("HienThi")), new TAIKHOAN(rs.getString("IdTaiKhoan"), rs.getString("TenTaiKhoan"), rs.getString("MatKhau"), rs.getString("HoTen"), rs.getString("DiaChi"), rs.getString("DienThoai"), rs.getString("Email"), rs.getString("QuyenQuanTri")), rs.getString("NoiDungVi"), rs.getString("NoiDungJa"), rs.getString("TrangThai"), rs.getString("GhiChu"));
				bv.setBinhLuanVi(bl.getListBinhLuan(id, "vi", "3"));
				list.add(bv);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/*
	 * Dùng cho trang cộng tác viên
	 * Lấy danh sách bài viết tương ứng với tài khoản được phân công
	 * return ArrayList<BAIVIET> or null
	 */
	public ArrayList<BAIVIET> getListPhanCong(String idTaiKhoan) {
		ArrayList<BAIVIET> list = new ArrayList<BAIVIET>();
		ResultSet rs = null;
		String sql = "select baiviet.IdBaiViet, TenBaiVietVi, TenBaiVietJa, MotaVi, MotaJa, NoiDungVi, NoiDungJa, GhiChu from baiviet "
				+ "inner join lichsu on baiviet.IdBaiViet = lichsu.IdBaiViet "
				+ "where (lichsu.TrangThai = N'ChuyenDich' or lichsu.TrangThai = N'DangDich' or lichsu.TrangThai = N'LoiDich' "
				+ "or lichsu.TrangThai = N'DaDich') and lichsu.IdTaiKhoan = N'"+idTaiKhoan+"'";
		
		rs = db.getResultSet(sql);
		
		try {
			while(rs.next()){
				BAIVIET bv = new BAIVIET();
				bv.setIdBaiViet(DinhDangSQL.DeFomatSQL(rs.getString("IdBaiViet")));
				bv.setTenBaiVietVi(DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietVi")));
				bv.setTenBaiVietJa(DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietJa")));
				bv.setMoTaVi(DinhDangSQL.DeFomatSQL(rs.getString("MotaVi")));
				bv.setMoTaJa(DinhDangSQL.DeFomatSQL(rs.getString("MotaJa")));
				bv.setNoiDungVi(DinhDangSQL.DeFomatSQL(rs.getString("NoiDungVi")));
				bv.setNoiDungJa(DinhDangSQL.DeFomatSQL(rs.getString("NoiDungJa")));
				bv.setGhiChu(DinhDangSQL.DeFomatSQL(rs.getString("GhiChu")));
				list.add(bv);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/*
	 * Dùng cho trang cộng tác viên, admin
	 * Cập nhật trạng thái bài dịch(ChuyenDich, DangDich, DaDich, Ok, HuyDich, LoiDich, DangBai, MoiPost)
	 * return bool(kết quả cập nhật)
	 */
	public boolean CapNhatBaiViet(String id, String tieude, String mota,
			String noidung, String tinhtrang, String ngonNgu, String idTaiKhoan) {
		// TODO Auto-generated method stub
		String sql = "";
		if(ngonNgu.equals("ja")){
			sql = "update baiviet set TenBaiVietVi=N'"+tieude
					+"', MotaVi=N'"+mota
					+"', NoiDungVi=N'"+noidung
					+"' where IdBaiViet=N'"+id+"'";
		}else{
			sql = "update baiviet set TenBaiVietJa=N'"+tieude
					+"', MotaJa=N'"+mota
					+"', NoiDungJa=N'"+noidung
					+"' where IdBaiViet=N'"+id+"'";
		}
//		CapNhatBaiViet(id, tinhtrang, idTaiKhoan);
		return (CapNhatBaiViet(id, tinhtrang, idTaiKhoan) & db.updateData(sql));
	}
	/*
	 * Dùng cho trang cộng tác viên, admin
	 * Cập nhật trạng thái bài dịch(ChuyenDich, DangDich, DaDich, Ok, HuyDich, LoiDich, DangBai, MoiPost)
	 * return bool(kết quả cập nhật)
	 */
	public boolean CapNhatBaiViet(String id, String tinhtrang, String idTaiKhoan) {
		// TODO Auto-generated method stub
		id = DinhDangSQL.FomatSQL(id);
		tinhtrang = DinhDangSQL.FomatSQL(tinhtrang);
		idTaiKhoan = DinhDangSQL.FomatSQL(idTaiKhoan);
		String sql = "update lichsu set TrangThai=N'"+tinhtrang+"' where IdBaiViet=N'"+id+"' and IdTaiKhoan=N'"+idTaiKhoan+"'";
		return db.updateData(sql);
	}
	/*
	 * Dùng cho trang cộng tác viên
	 * Lấy danh sách bài dịch được phân công cho cộng tác viên x, với tùy chọn(Bài quá hạn, mới, đang dịch)
	 * return ArrayList<BAIVIET>
	 */
	public ArrayList<BAIVIET> getListPhanCong(String idTaiKhoan, String view) {
		// TODO Auto-generated method stub
		ArrayList<BAIVIET> list = new ArrayList<BAIVIET>();
		ResultSet rs = null;
		String sql = "";
		if(view.equals("qua-han")){
			sql = "select baiviet.IdBaiViet, TenBaiVietVi, TenBaiVietJa, MotaVi, MotaJa, NoiDungVi, NoiDungJa, GhiChu from baiviet "
					+ "inner join lichsu on baiviet.IdBaiViet = lichsu.IdBaiViet "
					+ "where (lichsu.TrangThai = N'ChuyenDich' or lichsu.TrangThai = N'DangDich' or lichsu.TrangThai = N'LoiDich' "
					+ "or lichsu.TrangThai = N'DaDich') and CURDATE()-ThoiGian>3  and lichsu.IdTaiKhoan = N'"+idTaiKhoan+"'";
		}else if(view.equals("moi")){
			sql = "select baiviet.IdBaiViet, TenBaiVietVi, TenBaiVietJa, MotaVi, MotaJa, NoiDungVi, NoiDungJa, GhiChu from baiviet "
					+ "inner join lichsu on baiviet.IdBaiViet = lichsu.IdBaiViet "
					+ "where (lichsu.TrangThai = N'ChuyenDich' or lichsu.TrangThai = N'LoiDich'"
					+ ") and lichsu.IdTaiKhoan = N'"+idTaiKhoan+"'";
		}else{
			sql = "select baiviet.IdBaiViet, TenBaiVietVi, TenBaiVietJa, MotaVi, MotaJa, NoiDungVi, NoiDungJa, GhiChu from baiviet "
					+ "inner join lichsu on baiviet.IdBaiViet = lichsu.IdBaiViet "
					+ "where (lichsu.TrangThai = N'DangDich' "
					+ "or lichsu.TrangThai = N'DaDich') and lichsu.IdTaiKhoan = N'"+idTaiKhoan+"'";
		}
		
		rs = db.getResultSet(sql);
		
		try {
			while(rs.next()){
				BAIVIET bv = new BAIVIET();
				bv.setIdBaiViet(DinhDangSQL.DeFomatSQL(rs.getString("IdBaiViet")));
				bv.setTenBaiVietVi(DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietVi")));
				bv.setTenBaiVietJa(DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietJa")));
				bv.setMoTaVi(DinhDangSQL.DeFomatSQL(rs.getString("MotaVi")));
				bv.setMoTaJa(DinhDangSQL.DeFomatSQL(rs.getString("MotaJa")));
				bv.setNoiDungVi(DinhDangSQL.DeFomatSQL(rs.getString("NoiDungVi")));
				bv.setNoiDungJa(DinhDangSQL.DeFomatSQL(rs.getString("NoiDungJa")));
				bv.setGhiChu(DinhDangSQL.DeFomatSQL(rs.getString("GhiChu")));
				list.add(bv);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/*
	 * Dùng cho trang cộng tác viên, admin
	 * Cập nhật bình luận bài viết qua lại giữa ctv và admin
	 * return bool(true(Thành công)/false(Thất bại))
	 */
	public boolean setBinhLuan(String id, String bluan) {
		// TODO Auto-generated method stub
		return db.updateData("update baiviet set GhiChu=CONCAT(GhiChu, N'"+bluan+"') where IdBaiViet=N'"+id+"'");
	}
	/*
	 * Dùng cho trang cộng tác viên
	 * Đếm số lượng bài viết có trong danh sách đươc chọn(Tất cả, Mới chuyển, Dịch Bài, Quá hạn)
	 * return String = count(list)
	 */
	public String getCount(String chon, String taikhoan) {
		// TODO Auto-generated method stub
		String sql = "";
		if(chon.equals("all")){
			sql = "select count(*) as dem from lichsu where (TrangThai = N'ChuyenDich' or TrangThai = N'DangDich' or TrangThai = N'LoiDich' or TrangThai = N'DaDich') and IdTaiKhoan = N'"+taikhoan+"'";
		}else if(chon.equals("moi")){
			sql = "select count(*) as dem from lichsu where (TrangThai = N'ChuyenDich' or TrangThai = N'LoiDich') and IdTaiKhoan = N'"+taikhoan+"'";
		}else if(chon.equals("dich")){
			sql = "select count(*) as dem from lichsu where (TrangThai = N'DangDich' or TrangThai = N'DaDich') and IdTaiKhoan = N'"+taikhoan+"'";
		}else{
			sql = "select count(*) as dem from lichsu where (TrangThai = N'ChuyenDich' or TrangThai = N'DangDich' or TrangThai = N'LoiDich' or TrangThai = N'DaDich') and CURDATE()-ThoiGian>3 and IdTaiKhoan = N'"+taikhoan+"'";
		}
		ResultSet rs = db.getResultSet(sql);
		try {
			if(rs.next()){
				return ""+rs.getInt(1);
			}
		} catch (SQLException e) {
			return "0";
		}
		return "0";
	}
	/*
	 * Dùng cho trang cộng tác viên
	 * Lấy thông tin bài viết có Id và được dịch bởi ctv có id = idTaiKhoan
	 * return String = "Trạng thái bài dịch hiện tại, Ngày gửi bài đó tới cho cộng tác viên dịch"
	 */
	public String getInfo(String id, String idTaiKhoan) {
		// TODO Auto-generated method stub
		String sql = "select TrangThai, ThoiGian  from lichsu where IdBaiViet=N'"+id+"' and IdTaiKhoan=N'"+idTaiKhoan+"'";
		ResultSet rs = db.getResultSet(sql);
		try {
			if(rs.next()){
				String ttrang = rs.getString(1);
				if(ttrang.equals("ChuyenDich")){
					ttrang = "Mới chuyển";
				}else if(ttrang.equals("LoiDich")){
					ttrang = "Dịch lỗi";
				}else if(ttrang.equals("DangDich")){
					ttrang = "Đang dịch";
				}else {
					ttrang = "Dịch xong";
				}
		        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
				return ttrang + "," + sdf.format(rs.getDate(2));
			}
		} catch (SQLException e) {
			return "";
		}
		return "";
	}
	/*
	 * Dùng cho trang client
	 * Lấy danh sách bài viết của 1 user (Đã đăng, Đang duyệt, Bị hủy)
	 * return ArrayList<BAIVIET>
	 */
	public ArrayList<BAIVIET> getListBaiViet(String id) {
		// TODO Auto-generated method stub
		String sql = "select IdBaiViet, TenBaiVietVi, TenBaiVietJa, LuotXem, NgayDang, TrangThai, Lienket from baiviet where IdTaiKhoan=N'"+id+"'";
		ResultSet rs = db.getResultSet(sql);
		ArrayList<BAIVIET> list = new ArrayList<BAIVIET>();
		try {
			while(rs.next()){
				BAIVIET bv = new BAIVIET();
				bv.setIdBaiViet(rs.getString("IdBaiViet"));
				bv.setTenBaiVietVi(rs.getString("TenBaiVietVi"));
				bv.setTenBaiVietJa(rs.getString("TenBaiVietJa"));
				bv.setLuotXem(rs.getInt("LuotXem"));
				bv.setNgayDang(rs.getString("NgayDang"));
				String trangthai = rs.getString("TrangThai");
				if(trangthai.equals("OK"))
					bv.setTrangThai("Đã đăng");
				else if(trangthai.equals("clientdang"))
					bv.setTrangThai("Đang duyệt");
				else
					bv.setTrangThai("Bị hủy");
				bv.setLienKet(rs.getString("Lienket"));
				list.add(bv);
			}
		} catch (SQLException e) {
			System.out.println("Lỗi truy vấn danh sách bài viết");
		}
		return list;
	}

}
