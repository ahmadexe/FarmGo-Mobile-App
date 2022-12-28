import 'package:farmgo/configs/defined_colors.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part '_gv_tiles.dart';

class GlobalVillageCard extends StatelessWidget {
  const GlobalVillageCard({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(app.radius.lightCurve)),
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width,
        color: greenColorSecondary,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Wrap(
            spacing: app.space.x2,
            children: const [
              _GVTiles(isBot: true),
              _GVTiles(isBot: false),
            ],
          ),
        ),
      ),
    );
  }
}
