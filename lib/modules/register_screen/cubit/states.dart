import '../../../models/model_register_screen.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterDateTimeState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final RegisterScreenModel register;
  RegisterSuccessState(this.register);
}

class RegisterErrorState extends RegisterStates {
  final dynamic error;
  final String? message;
  RegisterErrorState(this.error, this.message);
}

class ChangeIconSifForPasswordState extends RegisterStates {}

class ChangeIconSifForPasswordConfirmationState extends RegisterStates {}
