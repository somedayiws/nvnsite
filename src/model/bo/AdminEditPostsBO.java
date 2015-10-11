package model.bo;

import model.bean.BAIVIET;
import model.dao.AdminEditPostsDAO;

public class AdminEditPostsBO {

	AdminEditPostsDAO adminEditPost = new AdminEditPostsDAO();
		/**update post in database*/
	public boolean updatePost(BAIVIET post, String idCategory, String idAccount) {
		return adminEditPost.updatePost(post, idCategory, idAccount);
	}
	/*
	 * 
	 * Update post in database when admin translated post
	 * 
	 * */
	public boolean updatePost_Translated(BAIVIET post){
		return adminEditPost.updatePost_Translated(post);
	}
	public void closeConnection() {
		adminEditPost.closeConnection();
	}
}
