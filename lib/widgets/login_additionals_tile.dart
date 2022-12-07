import 'package:farmgo/configs/defined_colors.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/material.dart';

class LoginAddTile extends StatelessWidget {
  final String imagePath;
  final String text;
  const LoginAddTile({required this.imagePath,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.42,
        height: 50,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 30, width: 30,child: Image.asset(imagePath, fit: BoxFit.fitHeight,)),
              Text(text, style: app.text.t2.copyWith(color: gotoTextColorLight)),
            ],
          ),
        ),
      ),
    );
  }
}