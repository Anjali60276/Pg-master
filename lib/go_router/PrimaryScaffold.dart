import 'package:flutter/material.dart';

class PrimaryScaffold extends StatelessWidget {

  final Widget body;

  const PrimaryScaffold({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: body,
    );

  }

}