package model.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;


public class LienHeDAO {

	DataBaseDAO db = new DataBaseDAO();

	public void closeConnection() {
		db.closeConnection();
	}

	public void addLienHe(String taikhoan, String hoten, String dienthoai,
			String email, String tieude, String noidung) {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		taikhoan = DinhDangSQL.FomatSQL(taikhoan);
		if(taikhoan==null) taikhoan = "";
		hoten = DinhDangSQL.FomatSQL(hoten);
		dienthoai = DinhDangSQL.FomatSQL(dienthoai);
		if(dienthoai==null) dienthoai = "";
		email = DinhDangSQL.FomatSQL(email);
		tieude = DinhDangSQL.FomatSQL(tieude);
		String sql = "insert into lienhe(taikhoan, email, sodienthoai, tennguoigui, noidung, ngaygui, tieude, dadoc)"
						+ " values (N'"+taikhoan+"', N'"+email+"',N'"+dienthoai+"',"
						+ " N'"+hoten+"', N'"+noidung+"','"+sdf.format(cal.getTime())+"',N'"+tieude+"',"
						+ "'0')";
		db.updateData(sql);		
	}
}
