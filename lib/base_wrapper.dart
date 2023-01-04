import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/material.dart';

class BaseWrapper extends StatelessWidget {
  final Widget child;
  const BaseWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
