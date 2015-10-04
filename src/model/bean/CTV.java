package model.bean;

import java.util.ArrayList;

public class CTV {
	TAIKHOAN taikhoan;
	ArrayList<ArrayList<BAIVIET>> array_ListPost = new ArrayList<ArrayList<BAIVIET>>();
	int numberPosts;
	public int getNumberPosts() {
		return numberPosts;
	}
	public void setNumberPosts(int numberPosts) {
		this.numberPosts = numberPosts;
	}
	public ArrayList<ArrayList<BAIVIET>> getArray_ListPost() {
		return array_ListPost;
	}
	public void setArray_ListPost(ArrayList<ArrayList<BAIVIET>> array_ListPost) {
		this.array_ListPost = array_ListPost;
	}
	public TAIKHOAN getTaikhoan() {
		return taikhoan;
	}
	public void setTaikhoan(TAIKHOAN taikhoan) {
		this.taikhoan = taikhoan;
	}
	

}
