import 'package:farmgo/blocs/news%20bloc/bloc/news_bloc.dart';
import 'package:farmgo/blocs/user%20bloc/bloc/user_bloc.dart';
import 'package:farmgo/blocs/user%20bloc/bloc/user_state.dart';
import 'package:farmgo/cubits/switch/switch_cubit.dart';
import 'package:farmgo/firebase_options.dart';
import 'package:farmgo/global/themes.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:farmgo/utils/mobile_layout_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'base_wrapper.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => SwitchCubit()),
        BlocProvider(create: (_) => NewsBloc()),
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: BlocBuilder<SwitchCubit, SwitchState>(
        builder: (context, switchState) {
          return BlocBuilder<UserBloc, UserState>(
              builder: (context, authState) {
            return ScreenUtilInit(
              designSize: const Size(412, 915),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return BaseWrapper(
                  child: MaterialApp(
                    theme: switchState.flag
                        ? appThemeData[AppThemes.dark]
                        : appThemeData[AppThemes.light],
                    home: child,
                  ),
                );
              },
              child: authState.data == null
                  ? const LoginScreen()
                  : authState.data!.isLoggedIn
                      ? const MobileLayoutUtils()
                      : const LoginScreen(),
            );
          },);
        },
      ),
    );
  }
}
