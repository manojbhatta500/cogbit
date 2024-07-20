part of 'all_data_body_bloc.dart';

sealed class AllDataBodyState extends Equatable {
  const AllDataBodyState();
  
  @override
  List<Object> get props => [];
}

final class AllDataBodyInitial extends AllDataBodyState {}

final class AllDataBodyLoading extends AllDataBodyState {}


final class AllDataBodySuccess extends AllDataBodyState {
  AllDataBodyModel data;
  AllDataBodySuccess({required this.data});
}

final class AllDataBodyFailed extends AllDataBodyState {}

