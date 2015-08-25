package model.bo;

import model.bean.DANHMUC;
import model.dao.ListCategoryDAO;

public class ListCategoryBO {
	ListCategoryDAO listCategory = new ListCategoryDAO();
	public DANHMUC[] getCategory(){
		return listCategory.getCategory();
	}
	public DANHMUC getCategoryById(String IdCategory){
		return listCategory.getCategorybyId(IdCategory);
	}

}
