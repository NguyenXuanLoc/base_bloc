import 'package:base_bloc/modules/register_container/register_container_cubit.dart';
import 'package:equatable/equatable.dart';

class RegisterContainerState extends Equatable {
  final int percentProcess;
  final RegisterType currentProcess;

  const RegisterContainerState(
      {this.currentProcess = RegisterType.Email, this.percentProcess = 30});

  RegisterContainerState copyOf(
          {int? percentProcess, RegisterType? currentProcess}) =>
      RegisterContainerState(
          currentProcess: currentProcess ?? this.currentProcess,
          percentProcess: percentProcess ?? this.percentProcess);

  @override
  List<Object?> get props => [percentProcess];
}
