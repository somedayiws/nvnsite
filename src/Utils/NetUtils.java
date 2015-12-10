package Utils;

import java.io.IOException;
import java.util.regex.Pattern;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;

public class NetUtils {
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
		return result;
	}
	public static boolean checkSpecialChar(String charTest) {
		Pattern pt = Pattern.compile("(_|[0-9]|[a-z]|[A-Z])");
		return pt.matcher(charTest).matches();
	}
}
