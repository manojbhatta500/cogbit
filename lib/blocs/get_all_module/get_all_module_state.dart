part of 'get_all_module_bloc.dart';

sealed class GetAllModuleState extends Equatable {
  const GetAllModuleState();
  
  @override
  List<Object> get props => [];
}

final class GetAllModuleInitial extends GetAllModuleState {}

final class GetAllModuleLoading extends GetAllModuleState {}

final class GetAllModuleSuccess extends GetAllModuleState {}

final class GetAllModuleFailed extends GetAllModuleState {}



