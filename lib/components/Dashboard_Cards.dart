import 'package:flutter/material.dart';


//here anjali i will be add data model like class Activity it always below the import and above the class DashboardCards extends StatelessWidget {

class DashboardCards extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color containerColor;
  final Color? textColor;
  final Icon? rupeesIcon;


  const DashboardCards({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.containerColor,
    this.textColor,
    this.rupeesIcon,
    
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.all(10),
      child: Container(
        margin: const EdgeInsets.all(12),
        height: 100,
        width: 200,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: containerColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 13,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 11,
              ),
            ),

          
          ],
        ),
      ),
    );
  }
}

// Add the list right here, completely outside the widget classes
