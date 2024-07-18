import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cogbit/blocs/get_all_module/get_all_module_bloc.dart';
import 'package:cogbit/models/all_data_heading_model.dart';
import 'package:cogbit/repositories/get_all_data_heading_repo.dart';
import 'package:equatable/equatable.dart';

part 'get_all_data_heading_event.dart';
part 'get_all_data_heading_state.dart';

class GetAllDataHeadingBloc extends Bloc<GetAllDataHeadingEvent, GetAllDataHeadingState> {
  GetAllDataHeadingBloc() : super(GetAllDataHeadingInitial()) {
    on<GetAllDataHeading>(_getAllDataHeading);
  }
  AllDataHeadingRepository manager = AllDataHeadingRepository();
  FutureOr<void> _getAllDataHeading(GetAllDataHeading event, Emitter<GetAllDataHeadingState> emit) async{
    emit(GetAllDataHeadingLoading());

    final repoResponse = await manager.fetchAllDataHeadings(event.id);

    repoResponse.fold((l){
      emit(GetAllDataHeadingFailed());
    }, (r){
      emit(GetAllDataHeadingSuccess(data: r));
    });

  }
}
