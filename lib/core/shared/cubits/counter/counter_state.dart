abstract class CounterState {}

class CounterInitState extends CounterState {}

class CounterLoadingState extends CounterState {}

class CounterIncrementState extends CounterState {}

class CounterDecrementState extends CounterState {}

class CounterProductOutOfStockState extends CounterState {}

class CounterThisCountIsOnlyAvailableState extends CounterState {}

class CounterCanNotDecrementState extends CounterState {}

class CounterResetState extends CounterState {}

class CounterFailureState extends CounterState {}
