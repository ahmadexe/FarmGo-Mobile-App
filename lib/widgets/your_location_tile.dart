import 'package:farmgo/configs/defined_colors.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:farmgo/screens/maps_screen.dart';
import 'package:flutter/material.dart';

class YourLocationTile extends StatelessWidget {
  const YourLocationTile({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => MapsScreen())
        );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          color: greenColorSecondary,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: SizedBox(
                    height: double.infinity,
                    width: 60,
                    child: Image.asset(
                      'assets/images/maps.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: app.space.x2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Your location",
                        style: app.text.h3sb.copyWith(color: fieldContrastDark)),
                    Text(
                      "Hostel City, Lane 10, Street 5",
                      style: app.text.t1.copyWith(color: fieldContrastDark),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
