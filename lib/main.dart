import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapp1/cubit/delete/delete_cubit.dart';
import 'package:getapp1/cubit/home_cubit.dart';
import 'package:getapp1/cubit/post/post1_cubit.dart';
import 'package:getapp1/cubit/put/put_cubit.dart';
import 'package:getapp1/cubit/second/second_cubit.dart';
import 'package:getapp1/cubit/three/three_cubit.dart';
import 'package:getapp1/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => SecondCubit(),
        ),
        BlocProvider(
          create: (context) => PostOneCubit(),
        ),
        BlocProvider(
          create: (context) => ThreeCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteCubit(),
        ),
        BlocProvider(
          create: (context) => PutCubit(),
        ),
      
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
