import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cogbit/models/email_login_model.dart';
import 'package:cogbit/repositories/email_login_repository.dart';
import 'package:equatable/equatable.dart';

part 'email_login_event.dart';
part 'email_login_state.dart';

class EmailLoginBloc extends Bloc<EmailLoginEvent, EmailLoginState> {
  EmailLoginRepository manager = EmailLoginRepository();
  EmailLoginBloc() : super(EmailLoginInitial()) {
    on<EmailLogin>(_emailLogin);
  }

  FutureOr<void> _emailLogin(
      EmailLogin event, Emitter<EmailLoginState> emit) async {
    emit(EmailLoginLoading());
    final repoResponse =
        await manager.EmailLogin(event.loginId, event.password);

    repoResponse.fold((l) {
      log('This is failed response');
      emit(EmailLoginFailed());
    }, (r) {
      log('This is success response');
      log('This is success data  name ${r.name}');

      emit(EmailLoginSuccess(data: r));
    });
  }
}
