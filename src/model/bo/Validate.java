package model.bo;

public class Validate {
	public static String errorValidate;

	public static boolean check_text(String nameOfText, String text, int maxlength,
			String typeOfText) {
		/** Empty text */
		if ("".equals(text)) {
			errorValidate = "You must enter into " + nameOfText;
			return false;
		}
		/** text is lager permit character */
		if (text.length() > maxlength) {			
			errorValidate = nameOfText + " not lager " + maxlength
					+ " character";
			return false;
		}
		/** text is phone number */
		if (typeOfText.contains("phone")) {
			String PhoneNumber = "0\\d{9,10}";
			if (!text.matches(PhoneNumber)) {
				errorValidate = "Phone number not is valid";
				return false;
			}
		}
		/** text is email */
		if (typeOfText.contains("email")) {
			String Email = "\\w+@\\w+\\.[a-zA-Z.]{2,5}";
			if (!text.matches(Email)) {
				errorValidate = "Email not is valid";
				return false;
			}
		}
		/**text is user & pass*/
		if(typeOfText.contains("user")||typeOfText.contains("pass"))
		{			
			/*check character special*/
			String userOrpass = "\\w+";
			if(!text.matches(userOrpass))
			{
				errorValidate = nameOfText+" not valid";
				return false;
			}
		}
		return true;
	}

}
