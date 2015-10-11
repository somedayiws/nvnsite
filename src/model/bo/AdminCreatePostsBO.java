package model.bo;

import model.bean.BAIVIET;
import model.dao.AdminCreatePostsDAO;

public class AdminCreatePostsBO {
	AdminCreatePostsDAO createposts = new AdminCreatePostsDAO();
	
	/**Check validate data*/
		//Check categoryJA va categoryVI
	public boolean checkcategory(String categoryVi,String categoryJa){
		return categoryVi.equals(categoryJa);
	}
	
	/**Get id Posts last and auto incerase it*/
	public String id_Posts_after_increase()
	{
		String idPosts = null;
		idPosts = createposts.getIdpostslast();
		String string_result;
		
		/*if no have any Account in database*/
		if(idPosts == null)
		{
			string_result = "BV01";
		}
		else
		{
			/*Cut two character first*/
			String wordlock = idPosts.substring(0,2);
			/*Get number of id*/
			String strnumber = idPosts.substring(2);
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
	public boolean insertPosts(BAIVIET posts,String idCategory,String idAccount){
		return createposts.insertPosts(posts, idCategory, idAccount);
	}
	public void closeConnection() {
		createposts.closeConnection();
	}
}
