import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrimaryScaffold extends StatelessWidget {
  final Widget body;
  final String currentLocation;

  const PrimaryScaffold({
    super.key,
    required this.body,
    required this.currentLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          // Sidebar
          Padding(
            padding: const EdgeInsets.all(10),
            child: Material(
              color: const Color.fromARGB(125, 39, 32, 32),
              child: Container(
                width: 250,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        const CircleAvatar(
                          backgroundImage: AssetImage("assets/images/logo.jpg"),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "PGMASTER",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Manager",
                              style: TextStyle(
                                color: Colors.grey.shade50,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Divider(color: Colors.deepOrange),
                    ListTile(
                     leading: Icon(
  Icons.dashboard_outlined,
  color: currentLocation == '/dashboard'
      ? Colors.black
      : Colors.blueGrey,
),
                      title: const Text(
                        "Dashboard",
                        style: TextStyle(
                          color: Color.fromARGB(255, 185, 182, 182),
                        ),
                      ),
                      selected: currentLocation == '/dashboard',
                      selectedTileColor: Colors.deepOrange,
                      onTap: () {
                        context.go('/dashboard');
                      },
                    ),
                    ListTile(
                     leading: Icon(
  Icons.people_outlined,
  color: currentLocation == '/tenants'
      ? Colors.black
      : Colors.blueGrey,
),
                      title: const Text(
                        "Tenants",
                        style: TextStyle(
                          color: Color.fromARGB(255, 185, 182, 182),
                        ),
                      ),
                      selected: currentLocation == '/tenants',
                      selectedTileColor: Colors.deepOrangeAccent,
                      onTap: () {
                        context.go('/tenants');
                      },
                    ),
                    ListTile(
                       leading: Icon(
    Icons.payment_outlined,
    color: currentLocation == '/fees'
        ? Colors.black
        : Colors.blueGrey,
  ),
                      title: const Text(
                        "Fees Collection",
                        style: TextStyle(
                          color: Color.fromARGB(255, 185, 182, 182),
                        ),
                      ),
                      selected: currentLocation == '/fees',
                      selectedTileColor: Colors.deepOrange,
                      onTap: () {
                        context.go('/fees');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: body),
        ],
      ),
    );
  }
}