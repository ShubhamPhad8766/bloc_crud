  // ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapp1/constant/Appcolors.dart';
import 'package:getapp1/cubit/put/put_cubit.dart';
import 'package:getapp1/screens/delete.dart';

class PutScreen extends StatefulWidget {
  const PutScreen({super.key});

  @override
  State<PutScreen> createState() => _PutScreenState();
}

class _PutScreenState extends State<PutScreen> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController avatarController = TextEditingController();
  final TextEditingController createAtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cyanColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.cyanColor,
        title: const Text(
          "Update Api",
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<PutCubit, PutState>(
          builder: (context, state) {
            if (state is PutLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PutSucces) {
              return Column(
                children: [
                  const Center(child: Text("Data Update Successfully")),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PutCubit>().emit(PutLoaded());
                      avatarController.clear();
                      createAtController.clear();
                      idController.clear();
                      nameController.clear();
                    },
                    child: const Text("Fetch Data Again "),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Delete(),
                        ),
                      );
                    },
                    child: const Text("Click Me to Next"),
                  ),
                ],
              );
            } else {
              return Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: idController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText: 'ID',
                        hintText: 'Enter A Id'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText: 'Name',
                        hintText: 'Enter Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: avatarController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText: 'Avatar',
                        hintText: 'Enter Avatar Link'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: createAtController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText: 'CreatAt',
                        hintText: 'Enter CrateAt Number '),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      final int? id = int.tryParse(idController.text);
                      final String name = nameController.text;
                      final String avatar = avatarController.text;
                      final int? createdAt =
                          int.tryParse(createAtController.text);
                      if (id == null ||
                          name.isEmpty ||
                          avatar.isEmpty ||
                          createdAt == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill in all fields'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        final Map<String, dynamic> updateData = {
                          "name": name,
                          "avatar": avatar,
                          "creatAt": createdAt,
                        };
                        context.read<PutCubit>().putData(id, updateData);
                      }
                    },
                    child: const Text("Update Data"),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Delete(),
                      ),
                    );
                  },
                  child: const Text("Click ME To Go On Next Page"),
                ),
                if (state is PutError)
                  const Text(
                    'Data not found in the API..! Please Change Id',
                    style: TextStyle(color: Colors.red),
                  ),
              ]);
            }
          },
        ),
      ),
    );
  }
}
