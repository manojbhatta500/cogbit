part of 'my_app_bloc.dart';

sealed class MyAppEvent extends Equatable {
  const MyAppEvent();

  @override
  List<Object> get props => [];
}

class GetMyAppList extends MyAppEvent{
  
}