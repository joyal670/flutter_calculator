import 'package:calculator/application_layer/bloc/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _firstNumController = TextEditingController();
  final _secondNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _bloc = EventBloc();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _firstNumController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Enter first number'),
              ),
              TextField(
                controller: _secondNumController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Enter second number'),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        final a = int.parse(_firstNumController.text);
                        final b = int.parse(_secondNumController.text);
                        _bloc.add(AddEvent(a, b));
                      },
                      child: const Text('Add')),
                  ElevatedButton(
                      onPressed: () {
                        final a = int.parse(_firstNumController.text);
                        final b = int.parse(_secondNumController.text);
                        _bloc.add(SubEvent(a, b));
                      },
                      child: const Text('Substract')),
                  ElevatedButton(
                      onPressed: () {
                        final a = int.parse(_firstNumController.text);
                        final b = int.parse(_secondNumController.text);
                        _bloc.add(mulEvent(a, b));
                      },
                      child: const Text('Multiply')),
                  ElevatedButton(
                      onPressed: () {
                        final a = int.parse(_firstNumController.text);
                        final b = int.parse(_secondNumController.text);
                        _bloc.add(divEvent(a, b));
                      },
                      child: const Text('Divide'))
                ],
              ),
              BlocBuilder(
                  bloc: _bloc,
                  builder: (context, state) {
                    return Text('$state');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
