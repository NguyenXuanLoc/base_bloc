import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BasePopEvent extends Equatable {
  BasePopEvent([List props = const []]) : super();
}

class BackEvent extends BasePopEvent {
  @override
  String toString() => 'BackEvent';

  @override
  List<Object?> get props =>[];
}
