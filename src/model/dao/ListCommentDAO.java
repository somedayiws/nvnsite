package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.BINHLUAN;

public class ListCommentDAO {
	DataBaseDAO db = new DataBaseDAO();
	 ListAccountDAO account = new ListAccountDAO();
	
	/**Get CommentVi by IdBaiViet*/
	public ArrayList<BINHLUAN> getCommentViById(String idPosts){
	ArrayList<BINHLUAN> listcommentVi = new ArrayList<BINHLUAN>();
	
	String sql_select_CommentById_Vi = "SELECT IdComent,IdTaiKhoan,PhanHoiVi,NgayDang FROM binhluan WHERE IdBaiViet = '"+idPosts+"' AND CoXoa = 0";
	ResultSet result_select_CommentViById = db.getResultSet(sql_select_CommentById_Vi);
	String idAccount;
	try {
		while (result_select_CommentViById.next()){
			BINHLUAN comment = new BINHLUAN();
			comment.setIdComent(result_select_CommentViById.getInt("IdComent"));
			
			idAccount = result_select_CommentViById.getString("IdTaiKhoan");			
			comment.setTaiKhoan(account.getAccountbyId(idAccount));
			
			comment.setPhanHoiVi(DinhDangSQL.DeFomatSQL(result_select_CommentViById.getString("PhanHoiVi")));
			comment.setNgayDang(result_select_CommentViById.getString("NgayDang"));
			listcommentVi.add(comment);
			
		}
		return listcommentVi;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return null;
	}
	}
	
	/**Get CommentJa by IdBaiViet*/
	public ArrayList<BINHLUAN> getCommentJaById(String idPosts){
	ArrayList<BINHLUAN> listcommentJa = new ArrayList<BINHLUAN>();
	
	String sql_select_CommentById_Ja = "SELECT IdComent,IdTaiKhoan,PhanHoiJa,NgayDang FROM binhluan WHERE IdBaiViet = '"+idPosts+"' AND CoXoa = 0";
	ResultSet result_select_CommentJaById = db.getResultSet(sql_select_CommentById_Ja);
	String idAccount;
	try {
		while (result_select_CommentJaById.next()){
			BINHLUAN comment = new BINHLUAN();
			comment.setIdComent(result_select_CommentJaById.getInt("IdComent"));
			
			idAccount = result_select_CommentJaById.getString("IdTaiKhoan");			
			comment.setTaiKhoan(account.getAccountbyId(idAccount));
			
			comment.setPhanHoiJa(DinhDangSQL.DeFomatSQL(result_select_CommentJaById.getString("PhanHoiJa")));
			comment.setNgayDang(result_select_CommentJaById.getString("NgayDang"));
			listcommentJa.add(comment);
			
		}
		return listcommentJa;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return null;
	}
	}
	
	//Xóa bình luận
	public boolean deleteComment(String idComment){
		String sql_deleteComment = "DELETE FROM binhluan WHERE IdComent = '"+idComment+"'";
		return db.updateData(sql_deleteComment);
		
	}

	public void closeConnection() {
		db.closeConnection();
	}
}
