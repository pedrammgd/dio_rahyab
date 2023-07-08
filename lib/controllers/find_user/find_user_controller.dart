import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rahyab_flutter/models/find_user/find_user_model.dart';

import '../../repositories/find_user/find_user_repository.dart';
import '../../views/user_profile/user_profile_page.dart';

class FindUserController extends GetxController {
  final FindUserRepository _findUserRepository = FindUserRepository();

  RxBool isLoading = false.obs;

  TextEditingController userTextEditingController = TextEditingController();
  Uint8List? uint8List;
  Future<void> getUser() async {
    isLoading(true);

    var resultOrException = await _findUserRepository.getUser(
        userName: userTextEditingController.text);


    resultOrException.fold((left) {


      isLoading(false);
      Get.snackbar('Error', left.message ?? '', backgroundColor: Colors.red);

    }, (FindUserModel r) {


      isLoading(false);
      Get.to(()=>UserProfilePage(findUserModel: r));


    });
  }

    final ImagePicker picker = ImagePicker();
  Future<void> pickImage(ImageSource imageSource) async {
   final result =await picker.pickImage(source: imageSource);

   File imageFile = File(result!.path);

   Uint8List imageRaw = await result.readAsBytes();
   print(base64Encode(imageRaw));

  }
}
