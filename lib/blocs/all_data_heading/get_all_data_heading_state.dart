part of 'get_all_data_heading_bloc.dart';

sealed class GetAllDataHeadingState extends Equatable {
  const GetAllDataHeadingState();
  
  @override
  List<Object> get props => [];
}

final class GetAllDataHeadingInitial extends GetAllDataHeadingState {}


final class GetAllDataHeadingSuccess extends GetAllDataHeadingState {
  final AllDataHeadingModel data;
  GetAllDataHeadingSuccess({required this.data});
}

final class GetAllDataHeadingFailed extends GetAllDataHeadingState {}

final class GetAllDataHeadingLoading extends GetAllDataHeadingState {}


