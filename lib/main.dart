import 'package:farmgo/cubits/switch/switch_cubit.dart';
import 'package:farmgo/firebase_options.dart';
import 'package:farmgo/global/themes.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:farmgo/screens/home_screen.dart';
import 'package:farmgo/screens/login_screen.dart';
import 'package:farmgo/screens/provide_info_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider( create: (_) => SwitchCubit()),
        ChangeNotifierProvider(create: (_) => AppProvider())
      ],
      child: BlocBuilder<SwitchCubit, SwitchState>(
        builder: (context, state) {
          AppProvider app = AppProvider.state(context);
          app.init();
          return MaterialApp(
            home: const ProvideInfoScreen(),
            theme: state.flag? appThemeData[AppThemes.dark] : appThemeData[AppThemes.light],
          );
        },
      ),
    );
  }
}
