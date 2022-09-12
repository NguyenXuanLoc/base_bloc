import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class HomeState extends Equatable {}

class InitHomeState extends HomeState {
  @override
  List<Object?> get props => [];
}

class JumpToPageState extends HomeState {
  final int index;

  JumpToPageState(this.index);
  @override
  List<Object?> get props => [index];
}
