import 'package:flutter/cupertino.dart';
import 'package:illumine/mvvm/models/github_user_module/github_user.dart';

class GithubUserItem extends StatelessWidget {
  final GithubUser userData;

  const GithubUserItem(this.userData);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(userData.avatarUrl ?? ''))))),
        Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  userData.login ?? '',
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  userData.url ?? '',
                  softWrap: true,
                )
              ],
            )),
      ],
    );
  }
}
