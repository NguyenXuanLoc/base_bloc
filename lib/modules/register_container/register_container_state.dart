import 'package:base_bloc/modules/register_container/register_container_cubit.dart';
import 'package:equatable/equatable.dart';

class RegisterContainerState extends Equatable {
  final int percentProcess;
  final RegisterType currentProcess;
  final String? email;

  const RegisterContainerState(
      {this.email,
      this.currentProcess = RegisterType.Email,
      this.percentProcess = 30});

  RegisterContainerState copyOf(
          {String? email, int? percentProcess, RegisterType? currentProcess}) =>
      RegisterContainerState(
          email: email ?? this.email,
          currentProcess: currentProcess ?? this.currentProcess,
          percentProcess: percentProcess ?? this.percentProcess);

  @override
  List<Object?> get props => [percentProcess, currentProcess, email];
}
