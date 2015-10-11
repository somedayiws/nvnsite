package model.bo;

import java.util.ArrayList;

import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.TAIKHOAN;
import model.dao.RestoreDataDAO;

public class RestoreDataBO {
	RestoreDataDAO restoredata = new RestoreDataDAO();
	
	/**List Accounts deleted*/
	public ArrayList<TAIKHOAN> listAccountDeleted(String screen) {
		return restoredata.listAccountDeleted(screen);		
	}
	/**List category delete*/
	public ArrayList<DANHMUC> listCategoryDeleted() {
		return restoredata.get_CategoryDeleted();
	}
	/**List posts delete*/
	public ArrayList<BAIVIET> listPostsDeleted() {
		return restoredata.get_PostsDeleted();
	}
	/**Restore*/
	public boolean restore(String nameColumn,String valueId,String nameTable){
		return restoredata.restore(nameColumn, valueId, nameTable);
	}
	
	public void closeConnection() {
		restoredata.closeConnection();
	}
}
