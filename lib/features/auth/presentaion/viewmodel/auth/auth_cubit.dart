import 'package:chairy_app/core/helper_functions/validation_email.dart';
import 'package:chairy_app/core/utils/type_field.dart';
import 'package:chairy_app/features/auth/domain/usecases/login.dart';
import 'package:chairy_app/features/auth/domain/usecases/register.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final Register _register;
  final Login _login;

  bool _showPassword = false;
  bool _hasEmailError = false;
  bool _hasFirstNameError = false;
  bool _hasLastNameError = false;
  bool _hasPasswordError = false;

  String? _errorEmailMsg;
  String? _errorFirstNameMsg;
  String? _errorLastNameMsg;
  String? _errorPasswordMsg;

  int _currentStep = 0;
  int _currentView = 0;

  AuthCubit(this._register, this._login) : super(AuthInitState());

  void toggleShowPassword() {
    _showPassword = !_showPassword;
    emit(AuthShowPasswordState());
  }

  void changeStep(int step) {
    _currentStep = step;
    emit(AuthChangeStepState());
  }

  void changeView() {
    _currentView++;
    emit(AuthChangeViewState());
  }

  String? setError({
    required TypeField type,
    required String errorMsg,
    required String? value,
    String? secErrorMsg,
  }) {
    bool hasError = false;

    if (type == TypeField.email) {
      if (value == null || value.isEmpty) {
        _hasEmailError = true;
        _errorEmailMsg = errorMsg;
        hasError = true;
      } else if (validateEmail(value)) {
        _hasEmailError = true;
        _errorEmailMsg = secErrorMsg;
        hasError = true;
      } else {
        _hasEmailError = false;
        _errorEmailMsg = null;
      }
    } else if (type == TypeField.firstName) {
      if (value == null || value.isEmpty) {
        _hasFirstNameError = true;
        _errorFirstNameMsg = errorMsg;
        hasError = true;
      } else {
        _hasFirstNameError = false;
        _errorFirstNameMsg = null;
      }
    } else if (type == TypeField.lastName) {
      if (value == null || value.isEmpty) {
        _hasLastNameError = true;
        _errorLastNameMsg = errorMsg;
        hasError = true;
      } else {
        _hasLastNameError = false;
        _errorLastNameMsg = null;
      }
    } else if (type == TypeField.password) {
      if (value == null || value.isEmpty) {
        _hasPasswordError = true;
        _errorPasswordMsg = errorMsg;
        hasError = true;
      } else {
        _hasPasswordError = false;
        _errorPasswordMsg = null;
      }
    }

    if (hasError) emit(AuthErrorFieldState());

    return hasError ? errorMsg : null;
  }

  Future<void> register(
    String name,
    String lastName,
    String email,
    String password,
  ) async {
    emit(AuthLoadingState());
    final response = await _register.call(name, lastName, email, password);

    response.fold(
      (error) => emit(AuthFailureState(error)),
      (user) => emit(AuthSuccessState(user)),
    );
  }

  Future<void> login(
    String email,
    String password,
  ) async {
    emit(AuthLoadingState());
    final response = await _login.call(email, password);

    response.fold(
      (error) => emit(AuthFailureState(error)),
      (user) => emit(AuthSuccessState(user)),
    );
  }

  bool get showPassword => _showPassword;

  bool get hasEmailError => _hasEmailError;

  bool get hasFirstNameError => _hasFirstNameError;

  bool get hasLastNameError => _hasLastNameError;

  bool get hasPasswordError => _hasPasswordError;

  String? get errorEmailMsg => _errorEmailMsg;

  String? get errorFistNameMsg => _errorFirstNameMsg;

  String? get errorLastNameMsg => _errorLastNameMsg;

  String? get errorPasswordMsg => _errorPasswordMsg;

  int get currentStep => _currentStep;

  int get currentView => _currentView;
}
