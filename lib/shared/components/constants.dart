import 'package:flutter/material.dart';

import '../../models/shopapp/login/login_Shop.dart';
import '../network/local/cache_helper.dart';
import 'components.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      NavigateAndFinish(context, LoginShop());
    }
  });
}

 String token ='';
 String uId = '';

