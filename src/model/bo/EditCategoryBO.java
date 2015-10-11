package model.bo;

import model.bean.DANHMUC;
import model.dao.EditCategoryDAO;

public class EditCategoryBO {

	EditCategoryDAO editCategory = new EditCategoryDAO();
	/** Check validate data */
	public boolean checkValidate(DANHMUC category) {
		if (category.getTenDanhMucVi() == ""
				|| category.getTenDanhMucJa() == "")
			return false;
		else
			return true;
	}
	
	/**Check Exist*/
	public boolean checkExist(DANHMUC category)
	{
		return editCategory.checkCategoryExist(category);
	}
	
	/**Update Category*/
	public boolean updateCategory(DANHMUC category)
	{
		return editCategory.updateCategory(category);
	}
	//Thay đổi hiển thị
	public boolean changeShowed(String idCategory){
		return editCategory.changeShowed(idCategory);
	}
	//Kiểm tra IdDanhMuc tồn tại trong bảng danh mục
		public boolean checkExistID(String idCategory){
			return editCategory.checkExistID(idCategory);
		}
		public void closeConnection() {
			editCategory.closeConnection();
		}
}

