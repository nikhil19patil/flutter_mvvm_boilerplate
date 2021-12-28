import 'package:flutter/material.dart';
import 'package:illumine/mvvm/models/github_user_module/github_user.dart';
import 'package:illumine/mvvm/view_models/users_module/github_user_view_model.dart';
import 'package:illumine/mvvm/views/users_module/user_item.dart';

class GithubUsersScreen extends StatefulWidget {
  const GithubUsersScreen({Key? key}) : super(key: key);

  @override
  _GithubUsersScreenState createState() => _GithubUsersScreenState();
}

class _GithubUsersScreenState extends State<GithubUsersScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late GithubUsersViewModel _githubUsersViewModel;

  @override
  Widget build(BuildContext context) {
    return _loginUI(context);
  }

  @override
  void initState() {
    _githubUsersViewModel = GithubUsersViewModel();
    super.initState();
  }

  Scaffold _loginUI(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("GithubUsers"),
      ),
      body: FutureBuilder<List<GithubUser>?>(
        future: _githubUsersViewModel.getUsers(context: context),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center();
            default:
              List<GithubUser> userData = List.empty();
              if (snapshot.data != null) {
                userData = snapshot.data as List<GithubUser>;
                // LoaderWidget.hideLoader(context);
                return SafeArea(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return GithubUserItem(userData[index]);
                      }),
                );
              } else {
                // LoaderWidget.showLoader(context);
                return const Center();
              }
          }
        },
      ),
    );
  }
}
