package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySQLConnector {

	String userName = "root";
	String password = "123456";
//	String password = "4Sp0w9gwu8";
	String url = "jdbc:mysql://127.0.0.1:3306/webvietnhat";
//	String url = "jdbc:mysql://mysql27043-WEBVIETNHAT-DEMO.jelastic.skali.net/webvietnhat";
	Connection con = null;
	Statement stm;

	public MySQLConnector() {
		// Khởi tạo
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
			} catch (InstantiationException | IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// tải driver
		try {
			// con = DriverManager.getConnection(url);
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
			stm.executeUpdate(sql);
			return true;
		} catch (SQLException e) {
			System.out.println("Lỗi : " + e.toString());
			return false;
		}
	}

	// public static void main(String[] args) {
	// DataBaseDAO db = new DataBaseDAO();
	// db.updateData("update BAIVIET set MoTaJa=N'これに対し越側主賓である人民軍副総参謀長ヴォー・バン・トゥアン中将は、「日本による世界と地域の平和と安定へのこれまでの貢献と新たな努力について高く評価するとともに、今後一層の日越安全保障・防衛協力の深化を希望する」旨を表明しました。またレセプションに先立ち、同じ会場で防衛大学校など日本の教育機関へ留学経験を有するベトナム人民軍将校による同窓会が開催され、各人の日本留学時代の思い出や現在の職務との関連などを共有し、同窓会の定期的開催や一層の団結を確認しました' where IdTaiKhoan=N'tk001'");
	// }
}
