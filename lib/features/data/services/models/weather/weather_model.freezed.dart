// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherModel {

 String get cityName; String get countryName; double get temperature; double get feelsLike; String get weatherCondition; String get weatherIcon; DateTime get date; int get humidity; double get windSpeed; double get precipitation; List<HourlyForecast> get hourlyForecast;
/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherModelCopyWith<WeatherModel> get copyWith => _$WeatherModelCopyWithImpl<WeatherModel>(this as WeatherModel, _$identity);

  /// Serializes this WeatherModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherModel&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.countryName, countryName) || other.countryName == countryName)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.weatherCondition, weatherCondition) || other.weatherCondition == weatherCondition)&&(identical(other.weatherIcon, weatherIcon) || other.weatherIcon == weatherIcon)&&(identical(other.date, date) || other.date == date)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.precipitation, precipitation) || other.precipitation == precipitation)&&const DeepCollectionEquality().equals(other.hourlyForecast, hourlyForecast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cityName,countryName,temperature,feelsLike,weatherCondition,weatherIcon,date,humidity,windSpeed,precipitation,const DeepCollectionEquality().hash(hourlyForecast));

@override
String toString() {
  return 'WeatherModel(cityName: $cityName, countryName: $countryName, temperature: $temperature, feelsLike: $feelsLike, weatherCondition: $weatherCondition, weatherIcon: $weatherIcon, date: $date, humidity: $humidity, windSpeed: $windSpeed, precipitation: $precipitation, hourlyForecast: $hourlyForecast)';
}


}

/// @nodoc
abstract mixin class $WeatherModelCopyWith<$Res>  {
  factory $WeatherModelCopyWith(WeatherModel value, $Res Function(WeatherModel) _then) = _$WeatherModelCopyWithImpl;
@useResult
$Res call({
 String cityName, String countryName, double temperature, double feelsLike, String weatherCondition, String weatherIcon, DateTime date, int humidity, double windSpeed, double precipitation, List<HourlyForecast> hourlyForecast
});




}
/// @nodoc
class _$WeatherModelCopyWithImpl<$Res>
    implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._self, this._then);

  final WeatherModel _self;
  final $Res Function(WeatherModel) _then;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cityName = null,Object? countryName = null,Object? temperature = null,Object? feelsLike = null,Object? weatherCondition = null,Object? weatherIcon = null,Object? date = null,Object? humidity = null,Object? windSpeed = null,Object? precipitation = null,Object? hourlyForecast = null,}) {
  return _then(_self.copyWith(
cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,countryName: null == countryName ? _self.countryName : countryName // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,feelsLike: null == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double,weatherCondition: null == weatherCondition ? _self.weatherCondition : weatherCondition // ignore: cast_nullable_to_non_nullable
as String,weatherIcon: null == weatherIcon ? _self.weatherIcon : weatherIcon // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double,precipitation: null == precipitation ? _self.precipitation : precipitation // ignore: cast_nullable_to_non_nullable
as double,hourlyForecast: null == hourlyForecast ? _self.hourlyForecast : hourlyForecast // ignore: cast_nullable_to_non_nullable
as List<HourlyForecast>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WeatherModel implements WeatherModel {
   _WeatherModel({required this.cityName, required this.countryName, required this.temperature, required this.feelsLike, required this.weatherCondition, required this.weatherIcon, required this.date, required this.humidity, required this.windSpeed, required this.precipitation, required final  List<HourlyForecast> hourlyForecast}): _hourlyForecast = hourlyForecast;
  factory _WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

@override final  String cityName;
@override final  String countryName;
@override final  double temperature;
@override final  double feelsLike;
@override final  String weatherCondition;
@override final  String weatherIcon;
@override final  DateTime date;
@override final  int humidity;
@override final  double windSpeed;
@override final  double precipitation;
 final  List<HourlyForecast> _hourlyForecast;
@override List<HourlyForecast> get hourlyForecast {
  if (_hourlyForecast is EqualUnmodifiableListView) return _hourlyForecast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hourlyForecast);
}


/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherModelCopyWith<_WeatherModel> get copyWith => __$WeatherModelCopyWithImpl<_WeatherModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherModel&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.countryName, countryName) || other.countryName == countryName)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.weatherCondition, weatherCondition) || other.weatherCondition == weatherCondition)&&(identical(other.weatherIcon, weatherIcon) || other.weatherIcon == weatherIcon)&&(identical(other.date, date) || other.date == date)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.precipitation, precipitation) || other.precipitation == precipitation)&&const DeepCollectionEquality().equals(other._hourlyForecast, _hourlyForecast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cityName,countryName,temperature,feelsLike,weatherCondition,weatherIcon,date,humidity,windSpeed,precipitation,const DeepCollectionEquality().hash(_hourlyForecast));

@override
String toString() {
  return 'WeatherModel(cityName: $cityName, countryName: $countryName, temperature: $temperature, feelsLike: $feelsLike, weatherCondition: $weatherCondition, weatherIcon: $weatherIcon, date: $date, humidity: $humidity, windSpeed: $windSpeed, precipitation: $precipitation, hourlyForecast: $hourlyForecast)';
}


}

