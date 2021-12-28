import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControlledView<T extends ChangeNotifier> extends StatelessWidget {
  const ControlledView({
    Key? key,
    required this.controller,
    required this.builder,
  }) : super(key: key);

  final T controller;
  final Widget Function(T) builder;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => controller,
      child: Consumer<T>(
        builder: (__, controller, ___) => builder(controller),
      ),
    );
  }
}
