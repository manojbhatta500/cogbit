part of 'email_login_bloc.dart';

sealed class EmailLoginState extends Equatable {
  const EmailLoginState();

  @override
  List<Object> get props => [];
}

final class EmailLoginInitial extends EmailLoginState {}

final class EmailLoginSuccess extends EmailLoginState {
  final EmailLoginModel data;
  EmailLoginSuccess({required this.data});
}

final class EmailLoginFailed extends EmailLoginState {}

final class EmailLoginLoading extends EmailLoginState {}