/// @nodoc
abstract mixin class _$WeatherModelCopyWith<$Res> implements $WeatherModelCopyWith<$Res> {
  factory _$WeatherModelCopyWith(_WeatherModel value, $Res Function(_WeatherModel) _then) = __$WeatherModelCopyWithImpl;
@override @useResult
$Res call({
 String cityName, String countryName, double temperature, double feelsLike, String weatherCondition, String weatherIcon, DateTime date, int humidity, double windSpeed, double precipitation, List<HourlyForecast> hourlyForecast
});




}
/// @nodoc
class __$WeatherModelCopyWithImpl<$Res>
    implements _$WeatherModelCopyWith<$Res> {
  __$WeatherModelCopyWithImpl(this._self, this._then);

  final _WeatherModel _self;
  final $Res Function(_WeatherModel) _then;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cityName = null,Object? countryName = null,Object? temperature = null,Object? feelsLike = null,Object? weatherCondition = null,Object? weatherIcon = null,Object? date = null,Object? humidity = null,Object? windSpeed = null,Object? precipitation = null,Object? hourlyForecast = null,}) {
  return _then(_WeatherModel(
cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,countryName: null == countryName ? _self.countryName : countryName // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,feelsLike: null == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double,weatherCondition: null == weatherCondition ? _self.weatherCondition : weatherCondition // ignore: cast_nullable_to_non_nullable
as String,weatherIcon: null == weatherIcon ? _self.weatherIcon : weatherIcon // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double,precipitation: null == precipitation ? _self.precipitation : precipitation // ignore: cast_nullable_to_non_nullable
as double,hourlyForecast: null == hourlyForecast ? _self._hourlyForecast : hourlyForecast // ignore: cast_nullable_to_non_nullable
as List<HourlyForecast>,
  ));
}


}


/// @nodoc
mixin _$HourlyForecast {

 DateTime get time; double get temperature; String get weatherIcon;
/// Create a copy of HourlyForecast
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HourlyForecastCopyWith<HourlyForecast> get copyWith => _$HourlyForecastCopyWithImpl<HourlyForecast>(this as HourlyForecast, _$identity);

  /// Serializes this HourlyForecast to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HourlyForecast&&(identical(other.time, time) || other.time == time)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.weatherIcon, weatherIcon) || other.weatherIcon == weatherIcon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,temperature,weatherIcon);

@override
String toString() {
  return 'HourlyForecast(time: $time, temperature: $temperature, weatherIcon: $weatherIcon)';
}


}

/// @nodoc
abstract mixin class $HourlyForecastCopyWith<$Res>  {
  factory $HourlyForecastCopyWith(HourlyForecast value, $Res Function(HourlyForecast) _then) = _$HourlyForecastCopyWithImpl;
@useResult
$Res call({
 DateTime time, double temperature, String weatherIcon
});




}
/// @nodoc
class _$HourlyForecastCopyWithImpl<$Res>
    implements $HourlyForecastCopyWith<$Res> {
  _$HourlyForecastCopyWithImpl(this._self, this._then);

  final HourlyForecast _self;
  final $Res Function(HourlyForecast) _then;

/// Create a copy of HourlyForecast
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? temperature = null,Object? weatherIcon = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,weatherIcon: null == weatherIcon ? _self.weatherIcon : weatherIcon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _HourlyForecast implements HourlyForecast {
   _HourlyForecast({required this.time, required this.temperature, required this.weatherIcon});
  factory _HourlyForecast.fromJson(Map<String, dynamic> json) => _$HourlyForecastFromJson(json);

@override final  DateTime time;
@override final  double temperature;
@override final  String weatherIcon;

/// Create a copy of HourlyForecast
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HourlyForecastCopyWith<_HourlyForecast> get copyWith => __$HourlyForecastCopyWithImpl<_HourlyForecast>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HourlyForecastToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HourlyForecast&&(identical(other.time, time) || other.time == time)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.weatherIcon, weatherIcon) || other.weatherIcon == weatherIcon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,temperature,weatherIcon);

@override
String toString() {
  return 'HourlyForecast(time: $time, temperature: $temperature, weatherIcon: $weatherIcon)';
}


}

/// @nodoc
abstract mixin class _$HourlyForecastCopyWith<$Res> implements $HourlyForecastCopyWith<$Res> {
  factory _$HourlyForecastCopyWith(_HourlyForecast value, $Res Function(_HourlyForecast) _then) = __$HourlyForecastCopyWithImpl;
@override @useResult
$Res call({
 DateTime time, double temperature, String weatherIcon
});




}
/// @nodoc
class __$HourlyForecastCopyWithImpl<$Res>
    implements _$HourlyForecastCopyWith<$Res> {
  __$HourlyForecastCopyWithImpl(this._self, this._then);

  final _HourlyForecast _self;
  final $Res Function(_HourlyForecast) _then;

/// Create a copy of HourlyForecast
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? temperature = null,Object? weatherIcon = null,}) {
  return _then(_HourlyForecast(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,weatherIcon: null == weatherIcon ? _self.weatherIcon : weatherIcon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
