part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

//class ChangeBottomNavigationBarStates extends NewsState {}

class LodingNews extends NewsState {}

class GetNewsSucsess extends NewsState {}

class ErrorState extends NewsState {
  final String error;

  ErrorState(this.error);
}
