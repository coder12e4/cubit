part of 'restourents_cubit.dart';

abstract class RestourentsState {}

class RestourentsInitial extends RestourentsState {
  @override
  List<Object> get props => [];
}

class RestourentsLoading extends RestourentsState {}

class RestourentsSucces extends RestourentsState {
  final List<SingleRestorent> RestourentList;
  RestourentsSucces(this.RestourentList);
}

class RestourentFail extends RestourentsState {
  final String erroe;
  RestourentFail(this.erroe);
}
