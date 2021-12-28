import 'package:flutter/material.dart';
import 'package:illumine/utility/route_generator.dart';
import 'package:provider/provider.dart';

import 'mvvm/view_models/users_module/github_user_view_model.dart';
import 'src/core/config/size_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GithubUsersViewModel()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return const MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: RouteConstants.kSplashScreen,
                onGenerateRoute: RouteGenerator.generateRoute,
              );
            },
          );
        },
      ),
    );
  }
}
