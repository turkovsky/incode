import 'package:domain/entity/house.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panda/screens/home/home_bloc.dart';
import 'package:panda/widgets/result_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeBloc bloc = context.read();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          TextButton(
            onPressed: () {
              bloc.add(HomeAction.reset());
            },
            child: const Text('Reset'),
          ),
        ],
      ),
      body: RefreshIndicator(
        child: buildBody(),
        onRefresh: () async {
          bloc.add(HomeAction.refresh());
        },
      ),
    );
  }

  Widget buildBody() {
    return ListView(
      children: [
        BlocBuilder<HomeBloc, HomeState>(builder: (ctx, state) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                ResultWidget(
                  success: state.successAttempts,
                  failed: state.failedAttempts,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 16,
                    left: 40,
                    right: 40,
                  ),
                  child: state.currentStudent == null
                      ? const CircularProgressIndicator()
                      : state.currentStudent!.image.isEmpty
                          ? const Icon(
                              Icons.person,
                              size: 120,
                              color: Colors.grey,
                            )
                          : Image.network(state.currentStudent!.image),
                ),
                Text(state.currentStudent?.name ?? ''),
                buttons(),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget buttons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: button(House.gryffindor)),
              const SizedBox(
                width: 12,
              ),
              Expanded(child: button(House.slytherin)),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: button(House.ravenclaw)),
              const SizedBox(
                width: 12,
              ),
              Expanded(child: button(House.hufflepuff)),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: button(House.not_in_house)),
            ],
          ),
        ],
      ),
    );
  }

  Widget button(House house) {
    return GestureDetector(
      onTap: () {
        bloc.add(HomeAction.attempt(house));
      },
      child: Container(
        decoration:
            BoxDecoration(color: Colors.grey.shade300, border: Border.all()),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Text(
          house.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
