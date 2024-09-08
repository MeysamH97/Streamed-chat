import 'package:chat_by_socket_samle/core/themes/dark_mode.dart';
import 'package:chat_by_socket_samle/core/widgets/auth_gate.dart';
import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/auth_bloc.dart';
import 'package:chat_by_socket_samle/firebase_options.dart';
import 'package:chat_by_socket_samle/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_api_availability/google_api_availability.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await installProvider();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setup();
  runApp(const MyApp());
}

Future<void> installProvider() async {
  try {
    await GoogleApiAvailability.instance.makeGooglePlayServicesAvailable();
    print('ProviderInstaller installed successfully');
  } on PlatformException catch (e) {
    print('Failed to install provider: ${e.message}');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkMode,
      home: BlocProvider(
        create: (_) => locator<AuthBloc>(),
        child: AuthGate(),
      ),
    );
  }
}
