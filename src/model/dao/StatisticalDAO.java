package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.TAIKHOAN;

public class StatisticalDAO {
	DataBaseDAO db = new DataBaseDAO();
	
	
	ListAccountDAO listAccountDao = new ListAccountDAO();
	public ArrayList<String> arrayNumber_Account = new ArrayList<String>();
	
	
	ListCategoryDAO listCategoryDao = new ListCategoryDAO();
	public ArrayList<String> arrayNumber_Category = new ArrayList<String>();
	
	ListPostsDAO listPostDao = new ListPostsDAO();
	public ArrayList<String> arrayNumber_Post = new ArrayList<String>();
	
	
/*************************************************************
* *********************** Thống kê người dùng ****************
* *************************************************************/
	 
	//Đếm số người dùng
	public int countUsers(int type){
		String sql_count;
		int number = 0;
		/*type: 
		 *		1: Đếm tất cả người dùng
		 *		2: Đếm người dùng là user
		 *		3: Đếm người dùng là CTV
		 *		4: Đếm số người dùng bị ban tài khoản
		 * 		5: Đếm số người dùng bị xóa tài khoản 
		 * 		6: Đếm số người dùng có ngôn ngữ là Việt Nam(bao gồm CTV)
		 * 		7: Đếm số người dùng có ngôn ngữ là Nhật Bản(bao gồm CTV)
		 * 		8: Đếm số người cộng tác viên dịch từ tiếng việt sang tiếng nhật
		 * 		9: Đếm số người cộng tác viên dịch từ tiếng nhật sang tiếng việt
		 *   		
		 */
		switch(type){
			case 1: 	sql_count = "SELECT COUNT(IdTaiKhoan) AS Number FROM taikhoan WHERE CoXoa = 0"; break;
			case 2: 	sql_count = "SELECT COUNT(IdTaiKhoan) AS Number FROM taikhoan WHERE QuyenQuanTri = 'user' AND CoXoa = 0";break;
			case 3: 	sql_count = "SELECT COUNT(IdTaiKhoan) AS Number FROM taikhoan WHERE QuyenQuanTri = 'ctv' AND CoXoa = 0";break;
			case 4: 	sql_count =	"SELECT COUNT(IdTaiKhoan) AS Number FROM taikhoan WHERE TinhTrang = 'KhoaTK' AND CoXoa = 0";break;
			case 5:		sql_count = "SELECT COUNT(IdTaiKhoan) AS Number FROM taikhoan WHERE CoXoa = 1";break;
			case 6: 	sql_count = "SELECT COUNT(IdTaiKhoan) AS Number FROM taikhoan WHERE NgonNgu = 'vi' AND CoXoa = 0";break;
			case 7: 	sql_count = "SELECT COUNT(IdTaiKhoan) AS Number FROM taikhoan WHERE NgonNgu = 'ja' AND CoXoa = 0";break;
			case 8: 	sql_count = "SELECT COUNT(IdTaiKhoan) AS Number FROM taikhoan WHERE NgonNgu = 'ja' AND QuyenQuanTri = 'ctv' AND CoXoa = 0";break;
			case 9: 	sql_count = "SELECT COUNT(IdTaiKhoan) AS Number FROM taikhoan WHERE NgonNgu = 'vi' AND QuyenQuanTri = 'ctv' AND CoXoa = 0";break;
			default: 	sql_count = "SELECT COUNT(IdTaiKhoan) AS Number FROM taikhoan"; break;
		}		
		ResultSet result_count = db.getResultSet(sql_count);
		try {
			while (result_count.next()){
				number = result_count.getInt("Number");
			}
			return number;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	//Lấy người dùng
	public TAIKHOAN getUsers(int type,int by, String dayStart, String dayFinish ){
		String sql_get = null;
		TAIKHOAN account = new TAIKHOAN();
		/*type: 
		 * 	  		
		 * 		1: Người dùng đăng nhiều bài viết nhất
		 * 		2: Người dùng đăng ít bài viết nhất
		 * 		
		 * 		
		 * 		3: CTV dịch nhiều bài viết nhất
		 * 		4: CTV dịch ít bài viết nhất
		 * 		
		 * 	
		 * by:
		 * 		1: Thống kê tất cả trong cơ sở dữ liệu
		 * 		2: Thống kê theo ngày, tháng, năm
		 *dayStart: Ngày bắt đầu
		 *dayFinish: Ngày kết thúc	
		 * 
		 * */
									
				if (type == 1) {
					if(by == 2) sql_get = "SELECT  count(IdBaiViet) as idnumber,IdTaiKhoan FROM baiviet where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' AND CoXoa = 0 GROUP BY IdTaiKhoan  ORDER BY idnumber DESC limit 1";
					else sql_get = "SELECT  count(IdBaiViet) as idnumber,IdTaiKhoan FROM baiviet where CoXoa = 0 GROUP BY IdTaiKhoan  ORDER BY idnumber DESC limit 1";
				}
				
				else if (type == 2) {
					if(by == 2) sql_get = "SELECT  count(IdBaiViet) as idnumber,IdTaiKhoan FROM baiviet where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' AND CoXoa = 0 GROUP BY IdTaiKhoan  ORDER BY idnumber ASC limit 1";
					else sql_get = "SELECT  count(IdBaiViet) as idnumber,IdTaiKhoan FROM baiviet where CoXoa = 0 GROUP BY IdTaiKhoan  ORDER BY idnumber ASC limit 1";
				}
				else if (type == 3){
					if(by == 2) sql_get = "select count(IdBaiViet) as idnumber,IdTaiKhoan from lichsu where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' GROUP BY IdTaiKhoan  ORDER BY idnumber DESC limit 1";
					else sql_get = "select count(IdBaiViet) as idnumber,IdTaiKhoan from lichsu GROUP BY IdTaiKhoan  ORDER BY idnumber DESC limit 1";
				}
				else if (type == 4){
					if(by == 2) sql_get = "select count(IdBaiViet) as idnumber,IdTaiKhoan from lichsu where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' GROUP BY IdTaiKhoan  ORDER BY idnumber ASC limit 1";
					else sql_get = "select count(IdBaiViet) as idnumber,IdTaiKhoan from lichsu  GROUP BY IdTaiKhoan  ORDER BY idnumber ASC limit 1";
				}
//				else if (type == 5){
//					if(by == 2) sql_get = "select count(IdBaiViet) as idnumber,IdTaiKhoan from lichsu where TrangThai = 'LoiDich' AND where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"'  GROUP BY IdTaiKhoan  ORDER BY idnumber DESC limit 1 ";
//					else sql_get = "select count(IdBaiViet) as idnumber,IdTaiKhoan from lichsu where TrangThai = 'LoiDich'  GROUP BY IdTaiKhoan  ORDER BY idnumber DESC limit 1";
//				}else if (type == 6){
//					if(by == 2) sql_get = "select count(IdBaiViet) as idnumber,IdTaiKhoan from lichsu where TrangThai = 'HuyDich' AND where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"'  GROUP BY IdTaiKhoan  ORDER BY idnumber DESC limit 1 ";
//					else sql_get = "select count(IdBaiViet) as idnumber,IdTaiKhoan from lichsu where TrangThai = 'HuyDich'  GROUP BY IdTaiKhoan  ORDER BY idnumber DESC limit 1";
//				}
//				else if (type == 7){
//					if(by == 2) sql_get = "select count(IdBaiViet) as idnumber,IdTaiKhoan from lichsu where TrangThai = 'HuyDich' AND where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"'  GROUP BY IdTaiKhoan  ORDER BY idnumber ASC limit 1 ";
//					else sql_get = "select count(IdBaiViet) as idnumber,IdTaiKhoan from lichsu where TrangThai = 'HuyDich'  GROUP BY IdTaiKhoan  ORDER BY idnumber ASC limit 1";
//				}
//				else if(type == 8 ){
//					if(by == 2) sql_get = "select count(IdBaiViet) as idnumber,IdTaiKhoan from lichsu where TrangThai = 'ChuyenBai' AND where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"'  GROUP BY IdTaiKhoan  ORDER BY idnumber DESC limit 1 ";
//					else sql_get = "select count(IdBaiViet) as idnumber,IdTaiKhoan from lichsu where TrangThai = 'ChuyenBai'  GROUP BY IdTaiKhoan  ORDER BY idnumber DESC limit 1";
//				}
				else{
					return null;
				}
				System.out.println("sql: "+sql_get);
				ResultSet result_get = db.getResultSet(sql_get);
				String number;
			try {
				while(result_get.next()){
					
					account = listAccountDao.getAccountbyId(result_get.getString("IdTaiKhoan"));
					number = result_get.getString("idnumber");
					
					arrayNumber_Account.add(number);
					//System.out.println("number: "+result_get.getString("idnumber"));
				}
				System.out.println("arrayNumber_Account: "+arrayNumber_Account);
				return account;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}				
	}
	
	
	/*************************************************************
	* *********************** Thống kê danh mục ****************
	* *************************************************************/
	
	//Đếm số danh mục
	public int countCategorys(int type){
		String sql_count;
		int number = 0;
		/**
		 * type: 
		 * 		1: Đếm tất cả các danh mục trong cơ sở dữ liệu(Không bị xóa)
		 * 		2: Đếm tất cả các danh mục bị xóa trong CSDL		 * 		
		 * */
		
		switch(type){
			case 1: 	sql_count = "SELECT COUNT(IdDanhMuc) AS Number FROM danhmuc WHERE CoXoa = 0"; break;
			case 2: 	sql_count = "SELECT COUNT(IdDanhMuc) AS Number FROM danhmuc WHERE CoXoa = 1";break;			
			default: 	sql_count = "SELECT COUNT(IdDanhMuc) AS Number FROM danhmuc WHERE CoXoa = 0"; break;
		}		
		ResultSet result_count = db.getResultSet(sql_count);
		try {
			while (result_count.next()){
				number = result_count.getInt("Number");
			}
			return number;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	
	}
	
	//Lấy danh mục
	public DANHMUC getCategory(int type, int by, String dayStart, String dayFinish){
		String sql_get = null;
		DANHMUC category = new DANHMUC();
		/*type: 
		 * 	  		
		 * 		1: Danh mục có bài đăng nhiều nhất
		 * 		2: Danh mục có ít bài đăng nhất		 * 	
		 * 		
		 * 	
		 * by:
		 * 		1: Thống kê tất cả trong cơ sở dữ liệu
		 * 		2: Thống kê theo ngày, tháng, năm
		 *dayStart: Ngày bắt đầu
		 *dayFinish: Ngày kết thúc	
		 * 
		 * */
							
			
				if (type == 1) {
					if(by == 2) sql_get = "SELECT  count(IdBaiViet) as idnumber,IdDanhMuc FROM baiviet where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' AND CoXoa = 0 GROUP BY IdDanhMuc  ORDER BY idnumber DESC limit 1";
					else sql_get = "SELECT  count(IdBaiViet) as idnumber,IdDanhMuc FROM baiviet where CoXoa = 0 GROUP BY IdDanhMuc  ORDER BY idnumber DESC limit 1";
				}
				
				else if (type == 2) {
					if(by == 2) sql_get = "SELECT  count(IdBaiViet) as idnumber,IdDanhMuc FROM baiviet where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' AND CoXoa = 0 GROUP BY IdDanhMuc  ORDER BY idnumber ASC limit 1";
					else sql_get = "SELECT  count(IdBaiViet) as idnumber,IdDanhMuc FROM baiviet where CoXoa = 0 GROUP BY IdDanhMuc  ORDER BY idnumber ASC limit 1";
				}				
				else{
					//Mặc định
					if(by == 2) sql_get = "SELECT  count(IdBaiViet) as idnumber,IdDanhMuc FROM baiviet where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' AND CoXoa = 0 GROUP BY IdDanhMuc  ORDER BY idnumber DESC limit 1";
					else sql_get = "SELECT  count(IdBaiViet) as idnumber,IdDanhMuc FROM baiviet where CoXoa = 0 GROUP BY IdDanhMuc  ORDER BY idnumber DESC limit 1";
				}
				System.out.println("sql_category: "+sql_get);
				ResultSet result_get = db.getResultSet(sql_get);
				String number;
			try {
				while(result_get.next()){
					
					category = listCategoryDao.getCategorybyId(result_get.getString("IdDanhMuc"));
					number = result_get.getString("idnumber");
					
					arrayNumber_Category.add(number);
					//System.out.println("number: "+result_get.getString("idnumber"));
				}
				
				return category;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}	
	}
	
	/*************************************************************
	* *********************** Thống kê bài viết ****************
	* *************************************************************/
	
	//Đếm số bài viết
	public int countPosts(int type,int by, String dayStart, String dayFinish){
		String sql_count = null;
		int number = 0;
		/*type: 
		 *		1: Đếm tất cả bài viết
		 *		2: Đếm tất cả bài viết bị xóa
		 *		3: Đếm tất cả bài viết đã đăng lên trang chủ
		 *		4: Đếm tất cả bài viết mới đăng lên
		 * 		5: Đếm tất cả các bài đang dịch
		 * 		6: Đếm tất cả bài viết tiếng việt
		 * 		7: Đếm tất cả bài viết tiếng nhật		 * 		
		 *by:
		 *		1: Tất cả trong cơ sở dữ liệu
		 *		2: Đếm theo ngày
		 *dayStart: Ngày bắt đầu
		 *dayFinish: Ngày kết thúc   		
		 */
		if (type == 1) {
			if(by == 2) sql_count = "SELECT  count(IdBaiViet) as idnumber FROM baiviet where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' AND CoXoa = 0";
			else sql_count = "SELECT  count(IdBaiViet) as idnumber FROM baiviet where CoXoa = 0";
		}
		
		else if (type == 2) {
			if(by == 2) sql_count = "SELECT  count(IdBaiViet) as idnumber FROM baiviet where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' AND CoXoa = 1";
			else sql_count = "SELECT  count(IdBaiViet) as idnumber FROM baiviet where CoXoa = 1";
		}
		else if (type == 3){
			if(by == 2) sql_count = "SELECT  count(IdBaiViet) as idnumber FROM baiviet where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' and CoXoa = 0 and TrangThai = 'OK'";
			else sql_count = "SELECT  count(IdBaiViet) as idnumber FROM baiviet where CoXoa = 0 and TrangThai = 'OK'";
		}
		else if (type == 4){
			if(by == 2) sql_count = "SELECT  count(IdBaiViet) as idnumber FROM baiviet where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' and CoXoa = 0 and TrangThai = 'MoiDang'";
			else sql_count = "SELECT  count(IdBaiViet) as idnumber FROM baiviet where CoXoa = 0 and TrangThai = 'MoiDang'";
		}
		
		else if (type == 5){
			if(by == 2) sql_count = "SELECT  count(IdBaiViet) as idnumber FROM baiviet where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' and CoXoa = 0 and TrangThai = 'DangDich'";
			else sql_count = "SELECT  count(IdBaiViet) as idnumber FROM baiviet where CoXoa = 0 and TrangThai = 'DangDich'";
		}
		else if (type == 6){
			if(by == 2) sql_count = "SELECT  count(IdBaiViet) as idnumber FROM baiviet where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' and CoXoa = 0 and TenBaiVietJa IS  null and NoiDungJa IS  null and MotaJa IS  null";
			else sql_count = "SELECT  count(IdBaiViet) as idnumber FROM baiviet where CoXoa = 0 and TenBaiVietJa IS  null and NoiDungJa IS  null and MotaJa IS  null";
		}
		else if (type == 7){
			if(by == 2) sql_count = "SELECT  count(IdBaiViet) as idnumber FROM baiviet where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' and CoXoa = 0 and TenBaiVietVi IS  null and NoiDungVi IS  null and MotaVi IS  null";
			else sql_count = "SELECT  count(IdBaiViet) as idnumber FROM baiviet where CoXoa = 0 and TenBaiVietVi IS  null and NoiDungVi IS  null and MotaVi IS  null";
		}
		else{
			if(by == 2) sql_count = "SELECT  count(IdBaiViet) as idnumber FROM baiviet where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' AND CoXoa = 0";
			else sql_count = "SELECT  count(IdBaiViet) as idnumber FROM baiviet where CoXoa = 0";
		}
		ResultSet result_count = db.getResultSet(sql_count);
		try {
			while (result_count.next()){
				number = result_count.getInt("idnumber");
			}
			return number;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	//Lấy bài viết
	public BAIVIET getPost(int type, int by, String dayStart, String dayFinish){
		String sql_get = null;
		BAIVIET category = new BAIVIET();
		/*type: 
		 * 	  		
		 * 		1: Bài viết có lượt xem nhiều nhất
		 * 		2: Bài viết có lượt xem ít nhất
		 * 		3: Bài viết có lượt bình luận nhiều nhất
		 * 		 	
		 * 		
		 * 	
		 * by:
		 * 		1: Thống kê tất cả trong cơ sở dữ liệu
		 * 		2: Thống kê theo ngày, tháng, năm
		 *dayStart: Ngày bắt đầu
		 *dayFinish: Ngày kết thúc	
		 * 
		 * */
		if (type == 1) {
			if(by == 2) sql_get = "SELECT  IdBaiViet,LuotXem as idnumber FROM baiviet where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' AND CoXoa = 0 GROUP BY IdBaiViet order by idnumber desc limit 1";
			else sql_get = "SELECT  IdBaiViet,LuotXem as idnumber FROM baiviet where CoXoa = 0 GROUP BY IdBaiViet order by idnumber desc limit 1";
		}
		
		else if (type == 2) {
			if(by == 2) sql_get = "SELECT  IdBaiViet,LuotXem as idnumber FROM baiviet where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' AND CoXoa = 0 GROUP BY IdBaiViet order by idnumber asc limit 1";
			else sql_get = "SELECT  IdBaiViet,LuotXem as idnumber FROM baiviet where CoXoa = 0 GROUP BY IdBaiViet order by idnumber asc limit 1";
		}
		else if (type == 3) {
			if(by == 2) sql_get = "SELECT  count(IdComent) as idnumber,IdBaiViet FROM binhluan where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' AND CoXoa = 0 GROUP BY IdBaiViet order by idnumber desc limit 1";
			else sql_get = "SELECT  count(IdComent) as idnumber,IdBaiViet FROM binhluan where CoXoa = 0 GROUP BY IdBaiViet order by idnumber desc limit 1";
		}
		else{
			if(by == 2) sql_get = "SELECT  IdBaiViet,LuotXem FROM baiviet where NgayDang >= '"+dayStart+"' AND NgayDang <= '"+dayFinish+"' AND CoXoa = 0 GROUP BY IdBaiViet order by LuotXem desc limit 1";
			else sql_get = "SELECT  IdBaiViet,LuotXem FROM baiviet where CoXoa = 0 GROUP BY IdBaiViet order by LuotXem desc limit 1";
		}
		
		System.out.println("sql_post: "+sql_get);
		ResultSet result_get = db.getResultSet(sql_get);
		String number;
	try {
		while(result_get.next()){
			
			category = listPostDao.getPostById(result_get.getString("IdBaiViet"));
			number = result_get.getString("idnumber");
			arrayNumber_Post.add(number);
		}
		return category;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return null;
	}	
	}
	
	
	public static void main(String[] args) {
		StatisticalDAO sta = new StatisticalDAO();
		TAIKHOAN account = sta.getUsers(4, 1, "2015-10-20", "2015-11-20");
		System.out.println("username: "+account.getTenTaiKhoan());
		
	}
	public void closeConnection() {
		db.closeConnection();
	}

}
