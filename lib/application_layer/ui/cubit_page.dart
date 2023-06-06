import 'package:calculator/application_layer/bloc/cubit/cubit_operations.dart';
import 'package:calculator/application_layer/ui/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  final _cubit = CounterCubit();

  CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clean Architecture - Cubit'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              ResultTextWidget(),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Builder(
              builder: (context) => FloatingActionButton(
                onPressed: () {
                  //_bloc.add(CounterAddEvent());
                  // _cubit.functionAdd();
                  context.read<CounterCubit>().cubitAdd();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
            const SizedBox(width: 16),
            Builder(builder: (context) {
              return FloatingActionButton(
                onPressed: () {
                  // _bloc.add(CounterSubEvent());
                  //_cubit.functionSub();
                  context.read<CounterCubit>().cubitSub();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.remove),
              );
            }),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
