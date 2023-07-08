import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rahyab_flutter/controllers/find_user/find_user_controller.dart';
import 'package:rahyab_flutter/core/constants/constants.dart';
import 'package:rahyab_flutter/shared/widgets/rahyab_button.dart';
import 'package:rahyab_flutter/shared/widgets/rahyab_text_form_field.dart';

import '../../core/constants/form_feild_validation.dart';

class FindUserView extends GetView<FindUserController> {
  FindUserView

  ({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(mainAxisSize: MainAxisSize.max, children: [
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(RahyabImage.githubImage,height: 200),
                                const Text("Find Github User",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 32,
                                ),
                                RahyabTextField(
                                  validator: emptyValidator('userName'),
                                  controller: controller
                                      .userTextEditingController,
                                  labelText:
                                  'userName',
                                  inputType: TextInputType.text,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Obx(() {
                      return RahyabButton(
                        buttonSize: ButtonSize.large,
                        isLoading: controller.isLoading.value,
                        buttonName: 'Find',
                        onTap: () {
                          // if (_formKey.currentState!.validate()) {
                          //   controller.getUser();
                          // } else {
                          //
                          // }
                          controller.pickImage(ImageSource.camera);
                        },
                        bgColor: Colors.white,
                        textColor: Colors.black,
                      );
                    })
                  ]),
                )));
      },
    );
  }
}
