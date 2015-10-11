package model.dao;

public class AdminDeletePostsDAO {
	
	DataBaseDAO db = new DataBaseDAO();
	/**Delete posts*/
	
	public boolean deletePost(String idPost) {
		String sql_delete_post = "update baiviet set CoXoa = 1 where IdBaiViet = '"+idPost+"'";
		return db.updateData(sql_delete_post);
		
	}
	public void closeConnection() {
		db.closeConnection();
	}

}
