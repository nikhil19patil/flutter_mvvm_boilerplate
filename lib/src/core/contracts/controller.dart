import 'package:flutter/foundation.dart';

abstract class BaseController extends ChangeNotifier {
  void _refresh() => notifyListeners();
}
