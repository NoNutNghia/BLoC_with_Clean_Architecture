import 'package:equatable/equatable.dart';

sealed class BaseState extends Equatable {
  const BaseState();
}

class InitialState extends BaseState {
  const InitialState();
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

abstract class ProcessingState extends BaseState {
  const ProcessingState();

  @override
  List<Object?> get props => [];
}

abstract class ViewState extends ProcessingState {}

abstract class DialogState extends ProcessingState {}

class LoadingViewState extends DialogState {
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class SuccessState<T> extends ProcessingState {
  final T? data;

  const SuccessState(this.data);

  @override
  List<Object?> get props => [data];

  @override
  bool get stringify => true;
}

class ErrorViewState<T> extends ViewState {
  final String? message;

  ErrorViewState({this.message = "Unknown Error Message"});

  @override
  List<Object?> get props => [message];

  @override
  bool get stringify => true;
}

class ErrorDialogState<T> extends DialogState {
  final String? message;

  ErrorDialogState({this.message = "Unknown Error Message"});

  @override
  List<Object?> get props => [message];

  @override
  bool get stringify => true;
}

class TokenExpiredErrorDialogState extends DialogState {
  final String message = "Token expired, please re-login";

  @override
  List<Object?> get props => [message];

  @override
  bool get stringify => true;
}