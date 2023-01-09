import 'package:farmgo/configs/defined_colors.dart';
import 'package:flutter/material.dart';

import '../providers/app_provider.dart';

class ChannelTile extends StatelessWidget {
  final String name;
  final String description;
  const ChannelTile({required this.description, required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return Column(
      children: [
        Wrap(
          spacing: app.space.x2,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: greenColorSecondary,
              child: Center(
                child: Text(name.toUpperCase().substring(0, 2),
                    style: app.text.t1.copyWith(color: gotoTextColorLight)),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: app.text.h3sb.copyWith(color: Colors.white)),
                Text(description,
                    style: app.text.t1.copyWith(color: textColorGrey)),
              ],
            ),
          ],
        ),
        SizedBox(height: app.space.y4),
      ],
    );
  }
}
