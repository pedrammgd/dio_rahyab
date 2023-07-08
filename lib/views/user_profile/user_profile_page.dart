import 'package:flutter/material.dart';
import 'package:rahyab_flutter/views/user_profile/user_profile_view.dart';

import '../../models/find_user/find_user_model.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key, required this.findUserModel}) : super(key: key);

  final FindUserModel findUserModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black,
        body: UserProfileView(findUserModel:findUserModel ,));
  }
}
