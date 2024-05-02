import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class BaseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialEvent extends BaseEvent {}

class TokenExpiredEvent extends BaseEvent {}
