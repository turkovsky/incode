import 'package:domain/entity/house.dart';
import 'package:domain/entity/student_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailsArgs? args = GoRouterState.of(context).extra as DetailsArgs?;
    if (args == null) {
      return Center(
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: const Text('Wrong data\nTap to return'),
        ),
      );
    }
    final student = args.student;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        context.go('/list');
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(student.name),
          leading: GestureDetector(
            onTap: () {
              context.go('/list');
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_back_ios_new),
                Text('Back'),
              ],
            ),
          ),
        ),
        body: _buildBody(student, args.showInfo),
      ),
    );
  }

  Widget _buildBody(Student student, bool showInfo) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: student.image.isEmpty
                ? const Icon(
                    Icons.person,
                    size: 120,
                    color: Colors.grey,
                  )
                : Image.network(student.image),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: showInfo
                ? [
                    Text('House: ${student.house.title}'),
                    Text('Date of birth: ${student.dateOfBirth}'),
                    Text('Actor: ${student.actor}'),
                    Text('Species: ${student.species}'),
                  ]
                : [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'ACCESS DENIED',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
          ))
        ],
      ),
    );
  }
}

class DetailsArgs {
  final Student student;
  final bool showInfo;

  DetailsArgs({
    required this.student,
    required this.showInfo,
  });
}
