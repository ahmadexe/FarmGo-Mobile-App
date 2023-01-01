import 'package:farmgo/configs/defined_colors.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/material.dart';

class MapTabs extends StatefulWidget {
  const MapTabs({super.key});

  @override
  State<MapTabs> createState() => _MapTabsState();
}

class _MapTabsState extends State<MapTabs> {
  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return Wrap(
      spacing: 10,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              app.setMapTabIndex(0);
            });
          },
          child: Container(
            height: 35,
            decoration: BoxDecoration(
              color: app.mapTabIndex == 0
                  ? greenColorSecondary
                  : fieldContrastDark,
              borderRadius:
                  BorderRadius.all(Radius.circular(app.radius.heavyCurve)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.directions,
                          color: app.mapTabIndex == 0
                              ? fieldContrastDark
                              : buttonTextColorLight),
                      Text(
                        " Directions",
                        style: app.text.h2.copyWith(
                            color: app.mapTabIndex == 0
                                ? fieldContrastDark
                                : buttonTextColorLight),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              app.setMapTabIndex(1);
            });
          },
          child: Container(
            height: 35,
            decoration: BoxDecoration(
              color: app.mapTabIndex == 1
                  ? greenColorSecondary
                  : fieldContrastDark,
              borderRadius:
                  BorderRadius.all(Radius.circular(app.radius.heavyCurve)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.call,
                          color: app.mapTabIndex == 1
                              ? fieldContrastDark
                              : buttonTextColorLight),
                      Text(
                        " Call",
                        style: app.text.h2.copyWith(
                            color: app.mapTabIndex == 1
                                ? fieldContrastDark
                                : buttonTextColorLight),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              app.setMapTabIndex(2);
            });
          },
          child: Container(
            height: 35,
            decoration: BoxDecoration(
              color: app.mapTabIndex == 2
                  ? greenColorSecondary
                  : fieldContrastDark,
              borderRadius:
                  BorderRadius.all(Radius.circular(app.radius.heavyCurve)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.person,
                          color: app.mapTabIndex == 2
                              ? fieldContrastDark
                              : buttonTextColorLight),
                      Text(
                        " Owner",
                        style: app.text.h2.copyWith(
                            color: app.mapTabIndex == 2
                                ? fieldContrastDark
                                : buttonTextColorLight),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              app.setMapTabIndex(3);
            });
          },
          child: Container(
            height: 35,
            decoration: BoxDecoration(
              color: app.mapTabIndex == 3
                  ? greenColorSecondary
                  : fieldContrastDark,
              borderRadius:
                  BorderRadius.all(Radius.circular(app.radius.heavyCurve)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.list,
                          color: app.mapTabIndex == 3
                              ? fieldContrastDark
                              : buttonTextColorLight),
                      Text(
                        " Details",
                        style: app.text.h2.copyWith(
                            color: app.mapTabIndex == 3
                                ? fieldContrastDark
                                : buttonTextColorLight),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
