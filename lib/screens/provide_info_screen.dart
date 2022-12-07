import 'package:farmgo/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../configs/defined_colors.dart';
import '../providers/app_provider.dart';
import '../static/constants.dart';

class ProvideInfoScreen extends StatelessWidget {
  const ProvideInfoScreen({super.key});
  static final _infoFormKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: AppConstants.toolbarHeightDefault,
        elevation: 0,
        title: Text("Provide Information", style: app.text.h1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FormBuilder(
              key: _infoFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full name",
                    style: app.text.t2.copyWith(color: gotoTextColorDark),
                  ),
                  SizedBox(height: app.space.y4),
                  FormBuilderTextField(
                    name: 'fullname',
                    cursorColor: textColorGrey,
                    textCapitalization: TextCapitalization.sentences,
                    style: app.text.t2,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      filled: true,
                      fillColor: fieldContrastDark,
                      hintText: 'Enter your full name',
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
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.email(),
                      FormBuilderValidators.required()
                    ]),
                  ),
                  SizedBox(height: app.space.y3),
                  Text(
                    "Username",
                    style: app.text.t2.copyWith(color: gotoTextColorDark),
                  ),
                  SizedBox(height: app.space.y4),
                  FormBuilderTextField(
                    obscureText: true,
                    name: 'username',
                    cursorColor: textColorGrey,
                    textCapitalization: TextCapitalization.sentences,
                    style: app.text.t2,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      filled: true,
                      fillColor: fieldContrastDark,
                      hintText: 'Enter your username',
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
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.minLength(6),
                      FormBuilderValidators.required()
                    ]),
                  ),
                  SizedBox(height: app.space.y3),
                  Text(
                    "Contact",
                    style: app.text.t2.copyWith(color: gotoTextColorDark),
                  ),
                  SizedBox(height: app.space.y4),
                  FormBuilderTextField(
                    obscureText: true,
                    name: 'contact',
                    cursorColor: textColorGrey,
                    textCapitalization: TextCapitalization.sentences,
                    style: app.text.t2,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      filled: true,
                      fillColor: fieldContrastDark,
                      hintText: 'Enter your contact',
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
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.minLength(6),
                      FormBuilderValidators.required()
                    ]),
                  ),
                  SizedBox(height: app.space.y2),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: app.space.y1,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const SignupScreen()));
                        },
                        child: const Text("Next")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
