/**
 * Sign in with google account use ajax Somedayiws Jpvn.net
 */
var googleUser = {};
var startApp = function() {
	gapi
			.load(
					'auth2',
					function() {
						auth2 = gapi.auth2
								.init({
									client_id : '1037503808399-a442sje04o207j31a67ejimq0tqmnnrp.apps.googleusercontent.com',
									cookiepolicy : 'single_host_origin',
								});
						attachSignin(document.getElementById('logingg'));
					});
};

function attachSignin(element) {
	auth2.attachClickHandler(element, {}, function(googleUser) {
		Google_signIn(googleUser);
	}, function(error) {
		alert(JSON.stringify(error, undefined, 2));
	});
}
function Google_signIn(googleUser) {
	var profile = googleUser.getBasicProfile();
	signInCallback(profile);
}
function signInCallback(profile) {
	$.ajax({
		type : 'POST',
		url : 'LoginWithGoogle',
		data : {
			id : profile.getId(),
			name : profile.getName(),
			email : profile.getEmail()
		},
		success : function(responseText) {
			$('#resultAjax').html(responseText);
			uiLogged();
		}
	});
}