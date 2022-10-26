import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/cubit.dart';
import 'package:weather_app/bloc/states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/styles/styles.dart';
import 'package:weather_app/test.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Weather App', style: TextStyle(color: Colors.white),),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: cubit.getData == null
              ? Center(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xff1f005c),
                    Colors.deepPurple

                  ]
                )
              ),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'There is no weather start',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white
                    ),
                  ),
                  Text(
                    'Searching now',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          )
              : Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  cubit.getData!.getColor()[300]!,
                  cubit.getData!.getColor()[100]!,
                ]
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '${cubit.countryName??''}',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      cubit.cityName?? '',
                      style: TextStyle(
                        fontSize: cubit.countryName == null ? 20: 16,
                        //fontWeight: FontWeight.w500,
                        color: cubit.countryName == null ? Colors.black :Colors.black54
                      ),
                    ),
                  ],
                ),
                Text(
                  'updated at : ${cubit.getData!.date.hour}:${cubit.getData!.date.minute}',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Spacer(flex: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(cubit.getData!.getImage()),
                    Text(
                      '${cubit.getData!.temp.toInt()}°',
                      style: TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        Text(
                          'maxTemp: ${cubit.getData!.maxTemp.toInt()}',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'minTemp: ${cubit.getData!.minTemp.toInt()}',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(flex: 2,),
                Text(
                  cubit.getData!.weatherStateName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Spacer(flex: 5,),
              ],
            ),
          ),
        );
      },
    );
  }
}
