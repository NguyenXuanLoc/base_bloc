import 'package:base_bloc/modules/guideline/guideline_page.dart';
import 'package:base_bloc/modules/home_page/home_page.dart';
import 'package:base_bloc/modules/notify_verify/notify_verify_state.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:base_bloc/utils/storage_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotifyVerifyBloc extends Cubit<NotifyVerifyState> {
  NotifyVerifyBloc() : super(NotifyVerifyState());

  void startOnClick(BuildContext context) async {
    var isGuideline = await StorageUtils.isGuideline();
    RouterUtils.pushTo(
        context, !isGuideline ? const GuidelinePage() : const HomePage(),
        isReplace: true);
  }
}
