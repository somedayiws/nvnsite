package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import model.bean.BAIVIET;
import model.bean.CTV;
import model.bean.TAIKHOAN;

public class CTVDAO {
	
	DataBaseDAO db = new DataBaseDAO();
	ListPostsDAO listPostDao = new ListPostsDAO();
	/**Liệt kê danh sách cộng tác viên:
	 * 		- Thông tin cộng tác viên
	 * 		- Số bài viết đã dịch
	 * 		- Số bài viết đang dịch
	 * 		- Số bài viết đã gởi
	 * 		- Số bài viết dịch bị lỗi
	 * 		- Số bài viết đã hủy
	 * 
	 * 
	 */
	
	//Thông tin cộng tác viên
	public ArrayList<CTV> getListCTV(int page,String typeFind, String stringFind){
		/*type:
		 * 		1: Bài viết đã dịch
		 * 		2: Bài viết đang dịch
		 * 		3: Bài viết đã gởi
		 * 		4: Bài viết bị lỗi
		 * 		5: Bài viết đã hủy
		 * 		6: Bài viết mới nhận
		 * 
		 * */
		String sql_getListCTV;
		System.out.println("type: "+typeFind);
		if(typeFind ==null){
			sql_getListCTV = "select IdTaiKhoan,TenTaiKhoan,HoTen,DiaChi,DienThoai,Email,NgonNgu,TinhTrang from taikhoan where QuyenQuanTri = 'ctv' and CoXoa = 0 ";
		}
		else{
			sql_getListCTV = "select IdTaiKhoan,TenTaiKhoan,HoTen,DiaChi,DienThoai,Email,NgonNgu,TinhTrang from taikhoan where "+typeFind+" LIKE '%"+stringFind+"%' and QuyenQuanTri = 'ctv' and CoXoa = 0 ";
		}
		
		System.out.println("sql_: "+sql_getListCTV);
		
		db.createMenu("CTVServlet?", page, sql_getListCTV);
		
		System.out.println("sql_getListCTV: "+sql_getListCTV + " limit "
				+ (page - 1) * db.getNBangGhi() + ","
				+ db.getNBangGhi());
		
		ResultSet result_getListCTV =  db.getResultSet(sql_getListCTV + " limit "
				+ (page - 1) * db.getNBangGhi() + ","
				+ db.getNBangGhi());
		ArrayList<CTV> listCTV = new ArrayList<CTV>();
		String idCTV;
		try {
			while(result_getListCTV.next()){				
				CTV ctv = new CTV();
				TAIKHOAN account = new TAIKHOAN();
				idCTV = DinhDangSQL.DeFomatSQL(result_getListCTV.getString("IdTaiKhoan"));
				account.setIdTaiKhoan(idCTV);
				account.setTenTaiKhoan(DinhDangSQL.DeFomatSQL(result_getListCTV.getString("TenTaiKhoan")));
				account.setHoTen(DinhDangSQL.DeFomatSQL(result_getListCTV.getString("HoTen")));
				account.setDiaChi(DinhDangSQL.DeFomatSQL(result_getListCTV.getString("DiaChi")));
				account.setDienThoai(DinhDangSQL.DeFomatSQL(result_getListCTV.getString("DienThoai")));
				account.setEmail(DinhDangSQL.DeFomatSQL(result_getListCTV.getString("Email")));							
				account.setNgonNgu(DinhDangSQL.DeFomatSQL(result_getListCTV.getString("NgonNgu")));
				account.setTinhTrang(DinhDangSQL.DeFomatSQL(result_getListCTV.getString("TinhTrang")));
				
				ctv.setTaikhoan(account);
				listCTV.add(ctv);
			}
			for(int i=0;i<listCTV.size();i++){
				ArrayList<ArrayList<BAIVIET>> array_ListPost = new ArrayList<ArrayList<BAIVIET>>();
				for(int j=0;j<=5;j++){
					
					ArrayList<BAIVIET> listPost = getPostTranslatedByCTV(j+1, listCTV.get(i).getTaikhoan().getIdTaiKhoan());
					array_ListPost.add(listPost);
				}
				
				listCTV.get(i).setArray_ListPost(array_ListPost);
				listCTV.get(i).setNumberPosts(countPostOfCTV(listCTV.get(i).getTaikhoan().getIdTaiKhoan()));
			}
			return listCTV;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	//Lấy các thông tin khác liên quan đên cộng tác viên
	public ArrayList<BAIVIET> getPostTranslatedByCTV(int typeGet,String idCTV){
		String sql_get;
		/*type:
		 * 		1: Bài viết đã dịch
		 * 		2: Bài viết đang dịch
		 * 		3: Bài viết đã gởi
		 * 		4: Bài viết bị lỗi
		 * 		5: Bài viết đã hủy
		 * 		6: Bài viết mới nhận
		 * 
		 * */
		ResultSet result_get = null;
		switch (typeGet) {
		case 1:
			sql_get = "select IdBaiViet from lichsu where TrangThai = 'DaDich' and IdTaiKhoan ='"+idCTV+"'";
			break;
		case 2:
			sql_get = "select IdBaiViet from lichsu where TrangThai = 'DangDich' and IdTaiKhoan ='"+idCTV+"'";	
			break;
		case 3:
			sql_get = "select IdBaiViet from lichsu where TrangThai = 'DangBai' and IdTaiKhoan ='"+idCTV+"'";	
			break;
		case 4:
			sql_get = "select IdBaiViet from lichsu where TrangThai = 'LoiDich' and IdTaiKhoan ='"+idCTV+"'";	
			break;
		case 5:
			sql_get = "select IdBaiViet from lichsu where TrangThai = 'HuyDich' and IdTaiKhoan ='"+idCTV+"'";	
			break;
		case 6:
			sql_get = "select IdBaiViet from lichsu where TrangThai = 'ChuyenDich' and IdTaiKhoan ='"+idCTV+"'";	
			break;
		default:
			sql_get = "select IdBaiViet from lichsu where TrangThai = 'DaDich' and IdTaiKhoan ='"+idCTV+"'";
			break;
		}
		System.out.println("sql_get: "+sql_get);
		result_get = db.getResultSet(sql_get);
		ArrayList<BAIVIET> listPostOfCTV = new ArrayList<BAIVIET>();
		
		try {
			while(result_get.next()){
				BAIVIET post = listPostDao.getPostById(result_get.getString("IdBaiViet"));
				System.out.println("post.ID: "+post.getIdBaiViet());
				listPostOfCTV.add(post);
			}
			return listPostOfCTV;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	
	//lấy tổng tất cả các bài viết liên quan đến cộng tác viên
	public int countPostOfCTV(String idCTV){
		String sql_countPostOfCTV = "select count(IdBaiViet) as number from lichsu where IdTaiKhoan = '"+idCTV+"'";
		ResultSet result_countPostOfCTV = db.getResultSet(sql_countPostOfCTV);
		int numberPosts = 0;
		try {
			while(result_countPostOfCTV.next()){
				numberPosts = result_countPostOfCTV.getInt("number");
			}
			return numberPosts;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	public String getMenuPhanTrang() {
		return db.getMenuPhanTrang();
	}

	public void setMenu(int nBangghi, int ntrang) {
		db.setMenu(nBangghi, ntrang);
	}

	public void closeConnection() {
		db.closeConnection();
	}
}
