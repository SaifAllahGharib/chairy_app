import 'package:chairy_app/features/main/presentation/viewmodel/main/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  int _selectedIndex = 0;

  MainCubit() : super(MainInitState());

  void changeTab(int index) {
    _selectedIndex = index;
    emit(MainChangeViewState());
  }

  void resetState() {
    _selectedIndex = 0;
    emit(MainChangeViewState());
  }

  int get selectedIndex => _selectedIndex;
}
