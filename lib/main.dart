import 'package:bloc_test/bloc/get_memes_bloc_bloc.dart';
import 'package:bloc_test/screens/routes.dart';
import 'package:bloc_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMemesBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.routeGenerator,
        initialRoute: home,
      ),
    );
  }
}
