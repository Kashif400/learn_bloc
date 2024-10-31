import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/asif%20learn%20bloc/counter/counter_bloc_asif.dart';
import 'package:learn_bloc/asif%20learn%20bloc/counter/counter_event_asif.dart';
import 'package:learn_bloc/asif%20learn%20bloc/counter/counter_state_asif.dart';

class CounterViewAsif extends StatelessWidget {
  const CounterViewAsif({super.key});

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBlocAsif, CounterStateAsif>(
              builder: (context, state) {
            print(state.counter);
            return Text(state.counter.toString());
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<CounterBlocAsif>()
                        .add(IncreamentCounterAsif());
                  },
                  child: Text("increament")),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<CounterBlocAsif>()
                        .add(DecreamentCounterAsif());
                  },
                  child: Text("decreament")),
            ],
          ),
        ],
      ),
    );
  }
}
