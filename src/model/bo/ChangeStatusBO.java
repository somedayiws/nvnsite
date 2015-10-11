package model.bo;



import java.util.Date;

import model.dao.ChangeStatusDAO;

public class ChangeStatusBO {
	ChangeStatusDAO change = new ChangeStatusDAO();
	
	
	/**Change status history*/
	public void changeStatusHistory(String status,String idPosts,String idAccount){	
		change.changeStatusHistory(status, idPosts,idAccount);
	}
	/**Change status post*/
	public void changeStatusPost(String status,String idPosts,String message){	
		change.changeStatusPost(status, idPosts,message);
	}

	public void updateStatusHistory(String status,String idPosts,String idAccount){
		change.updateStatusHistory(status, idPosts, idAccount);
	}
	
	//Thay đổi trạng thái tài khoản
	public boolean changeStatusAccount(String idAccount, String statusChange){
		return change.changeStatusAccount(idAccount, statusChange);
	}
	
	//Đếm tra các bài viết đã ghim
	public int numberOfPostsBookmark(){
		return change.numberOfPostsBookmark();
	} 
	
	//Thay đổi trạng thái ghim bài viết
	public boolean changeBookmark(String idPost,int status){
		return change.changeBookmark(idPost,status);
	}
	
	//Lấy trường GimTrangChu
		public int getPostBookmarkById(String idPost){
			return change.getPostBookmarkById(idPost);
		}
	//Lấy trường ghi chú của bài viết
		public String getNotePost(String idPost){
			return change.getNotePost(idPost);
		}
		
		public void closeConnection() {
			change.closeConnection();
		}
}
