package Utils;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Pattern;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;

import controller.RandomPassword;

public class Utils {
	public static String getResult(String url) {
		try {
			return Request.Get(url).setHeader("Accept-Charset", "utf-8")
					.execute().returnContent().asString();
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static String formatTextToAlphabet(String text){
		String result = "";
		text = text.replace(" ", "");
		for(int i = 0; i < text.length(); i++){
			if(checkSpecialChar(text.charAt(i)+"") ){
				result += text.charAt(i);
			}
		}
		if(result.equals("")) {
			return RandomPassword.password(8);
		}
		return result;
	}
	public static boolean checkSpecialChar(String charTest) {
		Pattern pt = Pattern.compile("(_|[0-9]|[a-z]|[A-Z])");
		return pt.matcher(charTest).matches();
	}
	
	public static boolean checkUsername(String charTest) {
		Pattern pt = Pattern.compile("^(?=[_a-zA-Z]+)[a-zA-Z0-9_]{6,30}$");
		return pt.matcher(charTest).matches();
	}
	
	public static String encryptMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            String hashtext = number.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
