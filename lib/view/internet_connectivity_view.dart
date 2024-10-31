import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubits/internet%20cubit/internet_cubit.dart';

class InternetConnectivityView extends StatelessWidget {
  const InternetConnectivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // cubit
        child: BlocConsumer<InternetCubit, InternetCubitState>(
          listener: (context, state) {
            if (state == InternetCubitState.gained) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Internet Connected!'),
                backgroundColor: Colors.green,
              ));
            } else if (state == InternetCubitState.lost) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('not Connected!'),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (BuildContext context, state) {
            if (state == InternetCubitState.gained) {
              return const Text('Connected!');
            } else if (state == InternetCubitState.lost) {
              return const Text('not connected!');
            } else {
              return const Text('Loading...');
            }
          },
        ),

        // bloc
        // child: BlocConsumer<InternetBloc, InternetState>(
        //   listener: (context, state) {
        //     if (state is InternetGainedState) {
        //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //         content: Text('Internet Connected!'),
        //         backgroundColor: Colors.green,
        //       ));
        //     } else if (state is InternetLostState) {
        //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //         content: Text('not Connected!'),
        //         backgroundColor: Colors.red,
        //       ));
        //     }
        //   },
        //   builder: (BuildContext context, state) {
        //     if (state is InternetGainedState) {
        //       return const Text('Connected!');
        //     } else if (state is InternetLostState) {
        //       return const Text('not connected!');
        //     } else {
        //       return const Text('Loading...');
        //     }
        //   },
        // ),
        // child: BlocBuilder<InternetBloc, InternetState>(
        //   builder: (context, state) {
        //     if (state is InternetGainedState) {
        //       return const Text('Connected!');
        //     } else if (state is InternetLostState) {
        //       return const Text('not connected!');
        //     } else {
        //       return const Text('Loading...');
        //     }
        //   },
      ),
    );
  }
}
