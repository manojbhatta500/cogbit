import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cogbit/models/all_module_list_model.dart';
import 'package:cogbit/repositories/get_module_list.dart';
import 'package:equatable/equatable.dart';

part 'get_all_module_event.dart';
part 'get_all_module_state.dart';

class GetAllModuleBloc extends Bloc<GetAllModuleEvent, GetAllModuleState> {
  GetModuleList manager = GetModuleList();
  GetAllModuleBloc() : super(GetAllModuleInitial()) {
   on<GetAllModule>(_getAllModule);
  }

  FutureOr<void> _getAllModule(GetAllModule event, Emitter<GetAllModuleState> emit) async{
    emit(GetAllModuleLoading());
    final repoResponse = await manager.getModuleList();
  
  
    
    repoResponse.fold((l){
             log('repo response is false : example ${repoResponse}');

      emit(GetAllModuleFailed());
    },(r){
             log('repo response is true : example ${repoResponse}');

      emit(GetAllModuleSuccess(data: r));
    });


  }
}
