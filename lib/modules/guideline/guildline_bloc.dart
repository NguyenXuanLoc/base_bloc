import 'package:base_bloc/modules/guideline/guideline_state.dart';
import 'package:base_bloc/utils/storage_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuidelineBloc extends Cubit<GuidelineState> {
  GuidelineBloc() : super(GuidelineState()) {
    StorageUtils.saveGuideline();
  }
}
