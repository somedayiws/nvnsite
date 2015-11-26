package model.bo;

public class Validate {
	public static String errorValidate;

	public static boolean check_text(String nameOfText, String text, int maxlength,
			String typeOfText) {
		/** Empty text */
		if ("".equals(text)) {
			errorValidate = "Hãy nhập[入力して下さい]  " + nameOfText;
			return false;
		}
		/** text is lager permit character */
		if (text.length() > maxlength) {			
			errorValidate = nameOfText + " nhỏ hơn[より小さい] " + maxlength
					+ " ký tự[文字].";
			return false;
		}
		/** text is phone number */
		if (typeOfText.contains("phone")) {
			String PhoneNumber = "\\d{9,50}";
			if (!text.matches(PhoneNumber)) {
				errorValidate = "Số điện thoại không hợp lệ - 電話番号は不適です。";
				return false;
			}
		}
		/** text is email */
		if (typeOfText.contains("email")) {
			String Email = "\\w+@\\w+\\.[a-zA-Z.]{1,50}";
			if (!text.matches(Email)) {
				errorValidate = "Email không hợp lệ - メールが不適切です。";
				return false;
			}
		}
//		/**text is user & pass*/
//		if(typeOfText.contains("user")||typeOfText.contains("pass"))
//		{			
//			/*check character special*/
//			String userOrpass = "\\w+";
//			if(!text.matches(userOrpass))
//			{
//				errorValidate = nameOfText+" không hợp lệ[無効]";
//				return false;
//			}
//		}
		return true;
	}

}
