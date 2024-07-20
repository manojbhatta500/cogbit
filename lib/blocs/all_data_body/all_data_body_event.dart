part of 'all_data_body_bloc.dart';

sealed class AllDataBodyEvent extends Equatable {
  const AllDataBodyEvent();

  @override
  List<Object> get props => [];
}


class AllDataBody extends AllDataBodyEvent{
  int id;
  AllDataBody({required this.id });
}