import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/Repository/favourite_repository.dart';
import 'package:learn_bloc/asif%20learn%20bloc/counter/counter_bloc_asif.dart';
import 'package:learn_bloc/asif%20learn%20bloc/favourite/favourite_bloc.dart';
import 'package:learn_bloc/asif%20learn%20bloc/image%20picker/image_picker_asif_bloc.dart';
import 'package:learn_bloc/asif%20learn%20bloc/post%20Api/post_bloc.dart';
import 'package:learn_bloc/asif%20learn%20bloc/switch%20and%20slider/switch_bloc_asif.dart';
import 'package:learn_bloc/asif%20learn%20bloc/todo/todo_bloc.dart';
import 'package:learn_bloc/bloc/internet/internet_bloc.dart';
import 'package:learn_bloc/cubits/internet%20cubit/internet_cubit.dart';
import 'package:learn_bloc/utils/image_picker_utils.dart';
import 'package:learn_bloc/view/internet_connectivity_view.dart';
import 'package:learn_bloc/view/sigin_in/bloc/sigin_in_bloc.dart';

import 'bloc/api_services.dart';
import 'view/asif taj/counter_view_asif.dart';
import 'view/asif taj/favourite_view.dart';
import 'view/asif taj/image_picker_view_asif.dart';
import 'view/asif taj/login_view.dart';
import 'view/asif taj/post_view.dart';
import 'view/asif taj/switch_view_asif.dart';
import 'view/asif taj/todo_view.dart';
import 'view/sigin_in/sigin_in_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBlocAsif()),
          BlocProvider(create: (_) => SwitchBlocAsif()),
          BlocProvider(create: (_) => ImagePickerAsifBloc(ImagePickerUtils())),
          BlocProvider(create: (_) => TodoBloc()),
          BlocProvider(create: (_) => FavouriteBloc(FavouriteRepository())),
          BlocProvider(create: (_) => PostBloc()),
        ],
        child: const MaterialApp(
          title: 'Flutter Demo',
          home: LoginView(),
        ));
  }
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // Initialize AuthService instance
  final AuthService _authService = AuthService();

  // Register API call
  void registerApi() async {
    AuthService.registerUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Center(
        child: ElevatedButton(
          onPressed: registerApi,
          child: const Text("Register"),
        ),
      ),
    );
  }
}
