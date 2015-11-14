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
		ResultSet rs = db.getResultSet("select IdBaiViet,TenBaiVietVi, TenBaiVietJa, MoTaVi, MoTaJa, danhmuc.IdDanhMuc, TenDanhMucVi, TenDanhMucJa, HienThi, taikhoan.IdTaiKhoan, TenTaiKhoan, MatKhau, HoTen, DiaChi, DienThoai, Email, QuyenQuanTri, NoiDungVi, NoiDungJa, TrangThai, GhiChu, LienKet, NgayDang, taikhoan.HoTen, LuotXem from baiviet inner join danhmuc on baiviet.IdDanhMuc=danhmuc.IdDanhMuc inner join taikhoan on baiviet.IdTaiKhoan=taikhoan.IdTaiKhoan where IdBaiViet='"+id+"' and baiviet.CoXoa=0 ");
		BAIVIET bv = null;
		BinhLuanDAO bl = new BinhLuanDAO();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm");
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
				bv.setLienKet(DinhDangSQL.DeFomatSQL(rs.getString("LienKet")));
				bv.setNgayDang(sdf.format(rs.getTimestamp("NgayDang")));
				bv.setLuotXem(rs.getInt("LuotXem"));
				System.out.println(bv.getGhiChu());
				if(bv.getTrangThai().equals("OK"))
					db.updateData("update baiviet set LuotXem = LuotXem + 1 where IdBaiViet=N'"+id+"'");
				bv.setBinhLuanVi(bl.getListBinhLuan(id, "vi", "0"));
				bv.setBinhLuanJa(bl.getListBinhLuan(id, "ja", "0"));
				return bv;
			}
		} catch (SQLException e) {
			return null;
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
		String sql = "select IdBaiViet, MoTaVi, MoTaJa,TenBaiVietVi, TenBaiVietJa, danhmuc.IdDanhMuc, TenDanhMucVi, TenDanhMucJa, HienThi, taikhoan.IdTaiKhoan, TenTaiKhoan, MatKhau, HoTen, DiaChi, DienThoai, Email, QuyenQuanTri, NoiDungVi, NoiDungJa, TrangThai, GhiChu, LienKet from baiviet "
					+ "inner join danhmuc on baiviet.IdDanhMuc=danhmuc.IdDanhMuc "
					+ "inner join taikhoan on baiviet.IdTaiKhoan=taikhoan.IdTaiKhoan "
					+ "where baiviet.CoXoa = 0 order by baiviet.NgayDang desc"
					+ "limit " + n + ", " + top;
		rs = db.getResultSet(sql);
		
		BinhLuanDAO bl = new BinhLuanDAO();
		
		try {
			while(rs.next()){
				String id = DinhDangSQL.DeFomatSQL(rs.getString("IdBaiViet"));
				BAIVIET bv = new BAIVIET(id, DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietVi")), DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietJa")), new DANHMUC(DinhDangSQL.DeFomatSQL(rs.getString("IdDanhMuc")), DinhDangSQL.DeFomatSQL(rs.getString("TenDanhMucVi")), DinhDangSQL.DeFomatSQL(rs.getString("TenDanhMucJa")), rs.getInt("HienThi")), new TAIKHOAN(DinhDangSQL.DeFomatSQL(rs.getString("IdTaiKhoan")), DinhDangSQL.DeFomatSQL(rs.getString("TenTaiKhoan")), DinhDangSQL.DeFomatSQL(rs.getString("MatKhau")), DinhDangSQL.DeFomatSQL(rs.getString("HoTen")), DinhDangSQL.DeFomatSQL(rs.getString("DiaChi")), rs.getString("DienThoai"), DinhDangSQL.DeFomatSQL(rs.getString("Email")), DinhDangSQL.DeFomatSQL(rs.getString("QuyenQuanTri"))), DinhDangSQL.DeFomatSQL(rs.getString("NoiDungVi")), DinhDangSQL.DeFomatSQL(rs.getString("NoiDungJa")), DinhDangSQL.DeFomatSQL(rs.getString("TrangThai")), DinhDangSQL.DeFomatSQL(rs.getString("GhiChu")));
				bv.setLienKet(DinhDangSQL.DeFomatSQL(rs.getString("LienKet")));
				bv.setMoTaVi(DinhDangSQL.DeFomatSQL(rs.getString("MoTaVi")));
				bv.setMoTaJa(DinhDangSQL.DeFomatSQL(rs.getString("MoTaJa")));
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
		String sql = "select IdBaiViet,TenBaiVietVi,TenBaiVietJa,MoTaVi,MoTaJa,NoiDungVi,NoiDungJa,NgayDang,Lienket,LuotXem,HoTen from baiviet inner join taikhoan on baiviet.IdTaiKhoan=taikhoan.IdTaiKhoan where TrangThai=N'OK' and IdDanhMuc=N'"+DinhDangSQL.FomatSQL(id)+"' and baiviet.CoXoa = 0 order by NgayDang desc, LuotXem desc limit " + vitri + ", " +top;
		ResultSet rs = db.getResultSet(sql);
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		ArrayList<BAIVIET> list = new ArrayList<BAIVIET>();
		try {
			while(rs.next()){
				BAIVIET bv = new BAIVIET();
				bv.setIdBaiViet(DinhDangSQL.DeFomatSQL(rs.getString("IdBaiViet")));
				bv.setTenBaiVietVi(DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietVi")));
				bv.setTenBaiVietJa(DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietJa")));
				bv.setMoTaVi(DinhDangSQL.DeFomatSQL(rs.getString("MoTaVi")));
				bv.setMoTaJa(DinhDangSQL.DeFomatSQL(rs.getString("MoTaJa")));
				bv.setNgayDang(sdf.format(rs.getDate("NgayDang")));
				bv.setLienKet(DinhDangSQL.DeFomatSQL(rs.getString("LienKet")));
				bv.setLuotXem(rs.getInt("LuotXem"));
				TAIKHOAN tk = new TAIKHOAN();
				tk.setHoTen(DinhDangSQL.DeFomatSQL(rs.getString("HoTen")));
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
			String taiKhoan, String hinhAnh, String trangThai) {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql = "insert into baiviet(IdBaiViet, TenBaiVietVi, TenBaiVietJa, IdDanhMuc, MotaVi, MotaJa, IdTaiKhoan, NoiDungVi, NoiDungJa, TrangThai, LuotXem, NgayDang, CoXoa, LienKet) values "
				+ "(N'"+getID()+"', N'"+DinhDangSQL.FomatSQL(tieuDeVi)
				+"', N'"+DinhDangSQL.FomatSQL(tieuDeJa)+"', N'"+DinhDangSQL.FomatSQL(theLoai)+"', N'"
				+DinhDangSQL.FomatSQL(moTaVi)+"', N'"+DinhDangSQL.FomatSQL(moTaJa)+"', N'"
				+DinhDangSQL.FomatSQL(taiKhoan)+"', N'"+DinhDangSQL.FomatSQL(noiDungVi)+"', N'"
				+DinhDangSQL.FomatSQL(noiDungJa)+"', N'"+trangThai+"', '0', '"
				+sdf.format(cal.getTime())+"', '0', N'"+hinhAnh+"')";
		System.out.println("SQL : " + sql);
		return db.updateData(sql);
	}
	/*
	 * Thêm bài viết bằng tiếng việt
	 * return true/false
	 */
	public boolean ThemBaiVietVi(String tieuDe, String moTa, String noiDung,
			String theLoai, String taiKhoan, String hinhAnh, String trangThai) {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql = "insert into baiviet(IdBaiViet, TenBaiVietVi, IdDanhMuc, MotaVi, IdTaiKhoan, NoiDungVi, TrangThai, LuotXem, NgayDang, CoXoa, LienKet) values "
				+ "(N'"+getID()+"', N'"+DinhDangSQL.FomatSQL(tieuDe)+"', N'"
				+DinhDangSQL.FomatSQL(theLoai)+"', N'"+DinhDangSQL.FomatSQL(moTa)+"', N'"
				+DinhDangSQL.FomatSQL(taiKhoan)+"', N'"+DinhDangSQL.FomatSQL(noiDung)+"', N'"+trangThai+"', '0', '"
				+sdf.format(cal.getTime())+"', '0', N'"+hinhAnh+"')";
		
		return db.updateData(sql);
	}
	/*
	 * Thêm bài viết bằng tiếng nhật
	 * return true/false
	 */
	public boolean ThemBaiVietJa(String tieuDe, String moTa, String noiDung,
			String theLoai, String taiKhoan, String hinhAnh, String trangThai) {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql = "insert into baiviet(IdBaiViet, TenBaiVietJa, IdDanhMuc, MotaJa, IdTaiKhoan, NoiDungJa, TrangThai, LuotXem, NgayDang, CoXoa, LienKet) values "
				+ "(N'"+getID()+"', N'"+DinhDangSQL.FomatSQL(tieuDe)+"', N'"
				+DinhDangSQL.FomatSQL(theLoai)+"', N'"+DinhDangSQL.FomatSQL(moTa)+"', N'"
				+DinhDangSQL.FomatSQL(taiKhoan)+"', N'"+DinhDangSQL.FomatSQL(noiDung)+"', N'"+trangThai+"', '0', '"
				+sdf.format(cal.getTime())+"', '0', N'"+hinhAnh+"')";
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
	public ArrayList<BAIVIET> getTopBaiViet(String loai) {
		// TODO Auto-generated method stub
		ArrayList<BAIVIET> list = new ArrayList<BAIVIET>();
		ResultSet rs = null;
		String sql = "";
		if(loai.equals("Moi"))
			sql = "select IdBaiViet, TenBaiVietVi, TenBaiVietJa,LienKet,MoTaVi,MoTaJa from baiviet where TrangThai='OK' and baiviet.CoXoa = 0 order by NgayDang desc limit 10";
		else if(loai.equals("hotPosts"))
			sql = "select baiviet.IdBaiViet, TenBaiVietVi, TenBaiVietJa,LienKet,MoTaVi,MoTaJa, test.sobinhluan, baiviet.LuotXem "
					+ "from baiviet "
					+ "left join (select binhluan.IdBaiViet, count(*) as sobinhluan from binhluan "
					+ "group by binhluan.IdBaiViet "
					+ "order by sobinhluan desc) as test on test.IdBaiViet = baiviet.IdBaiViet "
					+ "where  baiviet.CoXoa = 0 and (DATE_SUB(CURDATE(),INTERVAL 14 DAY)) <= baiviet.NgayDang and baiviet.TrangThai = 'OK' "
					+ "order by test.sobinhluan desc, baiviet.LuotXem desc limit 4";
		else if(loai.equals("slidePosts"))
			sql = "select baiviet.IdBaiViet, TenBaiVietVi, TenBaiVietJa,LienKet,MoTaVi,MoTaJa from baiviet where baiviet.GimTrangChu = '1' and baiviet.TrangThai = 'OK' and baiviet.CoXoa = 0  order by RAND() limit 5";
		rs = db.getResultSet(sql);
		try {
			while(rs.next()){
				BAIVIET bv = new BAIVIET();
				bv.setIdBaiViet(DinhDangSQL.DeFomatSQL(rs.getString("IdBaiViet")));
				bv.setTenBaiVietVi(DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietVi")));
				bv.setTenBaiVietJa(DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietJa")));
				bv.setLienKet(DinhDangSQL.DeFomatSQL(rs.getString("LienKet")));
				bv.setMoTaVi(DinhDangSQL.DeFomatSQL(rs.getString("MoTaVi")));
				bv.setMoTaJa(DinhDangSQL.DeFomatSQL(rs.getString("MoTaJa")));
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
		String sql = "select IdBaiViet,TenBaiVietVi,TenBaiVietJa,MoTaVi,MoTaJa,NoiDungVi,NoiDungJa,NgayDang,Lienket,LuotXem,HoTen from baiviet "
				+ "inner join taikhoan on baiviet.IdTaiKhoan=taikhoan.IdTaiKhoan "
				+ "where TrangThai=N'OK' and baiviet.CoXoa = 0 and (TenBaiVietJa like N'%"+txtFind+"%' or TenBaiVietVi like N'%"+txtFind+"%'"
				+ " or MotaJa like N'%"+txtFind+"%' or MotaVi like N'%"+txtFind+"%')"
				+ "order by NgayDang desc, LuotXem desc limit " + vitri + ", " +top;
		ResultSet rs = db.getResultSet(sql);
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		ArrayList<BAIVIET> list = new ArrayList<BAIVIET>();
		try {
			while(rs.next()){
				BAIVIET bv = new BAIVIET();
				bv.setIdBaiViet(DinhDangSQL.DeFomatSQL(rs.getString("IdBaiViet")));
				bv.setTenBaiVietVi(DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietVi")));
				bv.setTenBaiVietJa(DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietJa")));
				bv.setMoTaVi(DinhDangSQL.DeFomatSQL(rs.getString("MoTaVi")));
				bv.setMoTaJa(DinhDangSQL.DeFomatSQL(rs.getString("MoTaJa")));
				bv.setNgayDang(sdf.format(rs.getDate("NgayDang")));
				bv.setLienKet(DinhDangSQL.DeFomatSQL(rs.getString("LienKet")));
				bv.setLuotXem(rs.getInt("LuotXem"));
				TAIKHOAN tk = new TAIKHOAN();
				tk.setHoTen(DinhDangSQL.DeFomatSQL(rs.getString("HoTen")));
				bv.setTaiKhoan(tk);
				list.add(bv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}
	
	
	public ArrayList<BAIVIET> getFind(String kieu, String txtFind, String vitri, String top) {
		// TODO Auto-generated method stub
		String sql = "";
		if(kieu.equals("All")){
			sql = "select IdBaiViet,TenBaiVietVi,TenBaiVietJa,MoTaVi,MoTaJa,NoiDungVi,NoiDungJa,NgayDang,Lienket,LuotXem,HoTen from baiviet "
					+ "inner join taikhoan on baiviet.IdTaiKhoan=taikhoan.IdTaiKhoan "
					+ "inner join danhmuc on baiviet.IdDanhMuc=danhmuc.IdDanhMuc "
					+ "where TrangThai=N'OK' and baiviet.CoXoa = 0 and (TenDanhMucVi like N'%"+txtFind+"%' or TenDanhMucJa like N'%"+txtFind+"%'"
					+ " or TenBaiVietVi like N'%"+txtFind+"%' or TenBaiVietJa like N'%"+txtFind+"%'"
					+ " or MotaVi like N'%"+txtFind+"%' or MotaJa like N'%"+txtFind+"%') "
					+ "order by NgayDang desc, LuotXem desc limit " + vitri + ", " +top;
		}else if(kieu.equals("ChuDe")){
			sql = "select IdBaiViet,TenBaiVietVi,TenBaiVietJa,MoTaVi,MoTaJa,NoiDungVi,NoiDungJa,NgayDang,Lienket,LuotXem,HoTen from baiviet "
					+ "inner join taikhoan on baiviet.IdTaiKhoan=taikhoan.IdTaiKhoan "
                    + "inner join danhmuc on baiviet.IdDanhMuc=danhmuc.IdDanhMuc "
					+ "where TrangThai=N'OK' and baiviet.CoXoa = 0 and (TenDanhMucVi like N'%"+txtFind+"%' or TenDanhMucJa like N'%"+txtFind+"%' "
					+ "or TenBaiVietVi like N'%"+txtFind+"%' or TenBaiVietJa like N'%"+txtFind+"%') "
					+ "order by NgayDang desc, LuotXem desc limit " + vitri + ", " +top;
		}else {
			sql = "select IdBaiViet,TenBaiVietVi,TenBaiVietJa,MoTaVi,MoTaJa,NoiDungVi,NoiDungJa,NgayDang,Lienket,LuotXem,HoTen from baiviet "
					+ "inner join taikhoan on baiviet.IdTaiKhoan=taikhoan.IdTaiKhoan "
					+ "where TrangThai=N'OK' and baiviet.CoXoa = 0 and (TenBaiVietJa like N'%"+txtFind+"%' or TenBaiVietVi like N'%"+txtFind+"%'"
					+ " or MotaJa like N'%"+txtFind+"%' or MotaVi like N'%"+txtFind+"%')"
					+ "order by NgayDang desc, LuotXem desc limit " + vitri + ", " +top;
		}
		ResultSet rs = db.getResultSet(sql);
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		ArrayList<BAIVIET> list = new ArrayList<BAIVIET>();
		try {
			while(rs.next()){
				BAIVIET bv = new BAIVIET();
				bv.setIdBaiViet(DinhDangSQL.DeFomatSQL(rs.getString("IdBaiViet")));
				bv.setTenBaiVietVi(DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietVi")));
				bv.setTenBaiVietJa(DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietJa")));
				bv.setMoTaVi(DinhDangSQL.DeFomatSQL(rs.getString("MoTaVi")));
				bv.setMoTaJa(DinhDangSQL.DeFomatSQL(rs.getString("MoTaJa")));
				bv.setNgayDang(sdf.format(rs.getDate("NgayDang")));
				bv.setLienKet(DinhDangSQL.DeFomatSQL(rs.getString("LienKet")));
				bv.setLuotXem(rs.getInt("LuotXem"));
				TAIKHOAN tk = new TAIKHOAN();
				tk.setHoTen(DinhDangSQL.DeFomatSQL(rs.getString("HoTen")));
				bv.setTaiKhoan(tk);
				list.add(bv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}
	/*
	 * Dùng cho trang cộng tác viên
	 * Lấy danh sách bài viết tương ứng với tài khoản được phân công
	 * return ArrayList<BAIVIET> or null
	 */
	private int tongtrang = 0;
	public ArrayList<BAIVIET> getListPhanCong(String idTaiKhoan, int page) {
		ArrayList<BAIVIET> list = new ArrayList<BAIVIET>();
		ResultSet rs = null;
		String sql = "select baiviet.IdBaiViet, TenBaiVietVi, TenBaiVietJa, MotaVi, MotaJa, NoiDungVi, NoiDungJa, GhiChu from baiviet "
				+ "inner join lichsu on baiviet.IdBaiViet = lichsu.IdBaiViet "
				+ "where (lichsu.TrangThai = N'ChuyenDich' or lichsu.TrangThai = N'DangDich' or lichsu.TrangThai = N'LoiDich' "
				+ ") and baiviet.CoXoa = 0 and lichsu.IdTaiKhoan = N'"+idTaiKhoan+"'";
		
		//Tạo menu phân trang Url, page, sql
		db.createMenu("Danh-sach-bai-dich?view=all&", page, sql);
		rs = db.getResultSet(sql + " limit " + (page-1)*db.getNBangGhi() +","+ db.getNBangGhi());
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
		id = DinhDangSQL.FomatSQL(id);
		tieude = DinhDangSQL.FomatSQL(tieude);
		mota = DinhDangSQL.FomatSQL(mota);
		noidung = DinhDangSQL.FomatSQL(noidung);
		tinhtrang = DinhDangSQL.FomatSQL(tinhtrang);
		ngonNgu = DinhDangSQL.FomatSQL(ngonNgu);
		idTaiKhoan = DinhDangSQL.FomatSQL(idTaiKhoan);
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
		String sql1 = "update baiviet set ";
		if(tinhtrang.equals("DangBai")){
			sql1 += " TrangThai='DichXong' where IdBaiViet=N'"+id+"'";
		}else if(tinhtrang.equals("HuyDich")){
			sql1 += " TrangThai='HuyDich' where IdBaiViet=N'"+id+"'";
		}else {
			sql1 += " TrangThai='DangDich' where IdBaiViet=N'"+id+"'";
		}
		return db.updateData(sql) & db.updateData(sql1);
	}
	/*
	 * Dùng cho trang cộng tác viên
	 * Lấy danh sách bài dịch được phân công cho cộng tác viên x, với tùy chọn(Bài quá hạn, mới, đang dịch)
	 * return ArrayList<BAIVIET>
	 */
	
	public ArrayList<BAIVIET> getListPhanCong(String idTaiKhoan, String view, int page) {
		// TODO Auto-generated method stub
		ArrayList<BAIVIET> list = new ArrayList<BAIVIET>();
		ResultSet rs = null;
		String sql = "";
		if(view.equals("qua-han")){
			sql = "select baiviet.IdBaiViet, TenBaiVietVi, TenBaiVietJa, MotaVi, MotaJa, NoiDungVi, NoiDungJa, GhiChu from baiviet "
					+ "inner join lichsu on baiviet.IdBaiViet = lichsu.IdBaiViet "
					+ "where (lichsu.TrangThai = N'ChuyenDich' or lichsu.TrangThai = N'DangDich' or lichsu.TrangThai = N'LoiDich'"
					+ ") and baiviet.CoXoa = 0 and CURDATE()-ThoiGian>3  and lichsu.IdTaiKhoan = N'"+idTaiKhoan+"'";
		}else if(view.equals("moi")){
			sql = "select baiviet.IdBaiViet, TenBaiVietVi, TenBaiVietJa, MotaVi, MotaJa, NoiDungVi, NoiDungJa, GhiChu from baiviet "
					+ "inner join lichsu on baiviet.IdBaiViet = lichsu.IdBaiViet "
					+ "where (lichsu.TrangThai = N'ChuyenDich' or lichsu.TrangThai = N'LoiDich'"
					+ ") and baiviet.CoXoa = 0 and lichsu.IdTaiKhoan = N'"+idTaiKhoan+"'";
		}else{
			sql = "select baiviet.IdBaiViet, TenBaiVietVi, TenBaiVietJa, MotaVi, MotaJa, NoiDungVi, NoiDungJa, GhiChu from baiviet "
					+ "inner join lichsu on baiviet.IdBaiViet = lichsu.IdBaiViet "
					+ "where (lichsu.TrangThai = N'DangDich'"
					+ ") and baiviet.CoXoa = 0 and lichsu.IdTaiKhoan = N'"+idTaiKhoan+"'";
		}
		System.out.println("sql: "+sql);
		//Tạo menu phân trang Url, page, sql
		db.createMenu("Danh-sach-bai-dich?view="+view+"&", page, sql);
		
		rs = db.getResultSet(sql + " limit " + (page-1)*db.getNBangGhi() +","+ db.getNBangGhi());
		
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
		return db.updateData("update baiviet set GhiChu=CONCAT(GhiChu, N'"+DinhDangSQL.FomatSQL(bluan)+"') where IdBaiViet=N'"+id+"'");
	}
	/*
	 * Dùng cho trang cộng tác viên
	 * Đếm số lượng bài viết có trong danh sách đươc chọn(Tất cả, Mới chuyển, Dịch Bài, Quá hạn)
	 * return String = count(list)
	 */
	public String getCount(String chon, String taikhoan) {
		// TODO Auto-generated method stub
		chon = DinhDangSQL.FomatSQL(chon);
		taikhoan = DinhDangSQL.FomatSQL(taikhoan);
		String sql = "";
		if(chon.equals("all")){
			sql = "select count(*) as dem from lichsu where (TrangThai = N'ChuyenDich' or TrangThai = N'DangDich' or TrangThai = N'LoiDich') and IdTaiKhoan = N'"+taikhoan+"'";
		}else if(chon.equals("moi")){
			sql = "select count(*) as dem from lichsu where (TrangThai = N'ChuyenDich' or TrangThai = N'LoiDich') and IdTaiKhoan = N'"+taikhoan+"'";
		}else if(chon.equals("dich")){
			sql = "select count(*) as dem from lichsu where (TrangThai = N'DangDich') and IdTaiKhoan = N'"+taikhoan+"'";
		}else{
			sql = "select count(*) as dem from lichsu where (TrangThai = N'ChuyenDich' or TrangThai = N'DangDich' or TrangThai = N'LoiDich') and CURDATE()-ThoiGian>3 and IdTaiKhoan = N'"+taikhoan+"'";
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
		        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
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
	public ArrayList<BAIVIET> getListBaiViet(String id, int page) {
		// TODO Auto-generated method stub
		String sql = "select IdBaiViet, TenBaiVietVi, TenBaiVietJa, LuotXem, NgayDang, TrangThai, Lienket from baiviet where IdTaiKhoan=N'"+id+"'  order by IdBaiViet desc";
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		db.createMenu("Trang-ca-nhan?", page, sql);
		ResultSet rs = db.getResultSet(sql+ " limit " + (page-1)*db.getNBangGhi() +","+ db.getNBangGhi());
		ArrayList<BAIVIET> list = new ArrayList<BAIVIET>();
		try {
			while(rs.next()){
				BAIVIET bv = new BAIVIET();
				bv.setIdBaiViet(DinhDangSQL.DeFomatSQL(rs.getString("IdBaiViet")));
				bv.setTenBaiVietVi(DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietVi")));
				bv.setTenBaiVietJa(DinhDangSQL.DeFomatSQL(rs.getString("TenBaiVietJa")));
				bv.setLuotXem(rs.getInt("LuotXem"));
				bv.setNgayDang(sdf.format(rs.getDate("NgayDang")));
				String trangthai = DinhDangSQL.DeFomatSQL(rs.getString("TrangThai"));
				if(trangthai.equals("OK"))
					bv.setTrangThai("Đã đăng<br>既設");
				else if(trangthai.equals("MoiDang")||trangthai.equals("DangDich")||trangthai.equals("KhongDich"))
					bv.setTrangThai("Đang duyệt<br>バロース");
				else if(trangthai.equals("SoanThao"))
					bv.setTrangThai("Soạn thảo<br>開発中");
				else
					bv.setTrangThai("Bị hủy<br>破壊的");
				bv.setLienKet(DinhDangSQL.DeFomatSQL(rs.getString("Lienket")));
				list.add(bv);
			}
		} catch (SQLException e) {
			System.out.println("Lỗi truy vấn danh sách bài viết");
		}
		return list;
	}
	
	public String getTongTrang() {
		// TODO Auto-generated method stub
		return tongtrang+"";
	}
	
	public String getMenuPhanTrang(){
		return db.getMenuPhanTrang();
	}
	
	public void setMenu(int nBangghi, int ntrang){
		db.setMenu(nBangghi, ntrang);
	}
	
	public boolean CapNhatBaiViet(String id, String tieuDe, String moTa,
			String noiDung, String theLoai, String hinh, String ngonngu,
			String taiKhoan, String tinhTrang) {
		// TODO Auto-generated method stub
		id = DinhDangSQL.FomatSQL(id);
		tieuDe = DinhDangSQL.FomatSQL(tieuDe);
		moTa = DinhDangSQL.FomatSQL(moTa);
		noiDung = DinhDangSQL.FomatSQL(noiDung);
		theLoai = DinhDangSQL.FomatSQL(theLoai);
		hinh = DinhDangSQL.FomatSQL(hinh);
		taiKhoan = DinhDangSQL.FomatSQL(taiKhoan);
		String sql = "";
		if(ngonngu.equals("vi")){
			sql = "update baiviet set TenBaiVietVi=N'"+tieuDe+"', MotaVi=N'"+moTa+"',"
				+ " IdDanhMuc=N'"+theLoai+"', IdTaiKhoan=N'"+taiKhoan+"',"
				+ " NoiDungVi=N'"+noiDung+"', TrangThai=N'"+tinhTrang+"',"
				+ " Lienket=N'"+hinh+"' where IdBaiViet=N'"+id+"'";
		}else{
			sql = "update baiviet set TenBaiVietJa=N'"+tieuDe+"', MotaJa=N'"+moTa+"',"
					+ " IdDanhMuc=N'"+theLoai+"', IdTaiKhoan=N'"+taiKhoan+"',"
					+ " NoiDungJa=N'"+noiDung+"', TrangThai=N'"+tinhTrang+"',"
					+ " Lienket=N'"+hinh+"' where IdBaiViet=N'"+id+"'";
		}
		return db.updateData(sql);
	}
	
	public boolean CapNhatBaiViet(String id, String tieuDeVi, String tieuDeJa,
			String moTaVi, String moTaJa, String noiDungVi, String noiDungJa,
			String theLoai, String hinh, String taiKhoan, String tinhTrang) {
		id = DinhDangSQL.FomatSQL(id);
		tieuDeVi = DinhDangSQL.FomatSQL(tieuDeVi);
		tieuDeJa = DinhDangSQL.FomatSQL(tieuDeJa);
		moTaVi = DinhDangSQL.FomatSQL(moTaVi);
		moTaJa = DinhDangSQL.FomatSQL(moTaJa);
		noiDungVi = DinhDangSQL.FomatSQL(noiDungVi);
		theLoai = DinhDangSQL.FomatSQL(theLoai);
		hinh = DinhDangSQL.FomatSQL(hinh);
		taiKhoan = DinhDangSQL.FomatSQL(taiKhoan);
		// TODO Auto-generated method stub
		String sql = "update baiviet set TenBaiVietVi=N'"+tieuDeVi+"', MotaVi=N'"+moTaVi+"',"
				+ " MotaJa=N'"+moTaJa+"', TenBaiVietJa=N'"+tieuDeJa+"',"
				+ " IdDanhMuc=N'"+theLoai+"', IdTaiKhoan=N'"+taiKhoan+"',"
				+ " NoiDungVi=N'"+noiDungVi+"', NoiDungJa=N'"+noiDungJa+"',"
				+ " Lienket=N'"+hinh+"', TrangThai=N'"+tinhTrang+"' where IdBaiViet=N'"+id+"'";
		return db.updateData(sql);
	}
	
	public boolean XoaBaiViet(String id) {
		// TODO Auto-generated method stub
		String sql = "delete from baiviet where IdBaiViet=N'"+DinhDangSQL.FomatSQL(id)+"'";
		return db.updateData(sql);
	}
	public int TongBaiViet(String tk, String trangthai) {
		// TODO Auto-generated method stub
		ResultSet rs = db.getResultSet("select count(*) from lichsu where IdTaiKhoan='"+tk+"'  and TrangThai like '%"+trangthai+"'");
		try {
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	public int getCountBaiViet(String loai) {
		// TODO Auto-generated method stub
		String sql = "";
		if(loai.equals("moi")){
			sql = "select count(*) from (select * from baiviet where (TrangThai='MoiDang' or TrangThai='KhongDich') and CoXoa = 0)  as tam";
		}else if(loai.equals("xong")){
			sql = "select count(*) from (select * from baiviet where TrangThai='DichXong' and CoXoa = 0) as tam";
		}else {
			sql = "select count(*) from (select * from baiviet where TrangThai='HuyDich' and CoXoa = 0) as tam";
		}
		ResultSet rs = db.getResultSet(sql);
		try {
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			return 0;
		}
		return 0;
	}
	public boolean HuyBaiDich(String id) {
		// TODO Auto-generated method stub
		String sql = "update baiviet set TrangThai='HuyDich' where IdBaiViet='"+id+"'";
		String sql1 = "update lichsu set TrangThai='HuyDich' where IdBaiViet='"+id+"' order by ThoiGian desc limit 1";
		return db.updateData(sql1)&db.updateData(sql);
	}
	public void closeConnection() {
		db.closeConnection();
	}
}
