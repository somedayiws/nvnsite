package Utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import model.bean.TAIKHOAN;

import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;

import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;

public class GoogleAuth {
	private static String googlePlusClientId = "1037503808399-a442sje04o207j31a67ejimq0tqmnnrp.apps.googleusercontent.com";
	private static String appSecret = "tTv5sQDBzWqbrRKTnVCAF4bW";
	private static String callbackURL = "http://jpvn.net/LoginWithGoogle";
	private static String permissionString = "https://www.googleapis.com/auth/userinfo.email,https://www.googleapis.com/auth/userinfo.profile";
	private static String accessURL = "https://accounts.google.com/o/oauth2/token";
	private String accessToken = "";

	public static String getGooglePlusClientId() {
		return googlePlusClientId;
	}

	public static void setGooglePlusClientId(String googlePlusClientId) {
		GoogleAuth.googlePlusClientId = googlePlusClientId;
	}

	public static String getAppSecret() {
		return appSecret;
	}

	public static void setAppSecret(String appSecret) {
		GoogleAuth.appSecret = appSecret;
	}

	public static String getCallbackURL() {
		return callbackURL;
	}

	public static void setCallbackURL(String callbackURL) {
		GoogleAuth.callbackURL = callbackURL;
	}

	public static String getPermissionString() {
		return permissionString;
	}

	public static void setPermissionString(String permissionString) {
		GoogleAuth.permissionString = permissionString;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public static String getAccessURL() {
		return accessURL;
	}

	public static void setAccessURL(String accessURL) {
		GoogleAuth.accessURL = accessURL;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public GoogleAuth() {
	}

	public static String getDialogLink() {
		String permissionArray[];
		permissionArray = permissionString.split(",");
		String permission="";
        for(String p: permissionArray) {
        	try {
        		permission += URLEncoder.encode(p,"UTF-8") + "+";
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
		String authURL = "https://accounts.google.com/o/oauth2/auth?scope="
				+ permission + "&state=profile" + "&redirect_uri="
				+ callbackURL + "&response_type=code" + "&client_id="
				+ googlePlusClientId;
		return authURL;
	}

	static class GoogleAccountToken {
		@SerializedName(value = "access_token")
		String access_token;
		@SerializedName(value = "token_type")
		String token_type;
		@SerializedName(value = "id_token")
		String id_token;
	}

	public static String getAccessToken(List<NameValuePair> nvps) {
		Map<String, String> parameters = new LinkedHashMap<>();
		parameters.put("code", nvps.get(4).getValue());
		parameters.put("client_id", nvps.get(0).getValue());
		parameters.put("client_secret", nvps.get(1).getValue());
		parameters.put("grant_type", "authorization_code");
		parameters.put("redirect_uri", nvps.get(3).getValue());
		try {
			String response = NetworkUtils.doPostRequest(accessURL, parameters);
			Gson gson = new Gson();
			GoogleAccountToken googleAccountToken = gson.fromJson(response,
					GoogleAccountToken.class);
			System.out.println("access token= "
					+ googleAccountToken.access_token);
			return googleAccountToken.access_token;
		} catch (Exception e) {
		}
		return null;
	}

	public static TAIKHOAN getUserInfo(String apiURL)
			throws ClientProtocolException, IOException {
		String result = NetworkUtils.doRequest(apiURL);
		Gson gson = new Gson();
		GooglePlusUser googlePlusUser = gson.fromJson(result,
				GooglePlusUser.class);
		System.out.println("access token= " + googlePlusUser);
		System.out.println("User object: " + googlePlusUser.toString());

		TAIKHOAN taikhoan = new TAIKHOAN();
		taikhoan.setGoogleID(googlePlusUser.getId());
		taikhoan.setEmail(googlePlusUser.getEmail());
		taikhoan.setHoTen(googlePlusUser.getName());
		return taikhoan;
	}
}
