import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key, required this.success, required this.failed});

  final int success;
  final int failed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: _resultField('Total', success + failed)),
        const SizedBox(
          width: 16,
        ),
        Expanded(child: _resultField('Success', success)),
        const SizedBox(
          width: 16,
        ),
        Expanded(child: _resultField('Failed', failed)),
      ],
    );
  }

  Widget _resultField(String text, int value) {
    return Container(
      decoration:
          BoxDecoration(color: Colors.grey.shade300, border: Border.all()),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            '$value',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
