part of 'place_cubit.dart';

@freezed
class PlaceState with _$PlaceState {
  const factory PlaceState.initial() = _Initial;
  const factory PlaceState.loading() = _Loading;
  const factory PlaceState.loaded({required List<Place> places}) = _Loaded;
  const factory PlaceState.error(String error) = _Error;
}
