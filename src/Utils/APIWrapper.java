package Utils;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;

import model.bean.TAIKHOAN;

import com.google.gson.Gson;

public class APIWrapper {
	private static String appID = "925159020912140";
	private static String appSecret = "f7b232f08084835c3c660fbe082f89f9";
	private static String redirectUrl = "http://jpvn.net/LoginFacebook";
	private String accessToken = "";
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
    
	private Gson gson;

	public APIWrapper() {
		gson = new Gson();
	}

	public static String getDialogLink() {
		String dialogLink = "https://www.facebook.com/dialog/oauth?client_id=%s&redirect_uri=%s&scope=email";
		return String.format(dialogLink, appID, redirectUrl);
	}

	public String getAccessToken(String code) {
		String accessTokenLink = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";
		accessTokenLink = String.format(accessTokenLink, appID, appSecret,
				redirectUrl, code);

		String result = "";
		try {
			result = NetworkUtils.doRequest(accessTokenLink);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(result);
		String token = result.substring(result.indexOf("=") + 1,
				result.indexOf("&"));
		return token;
	}

	public TAIKHOAN getUserInfo() {
		String infoUrl = "https://graph.facebook.com/me?fields=id,name,email,link&access_token=%s";
		infoUrl = String.format(infoUrl, this.accessToken);

		String result = Utils.getResult(infoUrl);

		TAIKHOAN taikhoan = gson.fromJson(result, TAIKHOAN.class);
		return taikhoan;
	}

}
