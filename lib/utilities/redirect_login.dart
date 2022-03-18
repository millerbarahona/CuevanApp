import 'package:cuevan_app/models/user_model.dart';
import 'package:cuevan_app/utilities/post_users.dart';

class RedirectLogin {

  static redirectFromLogin(String? uid) async {
    User user = await PostUser.getUserUid(uid!);

    if(user.rol == 'admin') {
      return 'admin_home';
    } else if(user.rol == 'user') {
      return 'home_page';
    }
  }
}