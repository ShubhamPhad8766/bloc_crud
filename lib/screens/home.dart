// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapp1/constant/Appcolors.dart';
import 'package:getapp1/cubit/home_cubit.dart';
import 'package:getapp1/screens/put_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<HomeCubit>().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brownColor,
      appBar: AppBar(
        backgroundColor: AppColors.brownColor,
        title: const Text(
          "Home",
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoaded) {
            return ListView.builder(
              itemCount: state.homeModel?.data?.length,
              itemBuilder: (context, index) {
                final data = state.homeModel?.data?[index];
                return ListTile(
                  leading: CircleAvatar(
                      maxRadius: 50,
                      backgroundImage: NetworkImage(
                          state.homeModel!.data![index].avatar.toString())),
                  subtitle: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        gradient:
                            LinearGradient(colors: [Colors.blue, Colors.red])),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data?.id.toString() ?? ''),
                          Text(data?.email.toString() ?? ''),
                          Text(data?.firstName.toString() ?? ''),
                          Text(data?.lastName.toString() ?? ''),
                          InkWell(
                              onTap: () {
                                _launchURL(data?.avatar);
                              },
                              child: Text(
                                data?.avatar.toString() ?? '',
                                style: const TextStyle(color: Colors.amber),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PutScreen(),
                                    ));
                              },
                              child: const Text("Next")),
                        ]),
                  ),
                );
              },
            );
          } else if (state is HomeError) {
            return Text(state.errorMessage.toString());
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

void _launchURL(String? url) async {
  if (url != null && await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}
