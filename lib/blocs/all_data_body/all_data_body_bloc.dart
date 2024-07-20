import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cogbit/models/all_data_body_model.dart';
import 'package:cogbit/repositories/get_all_data_body_repo.dart';
import 'package:equatable/equatable.dart';

part 'all_data_body_event.dart';
part 'all_data_body_state.dart';

class AllDataBodyBloc extends Bloc<AllDataBodyEvent, AllDataBodyState> {
  AllDataBodyBloc() : super(AllDataBodyInitial()) {
    on<AllDataBody>(_allDataBody);
  }

  GetAllDataBodyRepository manager = GetAllDataBodyRepository();

  FutureOr<void> _allDataBody(AllDataBody event, Emitter<AllDataBodyState> emit) async{
    emit(AllDataBodyLoading());
    final repoResponse = await manager.fetchAllDataBody(event.id);
    repoResponse.fold((l){
      emit(AllDataBodyFailed());
    },(r){
      emit(AllDataBodySuccess(data: r));
    });
  }
}
