// ignore_for_file: prefer_final_fields, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapp1/constant/Appcolors.dart';
import 'package:getapp1/cubit/delete/delete_cubit.dart';
import 'package:getapp1/cubit/home_cubit.dart';
import 'package:getapp1/screens/post_one.dart';

class Delete extends StatefulWidget {
  const Delete({Key? key}) : super(key: key);

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  TextEditingController _editingController = TextEditingController();
  late int idtodelete;
  @override
  void initState() {
    context.read<DeleteCubit>().deleteData();
    context.read<HomeCubit>().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pinkColor,
      appBar: AppBar(
          backgroundColor: AppColors.pinkColor,
          title: const Text('Deleting Data')),
      body: BlocBuilder<DeleteCubit, DeleteState>(
        builder: (context, state) {
          if (state is DeleteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DeleteLoaded) {
            return Center(
              child: Column(children: [
                const Center(
                    child: Text(
                  'Data Deleted successfully!',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                )),
                ElevatedButton(
                    onPressed: () {
                      _editingController.clear();
                      context.read<DeleteCubit>().deleteData(id: 0);
                    },
                    child: const Text("Ok")),
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PostOne(),
                          ));
                    },
                    child: const Text("Click Me To Go Next.."))
              ]),
            );
          } else if (state is DeleteError) {
            return Center(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _editingController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Id',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    String enteredId = _editingController.text;

                    if (enteredId.isNotEmpty) {
                      int? idToDelete = int.tryParse(enteredId);

                      if (idToDelete != null) {
                        context.read<DeleteCubit>().deleteData(id: idToDelete);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Invalid ID format. Please enter a valid integer.',
                            ),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter an ID before deleting.'),
                        ),
                      );
                    }
                  },
                  child: const Text("Delete"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _editingController.clear();

                    String enteredId = _editingController.text;
                    if (enteredId.isNotEmpty) {
                      int? idToRetry = int.tryParse(enteredId);
                      if (idToRetry != null) {
                        context.read<DeleteCubit>().deleteData(id: idToRetry);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Invalid ID format. Please enter a valid integer.',
                            ),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('ID Is Not Found'),
                        ),
                      );
                    }
                  },
                  child: const Text("Try Again"),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PostOne(),
                      ),
                    );
                  },
                  child: const Text("Click Me To Go Next"),
                ),
              ],
            ));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
