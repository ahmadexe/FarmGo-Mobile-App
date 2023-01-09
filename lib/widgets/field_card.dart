import 'package:cached_network_image/cached_network_image.dart';
import 'package:farmgo/configs/custom_colors.dart';
import 'package:farmgo/configs/defined_colors.dart';
import 'package:farmgo/models/field.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldCard extends StatelessWidget {
  final Field field;
  final VoidCallback onPressed;
  const FieldCard({required this.onPressed, required this.field, super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 175.w,
        height: 190.h,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(app.radius.lightCurve)),
          color: fieldContrastDark,
          border: Border.all(
            color: customPrimaryColorDark,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(app.radius.lightCurve)),
                  child: CachedNetworkImage(
                    imageUrl: field.imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: app.space.x2),
              Expanded(
                child: Text(field.fieldName,
                    style: app.text.t1b,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ),
              Expanded(
                child: Text(field.address,
                    style: app.text.t2.copyWith(color: textColorGrey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
