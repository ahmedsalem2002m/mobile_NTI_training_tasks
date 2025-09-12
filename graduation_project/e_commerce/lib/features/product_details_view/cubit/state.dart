
abstract class PState {}

class PInitial extends PState {}

class AddFavoriteSuccess extends PState {}

class Error extends PState {
  final String error;
  Error({required this.error});
}
class AddToCartSuccess extends PState {}

