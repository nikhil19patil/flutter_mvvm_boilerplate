import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:illumine/mvvm/Helpers/alert_bar.dart';
import 'package:illumine/mvvm/helpers/api_helper.dart';
import 'package:illumine/mvvm/models/Common/response_data_model.dart';
import 'package:illumine/mvvm/models/github_user_module/github_user.dart';
import 'package:illumine/mvvm/services/api_services.dart';

class GithubUsersViewModel extends ChangeNotifier {
  ApiStatus loadingStatus = ApiStatus.idle;

  Future<List<GithubUser>?> getUsers({
    required BuildContext context,
    bool logInWithCommonLoader = false,
  }) async {
    if (!logInWithCommonLoader) {
      loadingStatus = ApiStatus.started;
      notifyListeners();
    }

    dynamic jsonStr = await APIServices().getUsers(
        context: context, logInWithCommonLoader: logInWithCommonLoader);

    List<GithubUser>? users;
    if (jsonStr != null) {
      loadingStatus = ApiStatus.completed;
      users = (json.decode(jsonStr) as List)
          .map((i) => GithubUser.fromJson(i))
          .toList();

      debugPrint("users = $users");
    } else {
      loadingStatus = ApiStatus.failed;
      AlertBar.show(
        context,
        title: "Error",
        description: jsonStr ?? "Something went wrong",
        backgroundColor: Colors.red,
      );
    }

    loadingStatus = ApiStatus.idle;
    notifyListeners();
    return users;
  }
}
