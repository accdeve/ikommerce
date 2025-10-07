import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ikommerce/data/cubits/user_cubit/cubit/login_cubit.dart';
import 'package:ikommerce/ui/screen/global/splash_page.dart';
import 'package:ikommerce/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: white, 
    statusBarIconBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
          child: Container(),
        )
      ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false, primaryColor: primary, dividerColor: Colors.transparent),
        initialRoute: SplashPage.routename,
        routes: {
          SplashPage.routename: (BuildContext context) => const SplashPage(),
        },
      ),
    );
  }
}
