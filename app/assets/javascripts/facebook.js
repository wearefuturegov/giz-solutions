// window.fbAsyncInit = function() {
//   FB.init({
//     appId      : _FACEBOOK_ID,
//     xfbml      : true,
//     autoLogAppEvents : true,
//     version    : 'v2.10'
//   });
//   FB.AppEvents.logPageView();
// };

(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.12&appId=' + _FACEBOOK_ID;
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
