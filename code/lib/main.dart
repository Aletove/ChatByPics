import 'package:caa_test/Services/auth/auth_service.dart';
import 'package:caa_test/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:caa_test/pages/login_page.dart';
import 'package:caa_test/pages/home_page.dart';
import 'package:caa_test/pages/register_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  //bool isLogged = FirebaseAuth.instance.currentUser != null;

  runApp(
    ChangeNotifierProvider(create: (context) => AuthService(),
      child: MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Route Implementation',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(onTap: () {  },), // Pagina di login
        '/home': (context) => HomePage(), // Pagina home
        '/register': (context) => RegisterPage(), // Pagina di registrazione
      },
    );
  }
}