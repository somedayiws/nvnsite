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
//	public static void main(String[] args) {
//		
//		BAIVIET[] posts = getPosts();
//		for (int i = 0; i < posts.length; i++) {	
//			System.out.println(posts[i].getIdBaiViet());
//			System.out.println(posts[i].getDanhMuc().getTenDanhMucVi());
//			System.out.println(posts[i].getTaiKhoan().getHoTen());
//			for(int j=0;j<posts[i].getBinhLuanJa().size();j++){
//				System.out.println("PhanhoiVi: "+posts[i].getBinhLuanJa().get(j).getPhanHoiJa());
//			}
//		}
//	}

}
