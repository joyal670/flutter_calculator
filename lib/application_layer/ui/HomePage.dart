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

  final _one = TextEditingController();
  final _two = TextEditingController();
  final _three = TextEditingController();
  final _four = TextEditingController();
  final _five = TextEditingController();
  final _six = TextEditingController();
  final _seven = TextEditingController();
  final _eight = TextEditingController();
  final _nine = TextEditingController();
  final _zero = TextEditingController();
  final _add = TextEditingController();
  final _sub = TextEditingController();
  final _multiple = TextEditingController();
  final _divide = TextEditingController();
  final _remove = TextEditingController();
  final _textController = TextEditingController();

  String value = "";

  void addData(String _value) {
    setState(() {
      value += _value;
    });
  }

  void additionOperation() {
    final a = value.split('+')[0];
    final b = value.split('+')[1];
    // print(a + b);
    print(a);
  }

  @override
  Widget build(BuildContext context) {
    var _bloc = EventBloc();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Material(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '${value.toString()}',
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        addData("7");
                      },
                      child: Text('7')),
                  OutlinedButton(
                      onPressed: () {
                        addData("8");
                      },
                      child: Text('8')),
                  OutlinedButton(
                      onPressed: () {
                        addData("9");
                      },
                      child: Text('9')),
                  ElevatedButton(onPressed: () {}, child: const Text('*')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        addData("4");
                      },
                      child: Text('4')),
                  OutlinedButton(
                      onPressed: () {
                        addData("5");
                      },
                      child: Text('5')),
                  OutlinedButton(
                      onPressed: () {
                        addData("6");
                      },
                      child: Text('6')),
                  ElevatedButton(onPressed: () {}, child: const Text('-')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        addData("1");
                      },
                      child: Text('1')),
                  OutlinedButton(
                      onPressed: () {
                        addData("2");
                      },
                      child: Text('2')),
                  OutlinedButton(
                      onPressed: () {
                        addData("3");
                      },
                      child: Text('3')),
                  ElevatedButton(onPressed: () {}, child: const Text('/')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        addData("+");
                      },
                      child: const Text('+')),
                  OutlinedButton(onPressed: () {}, child: Text('0')),
                  ElevatedButton(onPressed: () {}, child: const Text('=')),
                  ElevatedButton(
                      onPressed: () {
                        additionOperation();
                      },
                      child: const Icon(Icons.backspace)),
                ],
              ),
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
