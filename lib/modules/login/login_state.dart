import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  String? errorEmail;
  String? errorPass;
  final String? email;
  final String? pass;
  final bool isRefresh;

  LoginState(
      {this.email = '',
      this.pass = '',
      this.errorEmail,
      this.errorPass,
      this.isRefresh = false});

  LoginState refreshUi() => copyOf(isRefresh: !isRefresh);

  LoginState copyOf(
          {String? errorEmail,
          String? errorPass,
          String? email,
          String? pass,
          bool? isRefresh}) =>
      LoginState(
          errorEmail: errorEmail ?? this.errorEmail,
          errorPass: errorPass ?? this.errorPass,
          email: email ?? this.email,
          pass: pass ?? this.pass,
          isRefresh: isRefresh ?? this.isRefresh);

  @override
  List<Object?> get props => [errorEmail, errorPass, email, pass, isRefresh];
}
