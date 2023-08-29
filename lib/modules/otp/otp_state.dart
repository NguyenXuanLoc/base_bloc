import 'package:equatable/equatable.dart';

class OtpState extends Equatable {
  final String email;

  const OtpState({this.email = ''});

  @override
  List<Object?> get props => [email];
}
