import 'package:bloc_essentials/blocs/counter/counter_bloc.dart';
import 'package:bloc_essentials/otherpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const WidgetApp());
}

class WidgetApp extends StatelessWidget {
  const WidgetApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(IncrementCounterEvent());
          },
          heroTag: "increment",
          child: const Icon(Icons.add),
        ),
        const SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(DecrementCounterEvent());
          },
          heroTag: "decrement",
          child: const Icon(Icons.remove),
        ),
      ]),
      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state.counter == 3) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text("counter is ${state.counter}"),
              ),
            );
          }
          if (state.counter == -1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OtherPage(),
              ),
            );
          }
        },
        child: Center(
          child: Text(
            "${context.watch<CounterBloc>().state.counter}",
            style: const TextStyle(
              fontSize: 52,
            ),
          ),
        ),
      ),
    );
  }
}
