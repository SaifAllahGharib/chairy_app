import 'package:chairy_app/core/shared/cubits/counter/counter_state.dart';
import 'package:chairy_app/core/shared/usecases/decrease_item.dart';
import 'package:chairy_app/core/shared/usecases/increase_item.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  final IncreaseItem _increaseItem;
  final DecreaseItem _decreaseItem;
  final MySharedPreferences _mySharedPreferences;
  final Map<int, int> _count = {};

  CounterCubit(
    this._increaseItem,
    this._decreaseItem,
    this._mySharedPreferences,
  ) : super(CounterInitState());

  void increment(String? token, int productId, int quantity) async {
    emit(CounterLoadingState());

    if (quantity <= 0) {
      emit(CounterProductOutOfStockState());
    } else {
      if (getCount(productId) > quantity) {
        emit(CounterThisCountIsOnlyAvailableState());
      } else {
        final int countInDB =
            _mySharedPreferences.getInt("countOfItem$productId") ?? 0;

        if (countInDB > 0) {
          final response = await _increaseItem.call(token, productId);

          response.fold(
            (l) => emit(CounterFailureState()),
            (r) {
              _count[productId] = (_count[productId] ?? countInDB) + 1;

              _mySharedPreferences.storeInt(
                "countOfItem$productId",
                _count[productId]!,
              );

              print("SUCCESS TO INC LOCAL STATE");
              emit(CounterIncrementState());
            },
          );
        } else {
          _count[productId] = (_count[productId] ??
                  _mySharedPreferences.getInt("countOfItem$productId") ??
                  0) +
              1;
          emit(CounterIncrementState());
        }
      }
    }

    print(
        "COUNT IN DB: ${_mySharedPreferences.getInt("countOfItem$productId")}");
  }

  void decrement(String? token, int productId) async {
    emit(CounterLoadingState());

    final int countInDB =
        _mySharedPreferences.getInt("countOfItem$productId") ?? 0;

    if (getCount(productId) > 0) {
      if (countInDB > 0) {
        final response = await _decreaseItem.call(token, productId);

        response.fold(
          (l) => emit(CounterFailureState()),
          (r) {
            _count[productId] = (_count[productId] ?? countInDB) - 1;

            _mySharedPreferences.storeInt(
                "countOfItem$productId", _count[productId]!);

            print("SUCCESS TO DEC LOCAL STATE");
            emit(CounterDecrementState());
          },
        );
      } else {
        _count[productId] = (_count[productId] ?? 0) - 1;
        emit(CounterDecrementState());
      }
    } else {
      emit(CounterCanNotDecrementState());
    }

    print(
        "COUNT IN DB: ${_mySharedPreferences.getInt("countOfItem$productId")}");
  }

  void resetCount(int productId) {
    _count[productId] = 0;
    _mySharedPreferences.removeKey("countOfItem$productId");
    emit(CounterResetState());
  }

  int getCount(int productId) {
    return _count[productId] ??
        _mySharedPreferences.getInt("countOfItem$productId") ??
        0;
  }
}
