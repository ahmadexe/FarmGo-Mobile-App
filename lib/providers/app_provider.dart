import 'package:farmgo/configs/radius.dart';
import 'package:farmgo/configs/spaces.dart';
import 'package:farmgo/configs/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProvider extends ChangeNotifier {
  static AppProvider state(BuildContext context, [listen = false]) =>
      Provider.of<AppProvider>(context, listen: listen);

  AppText text = AppText();
  AppRadius radius = AppRadius();
  AppSpaces space = AppSpaces();

  init() {
    text.init();
    radius.init();
    space.init();

    notifyListeners();
  }

  bool isInvestor = false;
  setIsInvestor(bool value) {
    isInvestor = value;

    notifyListeners();
  }

  // Map Indices
  int mapTabIndex = 0;
  void setMapTabIndex(int value) {
    mapTabIndex = value;

    notifyListeners();
  }
}
