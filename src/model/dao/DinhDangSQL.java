package model.dao;

public class DinhDangSQL {
	public static String FomatSQL(String sql){
		if(sql != null)
			return sql.replace("\'", "!@$").replace("\\", "!@&");
		else
			return sql;
	}
	public static String DeFomatSQL(String sql){
		if(sql != null)
			return sql.replace("!@$", "\'").replace("!@&", "\\");
		else
			return sql;
	}
	public static void main(String[] args) {
		String xau = "Day la'' \\ chuoi' sql";
		
		xau = FomatSQL(xau);
		System.out.println(xau);
		
		xau = DeFomatSQL(xau);
		System.out.println(xau);
		
	}
}
