package model.bo;

import model.dao.AdminDeletePostsDAO;

public class AdminDeletePostsBO {
	
	AdminDeletePostsDAO deletepost = new AdminDeletePostsDAO();
	
	/**delete posts*/
	public boolean deletePost(String idPost) {
		return deletepost.deletePost(idPost);		
	}
	public void closeConnection() {
		deletepost.closeConnection();
	}
}
