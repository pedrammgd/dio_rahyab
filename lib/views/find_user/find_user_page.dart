import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyab_flutter/views/find_user/find_user_view.dart';

import '../../controllers/find_user/find_user_controller.dart';

class FindUserPage extends StatelessWidget {
  const FindUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FindUserController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: FindUserView(),
    );
  }
}
