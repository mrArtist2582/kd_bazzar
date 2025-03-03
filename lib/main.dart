import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:get/get_core/src/get_main.dart';
import 'package:kd_bazzar/consts/consts.dart';
import 'package:kd_bazzar/views/splash_screens/splash_screen.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KD-BAZZAR',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme:  const AppBarTheme(
          iconTheme: IconThemeData(color: darkFontGrey),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        fontFamily: regular
      ),
      home:  const SplashScreen(),
    );
  }
}
