import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:panda/screens/details/details_screen.dart';
import 'package:panda/screens/list/list_bloc.dart';
import 'package:panda/widgets/result_widget.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late final ListBloc bloc = context.read();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      bloc.add(ListAction.filter(controller.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Screen'),
        actions: [
          TextButton(
            onPressed: () {
              bloc.add(ListAction.reset());
            },
            child: const Text('Reset'),
          ),
        ],
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return BlocBuilder<ListBloc, ListState>(builder: (ctx, state) {
      return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              ResultWidget(
                success: state.successAttempts,
                failed: state.failedAttempts,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.search),
                  ),
                  controller: controller,
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (ctx, index) {
                  final item = state.items[index];
                  return listItem(item, () {
                    final entry = state.attempts.entries.firstWhere(
                        (entry) => entry.key.studentId == item.studentId);
                    context.go('/details',
                        extra: DetailsArgs(
                            student: entry.value, showInfo: entry.key.success));
                  });
                },
                itemCount: state.items.length,
              )),
            ],
          ));
    });
  }

  Widget listItem(AttemptItem item, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      leading: item.image.isEmpty
          ? const Icon(
              Icons.person,
              size: 40,
              color: Colors.grey,
            )
          : Image.network(
              item.image,
              height: 40,
              width: 40,
              fit: BoxFit.scaleDown,
            ),
      title: Text(item.studentName),
      subtitle: Text('Attempts: ${item.attempts}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: item.isSuccess
            ? [const Icon(Icons.check_circle, color: Colors.green, size: 36)]
            : [
                IconButton(
                    onPressed: () {
                      bloc.add(ListAction.tryAgain(item.studentId));
                      context.go('/home');
                    },
                    icon: const Icon(Icons.refresh,
                        color: Colors.grey, size: 36)),
                const Icon(Icons.cancel, color: Colors.red, size: 36),
              ],
      ),
    );
  }
}
