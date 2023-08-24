import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final bool isStartAnimation;

  const SplashState({this.isStartAnimation = false});

  SplashState copyOf({bool? isStartAnimation}) =>
      SplashState(isStartAnimation: isStartAnimation ?? this.isStartAnimation);

  @override
  List<Object?> get props => [isStartAnimation];
}
