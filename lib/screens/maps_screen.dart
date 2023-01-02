import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configs/defined_colors.dart';
import '../utils/dummy_data.dart';
import '../widgets/field_card.dart';
import '../widgets/map_data.dart';
import '../widgets/map_tabs.dart';

class MapsScreen extends StatelessWidget {
  MapsScreen({super.key});

  final TextEditingController _fieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(app.radius.lightCurve)),
                ),
                child: Stack(
                  children: [
                    const MapData(),
                    Positioned(
                      top: 10,
                      left: 10,
                      right: 10,
                      child: SizedBox(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 8,
                              child: TextFormField(
                                controller: _fieldController,
                                cursorColor: textColorGrey,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                style: app.text.t2,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 6),
                                  filled: true,
                                  fillColor: fieldContrastDark,
                                  hintText: 'Search fields',
                                  hintStyle: app.text.t2
                                      .copyWith(color: textColorGrey),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: fieldContrastDark),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: app.space.x2),
                            CircleAvatar(
                              backgroundColor: fieldContrastDark,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  CupertinoIcons.search,
                                  color: textColorGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: app.space.y2),
                  Text("Fields", style: app.text.h2),
                  SizedBox(height: app.space.y4),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: app.space.x2,
                      children: List.generate(
                        3,
                        (index) => FieldCard(
                            onPressed: () {}, field: DummyData.fields[index]),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: const MapTabs(),
      ),
    );
  }
}
