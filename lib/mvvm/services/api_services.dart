import 'package:flutter/material.dart';
import 'package:illumine/mvvm/Helpers/api_helper.dart';
import 'package:illumine/mvvm/helpers/api_constants.dart';
import 'package:illumine/mvvm/models/Common/response_data_model.dart';

class APIServices {
  Future<dynamic> getUsers(
      {required BuildContext context,
      required bool logInWithCommonLoader}) {
    Uri _uri = Uri.parse(baseURL + ApiConstants.USERS);

    return ApiHelper().getDemoRequest(context, _uri,
        useAuth: false,
        showLoader: logInWithCommonLoader,
        responseName: "Users",
        showLog: true,
        showError: true);
  }

//other API's
}
