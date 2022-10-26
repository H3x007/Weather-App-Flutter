import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/cubit.dart';
import 'package:weather_app/bloc/states.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/styles/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){},
        builder: (context, state){
          var cubit = AppCubit.get(context);
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: cubit.getData == null ? defaultColor : cubit.getData!.getColor(),
              inputDecorationTheme: const InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.5, color: Colors.white70),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.5, color: Colors.white70),
                ),
              ),
            ),
            home: HomeScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
