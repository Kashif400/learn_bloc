import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/asif%20learn%20bloc/switch%20and%20slider/switch_bloc_asif.dart';
import 'package:learn_bloc/asif%20learn%20bloc/switch%20and%20slider/switch_event_asif.dart';
import 'package:learn_bloc/asif%20learn%20bloc/switch%20and%20slider/switch_state_asif.dart';

class SwitchViewAsif extends StatelessWidget {
  const SwitchViewAsif({super.key});

  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Notification"),
              BlocBuilder<SwitchBlocAsif, SwitchStateAsif>(
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    print("notification build");
                    return Switch(
                        value: state.isSwitch,
                        onChanged: (value) {
                          context
                              .read<SwitchBlocAsif>()
                              .add(EnableOrDisabledNotification());
                        });
                  })
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          BlocBuilder<SwitchBlocAsif, SwitchStateAsif>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                print("Slider Container builder ");
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.red.withOpacity(state.slider),
                );
              }),
          const SizedBox(
            height: 40,
          ),
          BlocBuilder<SwitchBlocAsif, SwitchStateAsif>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                print("Slider build");
                return Slider(
                    value: state.slider,
                    onChanged: (value) {
                      context
                          .read<SwitchBlocAsif>()
                          .add(SliderEvent(slider: value));
                    });
              })
        ],
      ),
    );
  }
}
