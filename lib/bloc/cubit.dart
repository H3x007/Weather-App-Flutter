import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/states.dart';

import '../models/weather_model.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  String? cityName;
  String? countryName;
  WeatherModel? _weatherData;

  set setData(WeatherModel? weather){
    _weatherData = weather;
    emit(SetDataState());
  }

  WeatherModel? get getData => _weatherData;


  // void changeCuntry(value){
  //   countryName = value;
  //   emit(ChangeCountryState());
  // }
}