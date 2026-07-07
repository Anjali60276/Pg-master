import 'package:flutter/material.dart';
import 'package:pgmaster/pages/Dashboard_page.dart';
import 'package:pgmaster/pages/Fee_collection.dart';
import 'package:pgmaster/pages/Tenants_page.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (selectedIndex) {
      case 0:
        page = const DashboardPage();
        break;
      case 1:
        page = TenantsPage();
        break;
      case 2:
        page =  FeesCollectionPage();
        break;
      default:
        page = const DashboardPage();
    }

    return Scaffold(
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
                          backgroundImage:
                              AssetImage("assets/images/logo.jpg"),
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
                      leading: const Icon(
                        Icons.dashboard_outlined,
                        color: Colors.black,
                      ),
                      title: const Text(
                        "Dashboard",
                        style: TextStyle(
                          color: Color.fromARGB(255, 185, 182, 182),
                        ),
                      ),
                      selected: selectedIndex == 0, // switching one index means to dashboard
                      selectedTileColor: Colors.deepOrange,
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                    ),

                    ListTile(
                      leading: const Icon(
                        Icons.people_outline,
                        color: Colors.black,
                      ),
                      title: const Text(
                        "Tenants",
                        style: TextStyle(
                          color: Color.fromARGB(255, 185, 182, 182),
                        ),
                      ),
                      selected: selectedIndex == 1,
                      selectedTileColor: Colors.deepOrangeAccent,
                      onTap: () {
                        setState(
                          () {
                          selectedIndex = 1;
                        });
                      },
                    ),

                    ListTile(
                      leading: const Icon(
                        Icons.payment_outlined,
                        color: Colors.black,
                      ),
                      title: const Text(
                        "Fees Collection",
                        style: TextStyle(
                          color: Color.fromARGB(255, 185, 182, 182),
                        ),
                      ),
                      selected: selectedIndex == 2,
                      selectedTileColor: Colors.deepOrange,
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Content Area
          Expanded(
            child: page,
          ),
        ],
      ),
    );
  }
}

