import 'package:farmgo/models/article.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/material.dart';

import '../configs/custom_colors.dart';
import '../configs/defined_colors.dart';

class NewsCard extends StatelessWidget {
  final bool isMain;
  // final Article article;
  const NewsCard({this.isMain = false, super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: isMain ? 300 : 100,
      decoration: BoxDecoration(
          color: isMain ? fieldContrastDark : Colors.transparent,
          border: Border.all(
            color: customPrimaryColorDark,
          ),
          borderRadius:
              BorderRadius.all(Radius.circular(app.radius.lightCurve))),
    
      child: isMain? Container() : 

      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          
        ),
      ),
    );
  }
}
