import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_demo/firebase_options.dart';
import 'package:firebase_auth_demo/screens/dashboard_screen.dart';
import 'package:firebase_auth_demo/screens/login_email_password_screen.dart';
import 'package:firebase_auth_demo/screens/phone_screen.dart';
import 'package:firebase_auth_demo/screens/signup_email_password_screen.dart';
import 'package:firebase_auth_demo/screens/student_screen.dart';
import 'package:firebase_auth_demo/services/firebase_auth_methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';

import 'screens/admin_screen.dart';
import 'screens/card_type_screen.dart';
import 'screens/normal_user_screen.dart';
import 'screens/teacher_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/temporary_admin_screens/temporary_admin_login_screen.dart';
import 'screens/issuance_screen.dart';
import 'screens/single_issuance_add_student_screen.dart';
import 'screens/download_attendance_screen.dart';
import 'screens/librarian_mode_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (kIsWeb) {
    FacebookAuth.i.webAndDesktopInitialize(
      appId: "1129634001214960", // Replace with your app id
      cookie: true,
      xfbml: true,
      version: "v12.0",
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Firebase Auth Demo',
        // In your MaterialApp theme:
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
          cardTheme: CardTheme(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: const Color(0xFF1D1E33),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: TextStyle(color: Colors.white70),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF1D1E33),
            elevation: 0,
          ),
          colorScheme: ColorScheme.dark(
            primary: Colors.blueAccent,
            secondary: const Color(0xFFEB1555),
            surface: const Color(0xFF1D1E33),
          ),
        ),
        home: const AuthWrapper(),
        // In the routes section of MaterialApp in main.dart
        // In the routes section of MaterialApp in main.dart
        routes: {
          EmailPasswordSignup.routeName: (context) =>
              const EmailPasswordSignup(),
          EmailPasswordLogin.routeName: (context) => const EmailPasswordLogin(),
          PhoneScreen.routeName: (context) => const PhoneScreen(),
          '/dashboard': (context) => const DashboardScreen(),
          '/student': (context) => const StudentScreen(),
          '/teacher': (context) => const TeacherScreen(),
          '/normal-user': (context) => const NormalUserScreen(),
          '/admin': (context) => const AdminScreen(),
          '/welcome': (context) => const WelcomeScreen(),
          '/card-type': (context) => const CardTypeScreen(),
          '/temporary-admin-login': (context) =>
              const TemporaryAdminLoginScreen(),
          '/issuance': (context) => const IssuanceScreen(),
          '/single-issuance-add-student': (context) =>
              const SingleIssuanceAddStudentScreen(),
          '/download-attendance': (context) => const DownloadAttendanceScreen(),
          '/librarian-mode': (context) => const LibrarianModeScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      // You could add logic here to determine which dashboard to show
      // based on user metadata or claims if you want to remember their role
      return const DashboardScreen();
    }
    return const WelcomeScreen(); // Start with the welcome screen
  }
}
