import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:fluttertoast/fluttertoast_web.dart';
import 'package:tadrebk/add_training/post.dart';
import 'package:tadrebk/certificate/certificate.dart';
import 'package:tadrebk/contact%20_us/contact_us_screen.dart';
import 'package:tadrebk/favorite_page/favorite_page.dart';
import 'package:tadrebk/home_screen/home_page.dart';
import 'package:tadrebk/my_trainings/paid_trainings.dart';
import 'package:tadrebk/payment_page/payment.dart';
import 'package:tadrebk/profile/cubit.dart';
import 'package:tadrebk/profile/profile.dart';
import 'package:tadrebk/profile/states.dart';
import 'package:tadrebk/shared/cach_helper.dart';
import 'package:tadrebk/shared/constant.dart';
import 'package:tadrebk/sign_up_screen/cubit.dart';
import 'about_us_screen/about_us_screen.dart';
import 'add_training/cubit.dart';
import 'login_screen/cubit.dart';
import 'login_screen/login.dart';
import 'my_trainings/my_trainings.dart';
import 'shared/styles/dark_light.dart';

Future<void> main() async {
  await cachHelper.init();
  FluttertoastWebPlugin();
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'ar']);

  await Firebase.initializeApp(
    options: const FirebaseOptions(

        apiKey: "AIzaSyAei9eaLh9ak_gX4YJEXVgp3W1jiiaiB1M",
        authDomain: "tadrebk-febbd.firebaseapp.com",
        projectId: "tadrebk-febbd",
        storageBucket: "tadrebk-febbd.appspot.com",
        messagingSenderId: "153210364650",
        appId: "1:153210364650:web:1f4fe1cef2c341a0572d93"),
  );

  Widget widget;
  uId = cachHelper.getData(key: 'uId');
  if (uId != null) {
    widget = HomePage();
  } else {
    widget = Login();
  }

  runApp(TadrebkApp(startWidget: widget));
}

class TadrebkApp extends StatefulWidget {
  final Widget startWidget;

  TadrebkApp({required this.startWidget});

  @override
  State<TadrebkApp> createState() => _TadrebkAppState();
}

class _TadrebkAppState extends State<TadrebkApp> {
  @override
  void setState(VoidCallback fn) {
    setState(() {
      // TODO: implement setState
      ProfileCubit.get(context).getUserData();
    });
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => PostCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit()..isDark,
        ),
      ],
      child: LocaleBuilder(
          builder: (local) => BlocBuilder<ProfileCubit, ProfileStatus>(
              builder: (context, state) {
                return MaterialApp(
                  theme: ProfileCubit.get(context).isDark
                      ? Styles.lightTheme(context)
                      : Styles.darkTheme(context),

                  localizationsDelegates: Locales.delegates,
                  supportedLocales: Locales.supportedLocales,
                  locale: local,
                  debugShowCheckedModeBanner: false,

                  // home: widget.startWidget,
                  home: HomePage(),
                );
              })),
    );
  }
}
