package model.bo;



import java.util.Date;

import model.dao.ChangeStatusDAO;

public class ChangeStatusBO {
	ChangeStatusDAO change = new ChangeStatusDAO();
	
	
	/**Change status history*/
	public void changeStatusHistory(String status,String idPosts,String idAccount,Date date){	
		change.changeStatusHistory(status, idPosts,idAccount,date);
	}
	/**Change status post*/
	public void changeStatusPost(String status,String idPosts,String message){	
		change.changeStatusPost(status, idPosts,message);
	}

	public void updateStatusHistory(String status,String idPosts,String idAccount){
		change.updateStatusHistory(status, idPosts, idAccount);
	}
}
