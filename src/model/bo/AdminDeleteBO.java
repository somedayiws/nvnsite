package model.bo;

import model.dao.AdminDeleteDAO;

public class AdminDeleteBO {

	AdminDeleteDAO adminDelete = new AdminDeleteDAO();
	
	/**Delete Account*/
	public boolean deleteAccount(String username)
	{
		return adminDelete.deleteAccount(username);
	} 
	public void closeConnection() {
		adminDelete.closeConnection();
	}
}
