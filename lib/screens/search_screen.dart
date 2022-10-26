import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/cubit.dart';
import 'package:weather_app/bloc/states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  String? cityName;
  String? countryName;
  String? stateName;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Search a City'),
          ),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      cityName = value;
                    },
                    onFieldSubmitted: (value) async {
                      cityName = value;
                      WeatherService service = WeatherService();
                      WeatherModel weather = await service.getWeather(
                          cityName: cityName!, countryName: countryName ?? '');
                      cubit.setData = weather;
                      cubit.cityName = cityName;
                      Navigator.pop(context);
                    },
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: 'Search by City',
                        hintStyle:
                        TextStyle(fontSize: 18, color: Colors.white70),
                        label:const Text(
                          'Search',
                          style: TextStyle(fontSize: 20, color: Colors.white70),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            WeatherService service = WeatherService();
                            WeatherModel weather = await service.getWeather(
                                cityName: cityName!,
                                countryName: countryName ?? '');
                            cubit.setData = weather;
                            cubit.cityName = cityName;
                            Navigator.pop(context);
                          },
                          child:const  Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 28,
                          ),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15, top: 20),
                  child: const Text(
                    'Search by Country',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  ),
                ),
                CSCPicker(
                  showStates: true,
                  showCities: true,
                  flagState: CountryFlag.DISABLE,
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.deepPurple.withOpacity(0.2),
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.deepPurple.withOpacity(0.1),
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                  ///placeholders for dropdown search field
                  countrySearchPlaceholder: "Country",
                  stateSearchPlaceholder: "State",
                  citySearchPlaceholder: "City",
                  ///labels for dropdown
                  countryDropdownLabel: "*Country",
                  stateDropdownLabel: "*State",
                  cityDropdownLabel: "*City",

                  selectedItemStyle: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                  dropdownHeadingStyle:const  TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  dropdownItemStyle: const  TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  searchBarRadius: 10.0,

                  /// select any country
                  onCountryChanged: (value) {
                    countryName = value;
                  },

                  /// select any state
                  onStateChanged: (value) {
                    stateName = value;
                  },

                  /// select any city
                  onCityChanged: (value) {
                    cityName = value;
                  },
                ),
                TextButton(
                  onPressed: () async {
                    WeatherService service = WeatherService();
                    WeatherModel weather = await service.getWeather(
                        cityName: cityName??'', countryName: countryName ?? '');
                    cubit.setData = weather;
                    cubit.cityName = cityName;
                    cubit.countryName = countryName;
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Search",
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
