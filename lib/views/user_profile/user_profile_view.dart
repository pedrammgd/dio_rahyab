import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../models/find_user/find_user_model.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key, required this.findUserModel});

  final FindUserModel findUserModel;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 50.0,
          backgroundImage: NetworkImage(findUserModel.avatarUrl ?? ''),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          findUserModel.login ?? 'userName',
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _columnWidget(
                title: 'Followers', value: findUserModel.followers.toString()),
            _columnWidget(
                title: 'Following', value: findUserModel.following.toString()),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 1.0,
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        InkWell(
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: const Icon(
                  Icons.html,
                  color: Colors.teal,
                ),
                title: Text(
                  findUserModel.htmlUrl ?? 'html_url',
                  style: const TextStyle(

                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
            ),
            onTap: () {
              ClipboardData(text: findUserModel.htmlUrl ?? 'htmlUrl');
              Get.snackbar('copied', findUserModel.htmlUrl ?? 'htmlUrl');
            }),
        InkWell(
          child: Card(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: const Icon(
                Icons.link,
                color: Colors.teal,
              ),
              title: Text(
                findUserModel.reposUrl ?? 'reposUrl',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          onTap: () async {
            await Clipboard.setData(
                ClipboardData(text: findUserModel.reposUrl ?? 'reposUrl'));
            Get.snackbar('copied', findUserModel.reposUrl ?? 'reposUrl');
          },
        ),
      ],
    );
  }

  Column _columnWidget({required String title, required String value}) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white54,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
          ),
        ),
      ],
    );
  }
}
