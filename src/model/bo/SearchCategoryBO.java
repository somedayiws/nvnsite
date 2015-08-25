package model.bo;

import model.bean.DANHMUC;
import model.dao.SearchCategoryDAO;

public class SearchCategoryBO {
	SearchCategoryDAO searchCategory = new SearchCategoryDAO();

	public DANHMUC[] selectCategory(String typeFind, String stringFind) {
		// TODO Auto-generated method stub
		return searchCategory.searchCategory(typeFind, stringFind);
	}

}
