package model.bo;

import model.dao.ListCommentDAO;

public class CommentBO {
	ListCommentDAO listCommentDAO = new ListCommentDAO();
	//Xóa bình luận
	public boolean deleteComent(String idComment){
		return listCommentDAO.deleteComment(idComment);
	}
	public void closeConnection() {
		listCommentDAO.closeConnection();
	}
}
