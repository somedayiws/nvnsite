package model.bo;

import java.util.ArrayList;

import model.bean.BAIVIET;
import model.dao.ListPostsDAO;

public class ListPostsBO {
	ListPostsDAO listPosts = new ListPostsDAO();
	public  ArrayList<BAIVIET> getPosts(int page, String chon){
		return listPosts.getDataPosts(page, chon);
	}
	public String getMenuPhanTrang(){
		return listPosts.getMenuPhanTrang();
	}
	
	public void setMenu(int nBangghi, int ntrang){
		listPosts.setMenu(nBangghi, ntrang);
	}
	//Lấy các bài viết mới đăng 
		public ArrayList<BAIVIET> getPostsNew(int page){
			return listPosts.getPostsNew(page);
		}
		public void closeConnection() {
			listPosts.closeConnection();
		}
}
