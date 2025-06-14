import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google/cubits/weather_cubit.dart/weather_state.dart';
import 'package:google/models/weather_model.dart';
import 'package:google/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityname;

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      WeatherModel weatherModel = await weatherService.getWeather(
        cityName: cityName,
      );
      emit(WeatherSuccess(weatherModel: weatherModel));
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
