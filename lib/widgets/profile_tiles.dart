import 'package:farmgo/configs/defined_colors.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTiles extends StatelessWidget {
  const ProfileTiles({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return Row(
      children: [
        ClipRRect(
          borderRadius:
              BorderRadius.all(Radius.circular(app.radius.lightCurve)),
          child: Container(
            color: greenColorSecondary,
            height: 50.h,
            width: 110.w,
            child: Center(
              child: Text("Profile",
                  style: app.text.t1.copyWith(color: buttonTextColorDark)),
            ),
          ),
        ),
        SizedBox(width: app.space.x2),
        ClipRRect(
          borderRadius:
              BorderRadius.all(Radius.circular(app.radius.lightCurve)),
          child: Container(
            color: textColorGrey,
            height: 50.h,
            width: 110.w,
            child: Center(
              child: Text("Edit Profile", style: app.text.t1),
            ),
          ),
        ),
      ],
    );
  }
}
