import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google/cubits/weather_cubit.dart/weather_cubit.dart';
import 'package:google/cubits/weather_cubit.dart/weather_state.dart';
import 'package:provider/provider.dart';
import 'package:google/models/weather_model.dart';
import 'package:google/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search a City')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              BlocProvider.of<WeatherCubit>(
                context,
              ).getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityname = cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 24,
              ),
              label: Text('search'),
              suffixIcon: GestureDetector(
                onTap: () async {
                  // WeatherService service = WeatherService();

                  // WeatherModel? weather = await service.getWeather(
                  //   cityName: cityName!,
                  // );

                  Navigator.pop(context);
                },
                child: Icon(Icons.search),
              ),
              border: OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}
