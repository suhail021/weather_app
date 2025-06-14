import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google/cubits/weather_cubit.dart/weather_state.dart';
import 'package:google/models/weather_model.dart';
import 'package:google/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {

  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
  WeatherModel? weatherModel;

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
    weatherModel =  await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess());
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
