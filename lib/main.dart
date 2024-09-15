import 'package:chat_by_socket_samle/core/themes/theme_provider.dart';
import 'package:chat_by_socket_samle/core/widgets/auth_gate.dart';
import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/auth_bloc.dart';
import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/login_cubit.dart';
import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/signUp_cubit.dart';
import 'package:chat_by_socket_samle/firebase_options.dart';
import 'package:chat_by_socket_samle/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/home/presentation/bloc/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await installProvider();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setup();
  _getUserIdFromPrefs;
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.userId});

  final String? userId;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<SignUpCubit>(
            create: (context) => locator<SignUpCubit>(),
          ),
          BlocProvider<LoginCubit>(
            create: (context) => locator<LoginCubit>(),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => locator<AuthBloc>(),
          ),
          BlocProvider<HomeBloc>(
            create: (context) => locator<HomeBloc>(),
          )
        ],
        child: AuthGate(
          userId: userId,
        ),
      ),
    );
  }
}

Future<void> installProvider() async {
  try {
    await GoogleApiAvailability.instance.makeGooglePlayServicesAvailable();
  } on PlatformException catch (e) {
    throw Exception('Failed to make Google Play Services available: $e');
  }
}

Future<String?> _getUserIdFromPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('userId');
}
