import 'package:farmgo/blocs/fields%20bloc/bloc/add_field_state.dart';
import 'package:farmgo/blocs/fields%20bloc/bloc/fields_bloc.dart';
import 'package:farmgo/blocs/user%20bloc/bloc/user_bloc.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../configs/defined_colors.dart';
import '../models/field.dart';
import '../utils/snackbar_utils.dart';

class AddFieldScreen extends StatelessWidget {
  const AddFieldScreen({super.key});

  static final _addFieldKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return BlocListener<FieldsBloc, FieldsState>(
      listener: (context, state) {
        if (state.addFieldState is AddFieldFailed) {
          SnackbarUtils.displaySnackbar(context, 'error',
              'Can not add field right now. Please try later');
        } else if (state.addFieldState is AddFieldSuccess) {
          SnackbarUtils.displaySnackbar(
              context, 'not-error', 'Field has been added successfully!');
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Add a Field"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(app.radius.lightCurve)),
                        child: SizedBox(
                          height: 150.h,
                          width: 150.h,
                          child: Image.asset(
                            'assets/images/fieldsDefault.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          height: 150.h,
                          width: 150.h,
                          color: Colors.black45,
                          child: Center(
                            child: Center(
                              child: Center(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: app.space.y1),
                FormBuilder(
                  key: _addFieldKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name of the field",
                        style: app.text.t2.copyWith(color: gotoTextColorDark),
                      ),
                      SizedBox(height: app.space.y4),
                      FormBuilderTextField(
                        name: 'name',
                        cursorColor: textColorGrey,
                        textCapitalization: TextCapitalization.sentences,
                        style: app.text.t2,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 6),
                          filled: true,
                          fillColor: fieldContrastDark,
                          hintText: 'Enter your name of the field',
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
                          FormBuilderValidators.minLength(4),
                          FormBuilderValidators.required()
                        ]),
                      ),
                      SizedBox(height: app.space.y3),
                      Text(
                        "Enter Latitude",
                        style: app.text.t2.copyWith(color: gotoTextColorDark),
                      ),
                      SizedBox(height: app.space.y4),
                      FormBuilderTextField(
                        name: 'lat',
                        cursorColor: textColorGrey,
                        textCapitalization: TextCapitalization.sentences,
                        style: app.text.t2,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 6),
                          filled: true,
                          fillColor: fieldContrastDark,
                          hintText: 'Latitude',
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
                          FormBuilderValidators.minLength(1),
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.required()
                        ]),
                      ),
                      SizedBox(height: app.space.y3),
                      Text(
                        "Enter Longitude",
                        style: app.text.t2.copyWith(color: gotoTextColorDark),
                      ),
                      SizedBox(height: app.space.y4),
                      FormBuilderTextField(
                        name: 'long',
                        cursorColor: textColorGrey,
                        textCapitalization: TextCapitalization.sentences,
                        style: app.text.t2,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 6),
                          filled: true,
                          fillColor: fieldContrastDark,
                          hintText: 'Longitude',
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
                          FormBuilderValidators.minLength(1),
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.required()
                        ]),
                      ),
                      SizedBox(height: app.space.y3),
                      Text(
                        "Enter address",
                        style: app.text.t2.copyWith(color: gotoTextColorDark),
                      ),
                      SizedBox(height: app.space.y4),
                      FormBuilderTextField(
                        name: 'address',
                        cursorColor: textColorGrey,
                        textCapitalization: TextCapitalization.sentences,
                        style: app.text.t2,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 6),
                          filled: true,
                          fillColor: fieldContrastDark,
                          hintText: 'Enter the address',
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
                          FormBuilderValidators.minLength(8),
                          FormBuilderValidators.required()
                        ]),
                      ),
                      SizedBox(height: app.space.y3),
                      Text(
                        "City",
                        style: app.text.t2.copyWith(color: gotoTextColorDark),
                      ),
                      SizedBox(height: app.space.y4),
                      FormBuilderTextField(
                        name: 'city',
                        cursorColor: textColorGrey,
                        textCapitalization: TextCapitalization.sentences,
                        style: app.text.t2,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 6),
                          filled: true,
                          fillColor: fieldContrastDark,
                          hintText: 'Enter your name of the city',
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
                          FormBuilderValidators.minLength(3),
                          FormBuilderValidators.required()
                        ]),
                      ),
                      SizedBox(height: app.space.y1),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: BlocBuilder<FieldsBloc, FieldsState>(
                          builder: (context, state) {
                            if (state.addFieldState is AddFieldLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ElevatedButton(
                                onPressed: () {
                                  if (_addFieldKey.currentState!.validate()) {
                                    Field field = Field(
                                        fieldName: _addFieldKey
                                            .currentState!.fields['name']!.value
                                            .toString()
                                            .trim(),
                                        latitude: double.parse(_addFieldKey
                                            .currentState!
                                            .fields['lat']!
                                            .value),
                                        longitude: double.parse(_addFieldKey
                                            .currentState!
                                            .fields['long']!
                                            .value),
                                        ownerName:
                                            BlocProvider.of<UserBloc>(context)
                                                .state
                                                .data!
                                                .name,
                                        ownerId: BlocProvider.of<UserBloc>(context)
                                            .state
                                            .data!
                                            .userId,
                                        imgUrl:
                                            "https://media.istockphoto.com/id/1349772438/photo/thoroughbred-horses-grazing-at-sunset-in-a-field.jpg?s=2048x2048&w=is&k=20&c=onjiVOyNmmYEwxlQgKk7m1KDS-B5NcNV4Hgv7mDQKWw=",
                                        address: _addFieldKey.currentState!
                                            .fields['address']!.value
                                            .toString()
                                            .trim(),
                                        city: _addFieldKey.currentState!.fields['city']!.value,
                                        id: DateTime.now().microsecondsSinceEpoch.toString());
                                    BlocProvider.of<FieldsBloc>(context).add(
                                      AddField(field: field),
                                    );
                                  }
                                },
                                child: const Text("Add a field"),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
