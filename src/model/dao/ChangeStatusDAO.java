package model.dao;

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
	

}
