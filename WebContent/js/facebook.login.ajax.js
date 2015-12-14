/**
 * Loggin with facebook account use ajax somedayiws@gmail.com jpvn.net
 */
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id))
		return;
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
window.fbAsyncInit = function() {
	FB.init({
		appId : '925159020912140',
		cookie : true, // enable cookies to allow the server to access
		// the session
		xfbml : true, // parse social plugins on this page
		version : 'v2.5' // use version 2.3
	});

};

function FBLogin() {
	FB
			.login(
					function(response) {
						if (response.authResponse) {
							$
									.ajax({
										type : "POST",
										data : {
											access_token : response.authResponse.accessToken
										},
										url : 'LoginFacebook',
										success : function(responseText) {
											$('#resultAjax').html(responseText);
											uiLogged();
										}
									});
						} else {
							$('#loiDangNhap')
									.html(
											"<div class='alert alert-danger' role='alert'><p>Bạn chưa cấp quyền cho ứng dụng facebook!.<br></p></div>");
						}
					}, {
						scope : 'public_profile,email'
					});
}