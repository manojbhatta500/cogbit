part of 'my_app_bloc.dart';

sealed class MyAppState extends Equatable {
  const MyAppState();
  
  @override
  List<Object> get props => [];
}

final class MyAppInitial extends MyAppState {}

final class MyAppLoading extends MyAppState {}


final class MyAppFailed extends MyAppState {}

final class MyAppSuccess extends MyAppState {
  final MyAppListModule data;
  MyAppSuccess({required this.data});
}

