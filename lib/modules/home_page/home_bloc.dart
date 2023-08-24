import 'package:base_bloc/modules/home_page/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<HomeState> {

  HomeBloc() : super(InitHomeState());

  void jumpToPageEvent(int index) {
    emit(JumpToPageState(index));
  }
}
