import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenCard extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final Function onPressed;
  const HomeScreenCard(
      {required this.subTitle,
      required this.image,
      required this.title,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: SizedBox(
              height: 80.h,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/$image',
                fit: BoxFit.fill,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              height: 80.h,
              width: MediaQuery.of(context).size.width,
              color: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "${title[0].toUpperCase()}${title.substring(1).toLowerCase()}",
                        style: app.text.h3sb.copyWith(color: Colors.white)),
                    SizedBox(height: app.space.y4),
                    Text(subTitle,
                        style: app.text.t1.copyWith(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
