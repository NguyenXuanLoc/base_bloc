import 'package:equatable/equatable.dart';

class ThirdPartyRegisterState extends Equatable {
  final bool isAcceptRule;
  final bool isConfirmAccount;
  final String? phoneNumber;
  final String? instagramName;
  final String? dateTime;
  final String? password;
  String? errorPhoneNumber;
  String? errorInstagramName;
  String? errorDate;
  String? errorPass;
  String? errorRules;
  final bool isRefreshUi;

  ThirdPartyRegisterState(
      {this.isAcceptRule = false,
        this.isConfirmAccount = false,
        this.isRefreshUi = false,
        this.phoneNumber,
        this.instagramName,
        this.dateTime,
        this.password,
        this.errorPhoneNumber,
        this.errorInstagramName,
        this.errorDate,
        this.errorPass,
        this.errorRules});

  ThirdPartyRegisterState refeshUI() => copyOf(isRefreshUi: !isRefreshUi);

  ThirdPartyRegisterState copyOf(
      {bool? isAcceptRule,
        bool? isConfirmAcc,
        bool? isRefreshUi,
        String? phoneNumber,
        String? instagramName,
        String? dateTime,
        String? password,
        String? errorPhoneNumber,
        String? errorInstagramName,
        String? errorDate,
        String? errorPass,
        String? errorRules}) =>
      ThirdPartyRegisterState(
          isRefreshUi: isRefreshUi ?? this.isRefreshUi,
          errorPhoneNumber: errorPhoneNumber ?? this.errorPhoneNumber,
          errorDate: errorDate ?? this.errorDate,
          errorInstagramName: errorInstagramName ?? this.errorInstagramName,
          errorPass: errorDate ?? this.errorPass,
          isAcceptRule: isAcceptRule ?? this.isAcceptRule,
          isConfirmAccount: isConfirmAcc ?? this.isConfirmAccount,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          instagramName: instagramName ?? this.instagramName,
          dateTime: dateTime ?? this.dateTime,
          password: password ?? this.password,
          errorRules: errorRules ?? this.errorRules);

  @override
  List<Object?> get props => [
    isAcceptRule,
    isConfirmAccount,
    phoneNumber,
    instagramName,
    dateTime,
    password,
    errorRules,
    errorPass,
    errorDate,
    errorInstagramName,
    errorPhoneNumber,
    isRefreshUi
  ];
}
