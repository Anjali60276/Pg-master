import 'package:flutter/material.dart';

class Activity {
  final String status;
  final Color color;
  final String title;
  final String subtitle;
  final String time;

  const Activity({
    required this.status,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.time,
  });
}

final List <Activity> activities = [
  Activity(
    status: "PAID",
    color: Colors.green,
    title: "Payment received",
    subtitle: "Anjali Singh - D-402 - ₹11,000",
    time: "2h ago",
  ),
  Activity(
    status: "OPEN",
    color: Colors.orange,
    title: "Maintenance request",
    subtitle: "Anjali Singh - D-402 - Wifi weak signal",
    time: "6h ago",
  ),
  Activity(
    status: "PAID",
    color: Colors.green,
    title: "Payment received",
    subtitle: "Divya Iyer - C-302 - ₹12,500",
    time: "1d ago",
  ),
  Activity(
    status: "OVERDUE",
    color: Colors.red,
    title: "Overdue notice sent",
    subtitle: "Karthik Nair - C-301 - ₹14,000",
    time: "2d ago",
  ),
];