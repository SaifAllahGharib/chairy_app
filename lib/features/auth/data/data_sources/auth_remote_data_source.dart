import 'package:chairy_app/core/services/auth_services.dart';
import 'package:chairy_app/core/services/db_services.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/features/auth/data/models/user_response_model.dart';
import 'package:chairy_app/features/auth/domain/entities/order_entity.dart';

sealed class AuthRemoteDataSource {
  Future<UserResponseModel> register(
    String name,
    String lastName,
    String email,
    String password,
  );

  Future<UserResponseModel> login(
    String email,
    String password,
  );

  Future<void> syncCartToServer(List<CartEntity> cart, String? token);

  Future<OrderEntity> createOrder(
    String? token,
    String shippingStreetAddress,
    String shippingState,
    String shippingCountry,
    String paymentMethod,
  );
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final AuthServices _authServices;
  final DBServices _dbServices;

  AuthRemoteDataSourceImpl(this._authServices, this._dbServices);

  @override
  Future<UserResponseModel> register(
      String name, String lastName, String email, String password) async {
    return await _authServices.register(name, lastName, email, password);
  }

  @override
  Future<UserResponseModel> login(String email, String password) async {
    return await _authServices.login(email, password);
  }

  @override
  Future<void> syncCartToServer(List<CartEntity> cart, String? token) async {
    await Future.wait(
      cart.map((item) => _dbServices.addItemToCart(item, token)),
    );
  }

  @override
  Future<OrderEntity> createOrder(
    String? token,
    String shippingStreetAddress,
    String shippingState,
    String shippingCountry,
    String paymentMethod,
  ) async {
    return await _dbServices.createOrder(
      token,
      shippingStreetAddress,
      shippingState,
      shippingCountry,
      paymentMethod,
    );
  }
}
