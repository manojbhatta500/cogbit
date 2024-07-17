import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cogbit/models/my_apps_list_model.dart';
import 'package:cogbit/repositories/my_app_list_repository.dart';
import 'package:equatable/equatable.dart';

part 'my_app_event.dart';
part 'my_app_state.dart';

class MyAppBloc extends Bloc<MyAppEvent, MyAppState> {
  MyAppListRepository manager = MyAppListRepository();
  MyAppBloc() : super(MyAppInitial()) {
    on<GetMyAppList>(_getMyAppList);
  }

  FutureOr<void> _getMyAppList(GetMyAppList event, Emitter<MyAppState> emit) async{
    emit(MyAppLoading());
    final repoResponse = await manager.getMyAppList();
    repoResponse.fold((l){
      log('this is get my app list and this is left  failed state');
      emit(MyAppFailed());
    },(r){
            log('this is get my app list and this is right  success state');

      emit(MyAppSuccess(data: r));
    });
  }
}
