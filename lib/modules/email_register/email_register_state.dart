import 'package:base_bloc/utils/log_utils.dart';
import 'package:equatable/equatable.dart';

class EmailRegisterState extends Equatable {
  final bool isAcceptRule;
  final bool isConfirmAccount;
  final String? email;
  final String? instagramName;
  final String? dateTime;
  final String? password;
  String? errorEmail;
  String? errorInstagramName;
  String? errorDate;
  String? errorPass;
  String? errorRules;
  final bool isRefreshUi;

  EmailRegisterState(
      {this.isAcceptRule = false,
      this.isConfirmAccount = false,
      this.isRefreshUi = false,
      this.email,
      this.instagramName,
      this.dateTime,
      this.password,
      this.errorEmail,
      this.errorInstagramName,
      this.errorDate,
      this.errorPass,
      this.errorRules});

  EmailRegisterState refeshUI() => copyOf(isRefreshUi: !isRefreshUi);

  EmailRegisterState copyOf(
          {bool? isAcceptRule,
          bool? isConfirmAcc,
          bool? isRefreshUi,
          String? email,
          String? instagramName,
          String? dateTime,
          String? password,
          String? errorEmail,
          String? errorInstagramName,
          String? errorDate,
          String? errorPass,
          String? errorRules}) =>
      EmailRegisterState(
          isRefreshUi: isRefreshUi ?? this.isRefreshUi,
          errorEmail: errorEmail ?? this.errorEmail,
          errorDate: errorDate ?? this.errorDate,
          errorInstagramName: errorInstagramName ?? this.errorInstagramName,
          errorPass: errorDate ?? this.errorPass,
          isAcceptRule: isAcceptRule ?? this.isAcceptRule,
          isConfirmAccount: isConfirmAcc ?? this.isConfirmAccount,
          email: email ?? this.email,
          instagramName: instagramName ?? this.instagramName,
          dateTime: dateTime ?? this.dateTime,
          password: password ?? this.password,
          errorRules: errorRules ?? this.errorRules);

  @override
  List<Object?> get props => [
        isAcceptRule,
        isConfirmAccount,
        email,
        instagramName,
        dateTime,
        password,
        errorRules,
        errorPass,
        errorDate,
        errorInstagramName,
        errorEmail,
        isRefreshUi
      ];
}
