package Utils;

import java.io.IOException;

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
}
