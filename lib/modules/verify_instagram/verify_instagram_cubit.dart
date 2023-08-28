import 'package:base_bloc/localization/locale_keys.dart';
import 'package:base_bloc/modules/verify_instagram/verify_instagram_state.dart';
import 'package:base_bloc/utils/toast_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

class VerifyInstagramCubit extends Cubit<VerifyInstagramState> {
  VerifyInstagramCubit() : super(VerifyInstagramState());

  void copyOnClick(BuildContext context) async {
    await Clipboard.setData(const ClipboardData(text: 'Sway me'));
    toast(LocaleKeys.copy_success.tr());
  }

  void nextOnclick() {}
}
