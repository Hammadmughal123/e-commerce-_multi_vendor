import 'dart:convert';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get_connect.dart';
import 'facebook_user.dart';

class FacebookAuthHelper extends GetConnect {
  /// Handle Facebook SignIn to authenticate user
  Future<FacebookUser> facebookSignInProcess() async {
    final facebookLogin = FacebookLogin();
    final facebookLoginResult = await facebookLogin.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    return fetchUserProfile(facebookLoginResult.accessToken!.token);
  }

  /// Method to fetch loggedIn user profile
  Future<FacebookUser> fetchUserProfile(String token) async {
    final graphResponse = await httpClient.get(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');

    final profile = json.decode(graphResponse.body);

    return FacebookUser.fromMap(profile);
  }

  /// To sign out from the application if the user is signed in through facebook
  void facebookSignOutProcess() async {
    final facebookLogin = FacebookLogin();
    final facebookLoginResult = await facebookLogin.logOut();

    return facebookLoginResult;
  }
}
