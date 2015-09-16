package model.bo;

public class Pagination {
	int current_page = 1;// Trang hiện tại
	int total_record = 1;// Tổng số record
	int total_page = 1;// Tổng số trang
	int limit = 10;// limit
	int start = 0;
	String link_full = "";// Link có dạng domain/{page}
	String link_first = "";// Link trang đầu tiên

	public Pagination(Pagination page) {
		this.current_page = page.current_page;
		this.total_record = page.total_record;		
		this.limit = page.limit;
		this.start = page.start;
		this.link_full = page.link_full;
		this.link_first = page.link_first;
		
		if(page.limit <0) this.limit = 0;
		this.total_page = this.total_record/this.limit;
		if(this.total_page<=0) this.total_page = 1;
		if(this.current_page < 1) this.current_page = 1;
		if(this.current_page > this.total_page) this.current_page = this.total_page;
		this.start = (this.current_page - 1)*this.limit;
	}
	@SuppressWarnings("unused")
	private String link(int page){
		if(page<1 && this.link_first!=null) return this.link_first;
		return null;
	}

}
