package model.dao;

public class AdminDeletePostsDAO {
	
	MySQLConnector db = new MySQLConnector();
	/**Delete posts*/
	
	public boolean deletePost(String idPost) {
		String sql_delete_post = "update baiviet set CoXoa = 1 where IdBaiViet = '"+idPost+"'";
		return db.updateData(sql_delete_post);
		
	}

}
