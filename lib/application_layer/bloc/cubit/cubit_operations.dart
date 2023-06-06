import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  int counter = 0;

  void cubitAdd() {
    counter++;
    emit(counter);
  }

  void cubitSub() {
    counter--;
    emit(counter);
  }
}
