import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panda/screens/home/home_bloc.dart';
import 'package:panda/screens/list/list_bloc.dart';

import 'navigation/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    final child = MaterialApp.router(
      title: 'HP',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (BuildContext context) => HomeBloc(),
      ),
      BlocProvider(
        create: (BuildContext context) => ListBloc(),
      ),
    ], child: child);
  }
}
