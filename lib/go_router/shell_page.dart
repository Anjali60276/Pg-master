import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pgmaster/go_router/PrimaryScaffold.dart';


class ShellPage extends StatelessWidget {
  final Widget child;
  const ShellPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Get current route location
    final String location = GoRouterState.of(context).uri.path;
    
    // Pass location and child to PrimaryScaffold
    return PrimaryScaffold(
      body: child,
      currentLocation: location,
    );
  }
}