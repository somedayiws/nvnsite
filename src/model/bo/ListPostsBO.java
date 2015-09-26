package model.bo;

import java.util.ArrayList;

import model.bean.BAIVIET;
import model.dao.ListPostsDAO;

public class ListPostsBO {
	ListPostsDAO listPosts = new ListPostsDAO();
	public  ArrayList<BAIVIET> getPosts(int page){
		return listPosts.getDataPosts(page);
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

}
