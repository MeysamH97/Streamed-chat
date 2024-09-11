import 'package:chat_by_socket_samle/core/themes/dark_mode.dart';
import 'package:chat_by_socket_samle/core/themes/light_mode.dart';
import 'package:chat_by_socket_samle/core/widgets/auth_gate.dart';
import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/auth_bloc.dart';
import 'package:chat_by_socket_samle/firebase_options.dart';
import 'package:chat_by_socket_samle/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/home/presentation/bloc/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await installProvider();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setup();
  _getUserIdFromPrefs;
  runApp(const MyApp());
}

Future<void> installProvider() async {
  try {
    await GoogleApiAvailability.instance.makeGooglePlayServicesAvailable();
  } on PlatformException catch (e) {
    print('Failed to install provider: ${e.message}');
  }
}

Future<String?> _getUserIdFromPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('userId');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.userId});

  final String? userId;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => locator<AuthBloc>(),
          ),
          BlocProvider<HomeBloc>(
            create: (_) => locator<HomeBloc>(),
          )
        ],
        child: AuthGate(
          userId: userId,
        ),
      ),
    );
  }
}
