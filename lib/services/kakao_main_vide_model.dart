import 'package:cap_stone_project/services/kakao_social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoMainViewModel {
  late final KakaoSocialLogin _socialLogin;
  bool isLogined = false;
  User? user;

  KakaoMainViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await UserApi.instance.me();
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    isLogined = false;
    user = null;
  }
}
