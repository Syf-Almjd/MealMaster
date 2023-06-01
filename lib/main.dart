import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mealmaster/Cubits/Observer.dart';
import 'package:mealmaster/Home/MainPage.dart';

import 'Admin/AdminMain.dart';
import 'Cubits/Navigation/navigation_cubit.dart';
import 'Cubits/app_component_cubit.dart';
import 'DB_API/firebase_options.dart';
import 'Slider/IntroSlider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    name: 'mealmaster-9b774',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppComponentCubit>(
          create: (context) => AppComponentCubit(),
        ),
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meal Master',
        routes: {
          '/home': (context) => HomePage(), // Associate '/home' route with HomePage widget
        },
        theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
            primary: HexColor("#eb8c34"),
          ),
        ),
        home: Scaffold(
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (FirebaseAuth.instance.currentUser!.uid ==
                    'qhYDUjuHGFOrmyJZMjMOczJ7xin1') {
                  return const AdminPage();
                }
                return const HomePage();
              } else {
                return const IntroPages();
              }
            },
          ),
        ),
      ),
    );
  }
}
