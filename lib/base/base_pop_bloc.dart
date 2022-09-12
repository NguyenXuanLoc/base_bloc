import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class BasePopBloc extends Bloc<BasePopEvent, PopState> {
  BasePopBloc() : super(InitialBasePopState());

  @override
  Stream<PopState> mapEventToState(
      BasePopEvent event,
      ) async* {
    if (event is BackEvent) {
      yield BackBasePopState();
    }
  }
}
