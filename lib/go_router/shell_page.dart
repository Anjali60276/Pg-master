import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellPage extends StatelessWidget {
  final Widget child;
  const ShellPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    //to get the current route (URL path) from GoRouter.
    //If the current page is /dashboard → location becomes "/dashboard"
    // If the current page is /tenants → location becomes "/tenants"
    // If the current page is /fees → location becomes "/fees"
    // Used to identify which page is currently active
    // Get the current route path (e.g., /dashboard, /tenants, /fees)
    final String location = GoRouterState.of(context).uri.path;
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
                      // switching one index means to dashboard
                      selected: location == '/dashboard',
                      selectedTileColor: Colors.deepOrange,
                      onTap: () {
                        context.go('/dashboard'); //its call the dasboard pages
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

                      selected:
                          location == '/tenants', //its called the tenants page
                      selectedTileColor: Colors.deepOrangeAccent,
                      onTap: () {
                        context.go(
                          '/tenants',
                        ); //here its route connected and calling function of router
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

                      //it can highlight item if the current routes is fes or not
                      selected: location == '/fees',
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

          Expanded(child: child),

          // Content Area
        ],
      ),
    );
  }
}
