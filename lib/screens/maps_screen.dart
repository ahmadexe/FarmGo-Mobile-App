import 'package:flutter/material.dart';

import '../widgets/map_data.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: MapData(),
      ),
    );
  }
}