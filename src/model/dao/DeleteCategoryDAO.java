package model.dao;

public class DeleteCategoryDAO {
	DataBaseDAO db = new DataBaseDAO();
	
	/**Delete category*/
	public boolean deleteCategory(String IdCategory){
		IdCategory = DinhDangSQL.FomatSQL(IdCategory);
		String sql_update_category = "UPDATE danhmuc SET CoXoa='1' WHERE IdDanhMuc='"+IdCategory+"'";
		return db.updateData(sql_update_category);
	}

	public void closeConnection() {
		db.closeConnection();
	}

}
