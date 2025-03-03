import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_count_state.dart';

class SendCountCubit extends Cubit<int> {
  SendCountCubit() : super(0);

  void handleSelection(bool val) {
    if (val) {
      add();
    } else {
      remove();
    }
  }

  void add() {
    emit(state + 1);
  }

  void remove() {
    print(state);
    if (state > 0) {
      emit(state - 1);
    }
    print(state);
  }
}
