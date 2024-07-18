part of 'get_all_data_heading_bloc.dart';

sealed class GetAllDataHeadingEvent extends Equatable {
  const GetAllDataHeadingEvent();

  @override
  List<Object> get props => [];
}

// final class GetAllDataHeading extends GetAllDataHeadingEvent{
//   int id ;
//   GetAllDataHeading({required this.id});
// }

class GetAllDataHeading extends GetAllDataHeadingEvent {
  final int id;
  GetAllDataHeading({required this.id});
}
