import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapp1/constant/Appcolors.dart';
import 'package:getapp1/cubit/second/second_cubit.dart';
import 'package:getapp1/screens/post_one.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  void initState() {
    context.read<SecondCubit>().secondData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        title: const Text("Ashish Sir Get Api"),
      ),
      body: BlocBuilder<SecondCubit, SecondState>(
        builder: (context, state) {
          if (state is SecondLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SecondLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final data = state.secondModel?.entries?[index];
                return ListTile(
                  subtitle: Container(
                    color: Colors.redAccent,
                    padding: const EdgeInsets.all(10),
                    child: DefaultTextStyle(
                      style: const TextStyle(color: Colors.yellow),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data!.api.toString()),
                            Text(data.description.toString()),
                            Text(data.auth.toString()),
                            Text(data.https.toString()),
                            Text(data.cors.toString()),
                            Text(
                              data.link.toString(),
                              style: const TextStyle(color: Colors.blue),
                            ),
                            Text(data.category.toString()),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const PostOne(),
                                      ));
                                },
                                child: const Text("Next")),
                          ]),
                    ),
                  ),
                );
              },
            );
          } else if (state is SecondError) {
            return Text(state.errorMessage.toString());
          }
          return Container();
        },
      ),
    );
  }
}
