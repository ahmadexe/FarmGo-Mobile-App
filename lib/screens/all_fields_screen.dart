import 'package:farmgo/configs/custom_colors.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:farmgo/screens/add_field_screen.dart';
import 'package:farmgo/widgets/field_card.dart';
import 'package:flutter/material.dart';

import '../configs/defined_colors.dart';
import '../models/field.dart';
// import '../utils/dummy_data.dart';

class AllFieldsScreen extends StatelessWidget {
  AllFieldsScreen({super.key});
  final TextEditingController _fieldController = TextEditingController();

  // final List<Field> _fields = DummyData.fields;
  final List<Field> _fields = [];

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: customPrimaryColorDark,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const AddFieldScreen()));
        },
        child: Center(
            child: Icon(
          Icons.add,
          color: fieldContrastDark,
        )),
      ),
      appBar: AppBar(
        title: const Text("Fields"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _fields.isEmpty
                    ? const SizedBox()
                    : TextFormField(
                        controller: _fieldController,
                        cursorColor: textColorGrey,
                        textCapitalization: TextCapitalization.sentences,
                        style: app.text.t2,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 6),
                          filled: true,
                          fillColor: fieldContrastDark,
                          hintText: 'Search fields',
                          hintStyle: app.text.t2.copyWith(color: textColorGrey),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: fieldContrastDark),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                SizedBox(height: app.space.y3),
                _fields.isEmpty
                    ? Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: app.space.y1),
                            Text("Welcome to the fields", style: app.text.h1),
                            SizedBox(height: app.space.y4),
                            Text(
                              "Looks like there are no fields to show right now. No worries, you can add fields right now!",
                              style: app.text.t1.copyWith(color: textColorGrey),
                            ),
                            SizedBox(height: app.space.y4),
                            SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 1 / 3,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const AddFieldScreen(),
                                    ),
                                  );
                                },
                                child: const Text("Add Field"),
                              ),
                            )
                          ],
                        ),
                      )
                    : Wrap(
                        spacing: 20,
                        runSpacing: 10,
                        children: _fields
                            .map((e) => FieldCard(onPressed: () {}, field: e))
                            .toList(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
