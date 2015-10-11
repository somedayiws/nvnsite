package model.bo;

import model.dao.DeleteCategoryDAO;

public class DeleteCategoryBO {
	DeleteCategoryDAO delCategory = new DeleteCategoryDAO();
	public boolean deleteCategory(String IdCategory){
		return delCategory.deleteCategory(IdCategory);
	} 
	public void closeConnection() {
		delCategory.closeConnection();
	}
}
