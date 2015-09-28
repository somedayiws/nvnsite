package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;



public class ChangeStatusDAO {
	DataBaseDAO db = new DataBaseDAO();
	public void changeStatusHistory(String status,String idPosts,String idAccount,Date date){
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		String sql_change_status_history = "insert into lichsu values('"+idPosts+"','"+idAccount+"',N'"+status+"','"+dateFormat.format(date)+"')";		
		db.updateData(sql_change_status_history);
	}
	public void changeStatusPost(String status,String idPosts,String message){
		String sql_change_status_post = "update baiviet set TrangThai = N'"+status+"',GhiChu = '"+message+"' where IdBaiViet ='"+idPosts+"'  and CoXoa=0";		
		db.updateData(sql_change_status_post);
	}
	public void updateStatusHistory(String status,String idPosts,String idAccount){		
		String sql_change_status_history = "update lichsu set TrangThai ='"+status+"' where IdBaiViet='"+idPosts+"' and IdTaiKhoan='"+idAccount+"'";		
		db.updateData(sql_change_status_history);
	}
	//Thay đổi trạng thái tài khoản
	public boolean changeStatusAccount(String idAccount, String statusChange){
		
		String sql_changeStatusAccount = null;
		if(statusChange.equals("KhoaTK")){
			sql_changeStatusAccount = "UPDATE taikhoan SET TinhTrang ='"+statusChange+"', CoXoa=1 WHERE IdTaiKhoan ='"+idAccount+"'";	
		}
		else{
			sql_changeStatusAccount = "UPDATE taikhoan SET TinhTrang ='"+statusChange+"' WHERE IdTaiKhoan ='"+idAccount+"' AND CoXoa = 0";				
		}
		return db.updateData(sql_changeStatusAccount);
	}
	
	//Kiểm tra số lượng bài viết đã ghim
	public int numberOfPostsBookmark(){
		String sql_countNumberOfPostsBookmark = "SELECT COUNT(*) AS NUMBEROFPOSTSBOOKMARK FROM baiviet WHERE GimTrangChu = 1 AND CoXoa = 0";
		int numberOfPosts = 0;
		ResultSet result_countNumberOfPostsBookmark = db.getResultSet(sql_countNumberOfPostsBookmark);
		try {
			while(result_countNumberOfPostsBookmark.next()){
				numberOfPosts = result_countNumberOfPostsBookmark.getInt("NUMBEROFPOSTSBOOKMARK");
			}
			return numberOfPosts;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	//Lấy trường GimTrangChu
	public int getPostBookmarkById(String idPost){
		
		String sql_getPostBookmarkById = "SELECT GimTrangChu FROM baiviet WHERE IdBaiViet ='"+idPost+"' AND CoXoa = 0";
		
		System.out.println("sql_getPostBookmarkById: "+sql_getPostBookmarkById);
		ResultSet result_getPostBookmarkById = db.getResultSet(sql_getPostBookmarkById);
		
		int bookmark = 0 ;
		try {
			while(result_getPostBookmarkById.next()){
				bookmark = result_getPostBookmarkById.getInt("GimTrangChu");				
			}
			return bookmark;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
	}
	
	//Thay đổi trạng thái ghim bài viết
	public boolean changeBookmark(String idPost,int status){
		String sql_changeBookmark = "UPDATE baiviet SET GimTrangChu = NOT '"+status+"' WHERE IdBaiViet = '"+idPost+"'";
		System.out.println("sql_changeBookmark: "+sql_changeBookmark);
		return db.updateData(sql_changeBookmark);
	}
}



