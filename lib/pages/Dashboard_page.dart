import 'package:flutter/material.dart';
import 'package:pgmaster/components/Dashboard_Cards.dart';
import 'package:pgmaster/components/Dashboard_Activitys.dart';

class DashboardPage extends StatelessWidget {
  
  const DashboardPage({super.key,
 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
               padding: const EdgeInsets.only(top: 23),
               child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                        "Dashboard",
                       style:TextStyle(
                         fontSize: 24,
                         fontWeight:FontWeight.bold,
                         color: Colors.white,
                       ),
                       ),
                       
                        Text(
              "June 2025 - 8 active rooms",
             style:TextStyle(
               fontSize: 12,
               color: Colors.grey.shade600,
             ),
             ),
          
            
                     ],
                   ),
                   
                        
            Container(
              margin: EdgeInsets.only(right: 20),
               padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade700),
        borderRadius: BorderRadius.circular(6),
      ),
         child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.calendar_today_outlined,
            size: 16,
            color: Colors.grey,
          ),
          SizedBox(width: 8),
          Text(
            "29 Jun 2025",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
         ),
            ),
                 ],
               ),
             ),
             
             SizedBox(height:4,
            ),
            
              
  
            
            
            
            // Dashboard Cards
           Row(
              children: [
              
                
                Expanded(
                  child: DashboardCards(
                    title: 'Total Tenants',
                    value: '8',
                    subtitle: 'All rooms occupied',
                    containerColor: Colors.deepOrange,
                    textColor: Colors.black54,
                  ),
                ),
                Expanded(
                  child: DashboardCards(
                    title: 'Collected Jun',
                    value: '₹48.5K',
                    subtitle: '4 of 8',
                    containerColor: Colors.grey.shade900,
                    textColor: Colors.white,
                  ),
                ),
                Expanded(
                  child: DashboardCards(
                    title: 'PENDING / DUE',
                    value: '₹47.0K',
                    subtitle: '2 overdue',
                    containerColor: Colors.grey.shade900,
                    textColor: Colors.white,
                  ),
                ),
                Expanded(
                  child: DashboardCards(
                    title: 'MAINTENANCE',
                    value: '5',
                    subtitle: 'Open requests',
                    containerColor: Colors.grey.shade900,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Recent Activity
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade700),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "RECENT ACTIVITY",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        letterSpacing: 2,
                      ),
                    ),
                  ),

                  const Divider(height: 1),

                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: activities.length,
                    separatorBuilder: (context, index) =>
                        Divider(color: Colors.grey.shade800, height: 1),
                    itemBuilder: (context, index) {
                      final item = activities[index];

                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: item.color.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                item.status,
                                style: TextStyle(
                                  color: item.color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
                            ),

                            const SizedBox(width: 15),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item.subtitle,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              item.time,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}