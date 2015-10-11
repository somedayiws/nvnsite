package model.bo;

import java.util.ArrayList;

import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.TAIKHOAN;
import model.dao.StatisticalDAO;

public class StatisticalBO {
	StatisticalDAO statisticalDAO = new StatisticalDAO();
/*************************************************************
* *********************** Thống kê người dùng ****************
* *************************************************************/
	public ArrayList<String> arrayNumber_Account = statisticalDAO.arrayNumber_Account;
	public ArrayList<String> arrayNumber_Category = statisticalDAO.arrayNumber_Category;
	public ArrayList<String> arrayNumber_Post = statisticalDAO.arrayNumber_Post;
	//Đếm số người dùng
	public int countUsers(int type){
		return statisticalDAO.countUsers(type);
	}
	//Lấy người dùng
	public TAIKHOAN getUsers(int type,int by, String dayStart, String dayFinish ){
		return statisticalDAO.getUsers(type, by, dayStart, dayFinish);
	}	
	
	//Đếm số danh mục
	public int countCategorys(int type){
		return statisticalDAO.countCategorys(type);
	}
	//Lấy danh mục
	public DANHMUC getCategory(int type, int by, String dayStart, String dayFinish){
		return statisticalDAO.getCategory(type, by, dayStart, dayFinish);
	}
	
	//Đếm số bài viết
	public int countPosts(int type,int by, String dayStart, String dayFinish){
		return statisticalDAO.countPosts(type, by, dayStart, dayFinish);
	}
	
	//Lấy bài viết
	public BAIVIET getPost(int type, int by, String dayStart, String dayFinish){
		return statisticalDAO.getPost(type, by, dayStart, dayFinish);
	}
	public void closeConnection() {
		statisticalDAO.closeConnection();
	}
}
