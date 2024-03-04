// ignore_for_file: prefer_final_fields, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, avoid_print, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapp1/constant/Appcolors.dart';
import 'package:getapp1/cubit/post/post1_cubit.dart';
import 'package:getapp1/model/post_one.dart';

class PostOne extends StatefulWidget {
  const PostOne({super.key});

  @override
  State<PostOne> createState() => _PostOneState();
}

class _PostOneState extends State<PostOne> {
  TextEditingController _textEditingController = TextEditingController();
  bool dataPostedSuccessfully = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          title: const Text('Post One'),
          backgroundColor: AppColors.backgroundColor),
      body: BlocBuilder<PostOneCubit, PostOneState>(
        builder: (context, state) {
          if (state is PostOneLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostOneSuccess) {
            return Column(
              children: [
                const Center(
                  child: Text(
                    'Data posted successfully!',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<PostOneCubit>()
                          .emit(PostOneLoaded(PostOneModel()));

                      _textEditingController.clear();
                    },
                    child: const Text("Try Again"))
              ],
            );
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    labelText: 'Id',
                    hintText: 'Enter Id',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String enterid = _textEditingController.text.trim();
                  if (enterid.isNotEmpty) {
                    int idPost = int.tryParse(enterid) ?? 0;
                    context.read<PostOneCubit>().postOneData(idPost);
                  } else {
                    context.read<PostOneCubit>().emit(PostOneError(
                          'Fail..! Please Enter Id '.toString(),
                          PostOneModel(),
                        ));
                  }
                },
                child: const Text("Post"),
              ),
              if (state is PostOneSuccess)
                const Center(
                  child: Text(
                    'Data posted successfully!',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              if (state is PostOneError)
                Center(
                  child: Text(state.errorMessage.toString()),
                ),
            ],
          );
        },
      ),
    );
  }
}
