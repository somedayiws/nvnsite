package model.bo;

import model.bean.DANHMUC;
import model.dao.CreateCategoryDAO;

public class CreateCategoryBO {
	CreateCategoryDAO createCategory = new CreateCategoryDAO();

	/** Check validate data */
	public boolean checkValidate(DANHMUC category, String display) {
		if (category.getTenDanhMucVi() == ""
				|| category.getTenDanhMucJa() == "" || display == null || category.getIcon() == "")
			return false;
		else
			return true;
	}

	
	/**Check exist*/
	public boolean checkExist(DANHMUC category)
	{
		return createCategory.checkCategoryExit(category);
	}
	
	
	/**Get id Account last and auto incerase it*/
	public String id_Category_after_increase()
	{
		String idCategory = null;
		idCategory = createCategory.getId_Ca_last();
		String string_result;
		
		/*if no have any Account in database*/
		if(idCategory == null)
		{
			string_result = "DM01";
		}
		else
		{
			/*Cut two character first*/
			String wordlock = idCategory.substring(0,2);
			/*Get number of id*/
			String strnumber = idCategory.substring(2);
			/*Convert characters final string into number*/
			try
			{
				int number_id = Integer.parseInt(strnumber);
				number_id++;
				if(number_id<10)
				{
					string_result = wordlock+"0"+number_id;				
				}
				else
				{
					string_result = wordlock+number_id;
				}
			}
			catch(NumberFormatException e)
			{
				return null;
			}
		}
		return string_result;
		
	}
	
	/**Insert data*/
	public boolean insertCategory(DANHMUC category)
	{
		return createCategory.insertCategory(category);
	}
	public void closeConnection() {
		createCategory.closeConnection();
	}
}
