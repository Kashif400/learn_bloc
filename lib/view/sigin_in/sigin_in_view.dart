import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/view/sigin_in/bloc/sigin_in_bloc.dart';
import 'package:learn_bloc/view/sigin_in/bloc/sigin_in_event.dart';
import 'package:learn_bloc/view/sigin_in/bloc/sigin_in_state.dart';

class SiginInView extends StatelessWidget {
  const SiginInView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SiginInBloc, SiginInState>(builder: (context, state) {
              if (state is SiginErrorState) {
                return Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red),
                );
              } else {
                return Container();
              }
            }),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(hintText: "Enter Email Address"),
              onChanged: (value) {
                BlocProvider.of<SiginInBloc>(context).add(
                    SiginInTextChangedEvent(
                        _emailController.text, _passwordController.text));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              decoration:
                  const InputDecoration(hintText: "Enter Email Address"),
              onChanged: (value) {
                BlocProvider.of<SiginInBloc>(context).add(
                    SiginInTextChangedEvent(
                        _emailController.text, _passwordController.text));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SiginInBloc, SiginInState>(builder: (context, state) {
              return CupertinoButton(
                  color: (state is SiginValidState) ? Colors.blue : Colors.grey,
                  child: (state is SiginLoadingState)
                      ? const CircularProgressIndicator()
                      : const Text("Sign In"),
                  onPressed: () {
                    if (state is SiginValidState) {
                      BlocProvider.of<SiginInBloc>(context).add(
                          SiginSubmittedEvent(
                              _emailController.text, _passwordController.text));
                    }
                  });
            }),
          ],
        ),
      ),
    );
  }
}
