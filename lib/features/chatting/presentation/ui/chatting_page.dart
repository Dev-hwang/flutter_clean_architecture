import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChattingPage extends ConsumerStatefulWidget {
  const ChattingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChattingPageState();
}

class _ChattingPageState extends ConsumerState<ChattingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ChattingPage'),
      ),
    );
  }
}
