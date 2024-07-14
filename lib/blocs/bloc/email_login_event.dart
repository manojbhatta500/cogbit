part of 'email_login_bloc.dart';

sealed class EmailLoginEvent extends Equatable {
  const EmailLoginEvent();

  @override
  List<Object> get props => [];
}

final class EmailLogin extends EmailLoginEvent {
  final String loginId;
  final String password;

  EmailLogin({
    required this.loginId,
    required this.password,
  });
}
