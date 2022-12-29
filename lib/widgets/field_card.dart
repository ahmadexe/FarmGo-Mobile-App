import 'package:farmgo/configs/custom_colors.dart';
import 'package:farmgo/configs/defined_colors.dart';
import 'package:farmgo/models/field.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/material.dart';

class FieldCard extends StatelessWidget {
  final Field field;
  const FieldCard({required this.field, super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return Container(
      width: 175,
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(app.radius.lightCurve)),
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
                child: Image.network(
                  field.imgUrl,
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
    );
  }
}
