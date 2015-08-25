package model.bo;

public class ValidateBO {
	
	public boolean check(String text, String regex) {
		//So khớp với định dạng cho trước
		if(text == null) return false;
		else if(!regex.equals("")) return text.matches(regex);
		else return true;
	}

}
