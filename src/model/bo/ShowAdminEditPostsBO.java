package model.bo;

import model.bean.BAIVIET;
import model.dao.ShowAdminEditPostsDAO;

public class ShowAdminEditPostsBO {
	
	ShowAdminEditPostsDAO editPosts = new ShowAdminEditPostsDAO();
	
	/**Check post exist*/
	public boolean checkExist_Post(String idPost){
		return editPosts.checkExist_Post(idPost);
	}
	/**Get post by idPost*/
	public BAIVIET post(String idPost){
		return editPosts.getPostsById(idPost);
	}

	public void closeConnection() {
		editPosts.closeConnection();
	}
}
