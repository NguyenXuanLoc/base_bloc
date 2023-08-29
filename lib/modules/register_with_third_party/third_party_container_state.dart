import 'package:equatable/equatable.dart';

import '../register_container/register_container_cubit.dart';

class ThirdPartyContainerState extends Equatable {
  final int percentProcess;
  final RegisterType currentProcess;
  final String? email;

  const ThirdPartyContainerState(
      {this.email,
        this.currentProcess = RegisterType.Email,
        this.percentProcess = 50});

  ThirdPartyContainerState copyOf(
      {String? email, int? percentProcess, RegisterType? currentProcess}) =>
      ThirdPartyContainerState(
          email: email ?? this.email,
          currentProcess: currentProcess ?? this.currentProcess,
          percentProcess: percentProcess ?? this.percentProcess);

  @override
  List<Object?> get props => [percentProcess, currentProcess, email];
}
