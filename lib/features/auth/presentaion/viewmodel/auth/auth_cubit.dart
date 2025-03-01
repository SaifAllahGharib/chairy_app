import 'package:chairy_app/core/helper_functions/validation_email.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/hive_service.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/type_field.dart';
import 'package:chairy_app/features/auth/domain/usecases/create_order.dart';
import 'package:chairy_app/features/auth/domain/usecases/login.dart';
import 'package:chairy_app/features/auth/domain/usecases/register.dart';
import 'package:chairy_app/features/auth/domain/usecases/sync_cart_with_server.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final Register _register;
  final Login _login;
  final SyncCartWithServer _syncCartWithServer;
  final CreateOrder _createOrder;
  final HiveService _hiveService;
  final MySharedPreferences _mySharedPreferences;

  bool _showPassword = false;
  bool _hasEmailError = false;
  bool _hasFirstNameError = false;
  bool _hasLastNameError = false;
  bool _hasAddressError = false;
  bool _hasPasswordError = false;

  String? _errorEmailMsg;
  String? _errorFirstNameMsg;
  String? _errorLastNameMsg;
  String? _errorAddressMsg;
  String? _errorPasswordMsg;

  int _currentStep = 0;
  int _currentView = 0;

  String _selectedValue = "visa";

  bool _checkBoxValue = false;

  AuthCubit(
    this._register,
    this._login,
    this._syncCartWithServer,
    this._createOrder,
    this._hiveService,
    this._mySharedPreferences,
  ) : super(AuthInitState());

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

  void updateIndexCurrentView([int index = 1]) {
    _currentView = index;
    emit(AuthChangeViewState());
  }

  void selectPaymentMethod(String value) {
    _selectedValue = value;
    emit(AuthSelectPaymentMethodState());
  }

  void setCheckBox() {
    _checkBoxValue = !_checkBoxValue;
    emit(AuthCheckBoxState());
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
    } else if (type == TypeField.address) {
      if (value == null || value.isEmpty) {
        _hasAddressError = true;
        _errorAddressMsg = errorMsg;
        hasError = true;
      } else {
        _hasAddressError = false;
        _errorAddressMsg = null;
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

  Future<void> syncCartWithServer(List<CartEntity> cart, String? token) async {
    emit(AuthLoadingState());
    final response = await _syncCartWithServer.call(cart, token);

    response.fold(
      (error) => emit(AuthFailureState(error)),
      (_) async {
        emit(AuthSyncCartSuccessState());
        await _clearCartData();
      },
    );
  }

  Future<void> createOrder(
    String? token,
    String shippingStreetAddress,
    String shippingState,
    String shippingCountry,
    String paymentMethod,
  ) async {
    emit(AuthLoadingState());
    final response = await _createOrder.call(
      token,
      shippingStreetAddress,
      shippingState,
      shippingCountry,
      paymentMethod,
    );

    response.fold(
      (error) => emit(AuthCreateOrderFailureState(error)),
      (order) async {
        emit(AuthCreateOrderState(order));
        await _clearCartData();
      },
    );
  }

  Future<void> _clearCartData() async {
    await Future.wait([
      _hiveService.clearBox<CartEntity>("cartBox"),
      _mySharedPreferences.removeKeysContaining("countOfItem"),
    ]);
  }

  bool get showPassword => _showPassword;

  bool get hasEmailError => _hasEmailError;

  bool get hasFirstNameError => _hasFirstNameError;

  bool get hasLastNameError => _hasLastNameError;

  bool get hasAddressError => _hasAddressError;

  bool get hasPasswordError => _hasPasswordError;

  String? get errorEmailMsg => _errorEmailMsg;

  String? get errorFistNameMsg => _errorFirstNameMsg;

  String? get errorLastNameMsg => _errorLastNameMsg;

  String? get errorAddressMsg => _errorAddressMsg;

  String? get errorPasswordMsg => _errorPasswordMsg;

  int get currentStep => _currentStep;

  int get currentView => _currentView;

  String get selectedValue => _selectedValue;

  bool get checkBoxValue => _checkBoxValue;
}
