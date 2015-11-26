package model.dao;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataBaseDAO {

	Connection con;
	Statement stm;
//	String userName = "jpvnnetl_siwsapp"; 
//	String password = "Zxcvbnm1233";
//	String url = "jdbc:mysql://localhost:3306/jpvnnetl_webvietnhat?useUnicode=true&characterEncoding=utf-8";
	
//	String userName = "somedayiws";
//    String password = "zxcvbnm1233";
//    String url = "jdbc:mysql://127.0.0.1:3306/jpvnnetl_webvietnhat?useUnicode=true&characterEncoding=utf-8";
//	
//    String userName = "adminVgrgS7w";
//	String password = "vQfYcj1EjDG_";
//	String url = "jdbc:mysql://127.11.82.130:3306/vietnhat?useUnicode=true&characterEncoding=utf-8";
    
	String userName = "root";
	String password = "123456";
    String url = "jdbc:mysql://127.0.0.1:3306/jpvnnetl_webvietnhat";
	// Biến dùng cho menu
	//Comment
	private String menuPhanTrang = "";
	private int nBangGhi = 5;
	private int nTrang = 10;

	// Lấy số bảng ghi hiển thị trên 1 trang
	public int getNBangGhi() {
		return nBangGhi;
	}

	// Lấy html menu để hiển thị
	public String getMenuPhanTrang() {
		return menuPhanTrang;
	}

	// Cài đặt cấu hình cho trang hiển thị bao nhiêu bản ghi trên 1 trang, có
	// bao nhiêu menu trong 1 day
	public void setMenu(int nBangghi, int ntrang) {
		this.nBangGhi = nBangghi;
		this.nTrang = ntrang;
	}

	// Tạo chuổi String menu
	public void createMenu(String url, int page, String sql) {

		ResultSet rs = getResultSet("select count(*) as dem from (" + sql
				+ ") as tam");
		// Số bảng ghi hiện có
		int tongBangGhi = 0;
		try {
			if (rs.next()) {
				tongBangGhi = rs.getInt(1);
			}
		} catch (SQLException e) {
			tongBangGhi = 0;
		}
		System.out.println("Số bảng ghi : " + tongBangGhi);
		// Tổng số trang trên menu
		int tongTrang = (tongBangGhi % nBangGhi == 0) ? (tongBangGhi / nBangGhi)
				: (tongBangGhi / nBangGhi + 1);
		System.out.println("Tổng số trang : " + tongTrang);
		// Chi số đầu dãy trang cần đến
		int chiso = page / nTrang;
		System.out.println("Chi số : " + chiso);
		// Tạo menu
		menuPhanTrang = "<ul class='pagination  pagination-sm' id='menupt'>";
		if (page == 1)
			menuPhanTrang += "<li class='disabled'><a>&laquo;</a></li>";
		else
			menuPhanTrang += "<li><a href='" + url + "page=" + (page - 1)
					+ "'>&laquo;</a></li>";
		if (chiso * nTrang == page)
			chiso--;
		if (chiso != 0)
			menuPhanTrang += "<li><a href='"
					+ url
					+ "page="
					+ ((chiso - 1) * nTrang + 1)
					+ "' onclick='loadMenu('giam');' >... <span class='sr-only'>(current)</span></a></li>";
		for (int j = chiso * nTrang + 1; j <= tongTrang
				&& j <= (chiso + 1) * nTrang; j++) {
			System.out.println("menu " + j);
			if (j != page)
				menuPhanTrang += "<li><a href='" + url + "page=" + j
						+ "' onclick='chuyen(" + j + ");'>" + j
						+ "<span class='sr-only'>(current)</span></a></li>";
			else
				menuPhanTrang += "<li class='active'><a onclick='chuyen(" + j
						+ ");'>" + j
						+ "<span class='sr-only'>(current)</span></a></li>";
		}
		if ((chiso + 1) * nTrang < tongTrang)
			menuPhanTrang += "<li><a href='"
					+ url
					+ "page="
					+ ((chiso + 1) * nTrang + 1)
					+ "' onclick='loadMenu('tang');' >... <span class='sr-only'>(current)</span></a></li>";
		if (page == tongTrang)
			menuPhanTrang += "<li class='disabled'><a>&raquo;</a></li>";
		else
			menuPhanTrang += "<li><a href='" + url + "page=" + (page + 1)
					+ "'>&raquo;</a></li>";
		menuPhanTrang += "</ul>";
	}

	public DataBaseDAO() {
		// Khởi tạo
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// tải driver
		try {
			con = DriverManager.getConnection(url, userName, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			stm = con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		return con;
	}

	public void closeConnection() {
		try {
			stm.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Statement getStatement() {
		return stm;
	}

	public ResultSet getResultSet(String sql) {
		try {
			return stm.executeQuery(sql);
		} catch (SQLException e) {
			System.out.println("Lỗi truy vấn");
			return null;
		}
	}

	public boolean updateData(String sql) {
		try {
			System.out.println("SQL command : " + sql);
			stm.executeUpdate(sql);
			return true;
		} catch (SQLException e) {
			System.out.println("Lỗi : " + e.toString());
			return false;
		}
	}
	
	public static String toUTF8(String isoString){
		String utf8String = null;
		try {
			if (isoString != null){
				byte[] stringByteISO = isoString.getBytes("ISO-8859-1");
				utf8String = new String(stringByteISO, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			System.err.println("Không mã hóa được Biểu tượng cảm xúc frown");
			utf8String = isoString;
		}
		return utf8String;
	}
	public static String toISO(String utf8String){
		String isoString = null;
		try {
			if (utf8String != null){
				byte[] stringByteISO = utf8String.getBytes("UTF-8");
				isoString = new String(stringByteISO, "ISO-8859-14");
			}
		} catch (UnsupportedEncodingException e) {
			System.err.println("Không mã hóa được Biểu tượng cảm xúc frown");
			isoString = utf8String;
		}
		return isoString;
	}
}
