import 'package:farmgo/configs/defined_colors.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:farmgo/screens/provide_info_screen.dart';
import 'package:farmgo/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../blocs/user bloc/bloc/user_bloc.dart';
import '../blocs/user bloc/bloc/user_state.dart';
import '../utils/snackbar_utils.dart';
import '../widgets/login_additionals_tile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AppProvider app;
  late bool isInvestor;
  static final _loginFormKey = GlobalKey<FormBuilderState>();
  @override
  void initState() {
    app = AppProvider.state(context);
    isInvestor = app.isInvestor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoginFailed) {
          SnackbarUtils.displaySnackbar(context, 'error', state.message!);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: AppConstants.toolbarHeightDefault,
          elevation: 0,
          title: Text("Login", style: app.text.h1),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FormBuilder(
                key: _loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login with email",
                      style: app.text.t2.copyWith(color: gotoTextColorDark),
                    ),
                    SizedBox(height: app.space.y4),
                    FormBuilderTextField(
                      name: 'email',
                      cursorColor: textColorGrey,
                      textCapitalization: TextCapitalization.sentences,
                      style: app.text.t2,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 6),
                        filled: true,
                        fillColor: fieldContrastDark,
                        hintText: 'Enter your email',
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
                      "Password",
                      style: app.text.t2.copyWith(color: gotoTextColorDark),
                    ),
                    SizedBox(height: app.space.y4),
                    FormBuilderTextField(
                      obscureText: true,
                      name: 'password',
                      cursorColor: textColorGrey,
                      textCapitalization: TextCapitalization.sentences,
                      style: app.text.t2,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 6),
                        filled: true,
                        fillColor: fieldContrastDark,
                        hintText: 'Enter your password',
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
                    SizedBox(
                      height: app.space.y4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Login as an investor?",
                            style:
                                app.text.t2.copyWith(color: gotoTextColorDark)),
                        StatefulBuilder(builder: (context, setState) {
                          return Checkbox(
                            value: isInvestor,
                            onChanged: (value) {
                              setState(() {
                                isInvestor = value!;
                              });
                            },
                          );
                        }),
                      ],
                    ),
                    SizedBox(height: app.space.y2),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        if (state is UserLoginLoading) {
                          return Center(
                              child: CircularProgressIndicator(
                                  color: gotoTextColorDark));
                        } else {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: app.space.y1,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_loginFormKey.currentState!.validate()) {
                                    BlocProvider.of<UserBloc>(context).add(
                                      UserLogin(
                                          email: _loginFormKey.currentState!
                                              .fields['email']!.value
                                              .toString()
                                              .trim(),
                                          password: _loginFormKey.currentState!
                                              .fields['password']!.value
                                              .toString()
                                              .trim(),
                                          isInvestor: isInvestor),
                                    );
                                  }
                                },
                                child: const Text("Login")),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: app.space.y4),
              Center(
                  child: Text("Or login with",
                      style: app.text.t2.copyWith(color: textColorGrey))),
              SizedBox(height: app.space.y4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  LoginAddTile(
                      imagePath: 'assets/images/facebookLogo.png',
                      text: 'Facebook'),
                  LoginAddTile(
                      imagePath: 'assets/images/googleLogo.png',
                      text: 'Google'),
                ],
              ),
              SizedBox(height: app.space.y1),
              Center(
                  child: Image.asset('assets/images/fingerprint.png',
                      fit: BoxFit.fill)),
              SizedBox(height: app.space.y4),
              Center(
                  child: Text("Or login with fingerprint",
                      style: app.text.t2.copyWith(color: textColorGrey))),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => const ProvideInfoScreen()),
                  );
                },
                child: Center(
                  child: Text("Not Registered? Sign up!",
                      style: app.text.t2.copyWith(color: textColorGrey)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
