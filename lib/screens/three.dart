import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapp1/constant/Appcolors.dart';
import 'package:getapp1/cubit/three/three_cubit.dart';
import 'package:getapp1/screens/delete.dart';
import 'package:url_launcher/url_launcher.dart';

class Three extends StatefulWidget {
  const Three({super.key});

  @override
  State<Three> createState() => _ThreeState();
}

class _ThreeState extends State<Three> {
  @override
  void initState() {
    context.read<ThreeCubit>().threeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text("Get Api Three"),
      ),
      body: BlocBuilder<ThreeCubit, ThreeState>(
        builder: (context, state) {
          if (state is ThreeLoading) {
            return const Center(
              child: CircularProgressIndicator(backgroundColor: Colors.amber),
            );
          } else if (state is ThreeLoaded) {
            var data = state.threeModel!.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                // ignore: unused_local_variable
                var data = state.threeModel!.data![index];
                return ListTile(
                    subtitle: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.amber,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data.id.toString()),
                      Text(data.firstName.toString()),
                      Text(data.lastName.toString()),
                      Text(data.email.toString()),
                      GestureDetector(
                          onTap: () {
                            String url = data.avatar.toString();
                            // ignore: deprecated_member_use
                            launch(url);
                          },
                          child: Text(
                            data.avatar.toString(),
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Delete(),
                                ));
                          },
                          child: const Text("Next")),
                    ],
                  ),
                ));
              },
            );

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(state.threeModel!.data!.first.avatar!.toString()),
            //     Text(data!.first.firstName.toString())
            //   ],
            // );
            // Text(state.threeModel!.data!.first.avatar!.toString());
          } else if (state is ThreeError) {
            return Center(
              child: Text(state.errorMeaage.toString()),
            );
          } else {
            return const SizedBox();
          }
          // Text(state.threeModel!.page.toString());
        },
      ),
    );
  }
}
