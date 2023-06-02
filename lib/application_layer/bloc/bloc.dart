import 'package:calculator/application_layer/bloc/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventBloc extends Bloc<CalcEvents, int> {
  EventBloc() : super(0) {
    on<CalcEvents>((event, emit) {
      if (event is AddEvent) {
        emit(event.a + event.b);
      } else if (event is SubEvent) {
        emit(event.a - event.b);
      } else if (event is mulEvent) {
        num a = event.a;
        num b = event.b;
        num c = a / b;
        emit(c.round());
      } else if (event is divEvent) {
        emit(event.a * event.b);
      }
    });
  }
}
