import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PopState extends Equatable {
  PopState([List props = const []]) : super();
}

class InitialBasePopState extends PopState {
  @override
  List<Object?> get props =>[];
}

class BackBasePopState extends PopState {
  @override
  List<Object?> get props => [];
}
