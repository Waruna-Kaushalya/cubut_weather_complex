import 'package:flutter/material.dart';
import 'package:bloc_weather/features/weather/weather.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<Color> {
  ThemeCubit() : super(defaultColor);

  static const defaultColor = Color(0xFF2196F3);

  void updateTheme(Weather? weather) {
    if (weather != null) emit(weather.toColor);
  }

  @override
  Color fromJson(Map<String, dynamic> json) {
    return Color(int.parse(json['color'] as String));
  }

  @override
  Map<String, dynamic> toJson(Color state) {
    return <String, String>{'color': '${state.value}'};
  }
}

extension on Weather {
  Color get toColor {
    switch (condition) {
      case WeatherCondition.clear:
        return Colors.orange;
      case WeatherCondition.snowy:
        return Colors.blue;
      case WeatherCondition.cloudy:
        return Colors.green;
      case WeatherCondition.rainy:
        return Colors.purple;
      case WeatherCondition.unknown:
      default:
        return ThemeCubit.defaultColor;
    }
  }
}
