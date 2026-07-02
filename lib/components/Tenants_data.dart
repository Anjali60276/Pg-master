import 'package:flutter/material.dart';
class Tenant {
  final String? name;
  final String? Room;
  final String? phoneno; 
  final String? Since;
  final String? rent;
  final Icon? rupeesIcon;
    final String status;
  
  

  Tenant({
   this.name,
   this.Room,
    this.phoneno,
    this.Since,
    this.rent,
    this.rupeesIcon,
      required this.status,});


}
List<Tenant> tenants = [
  Tenant(
    name: 'Arjun Mehta',
    Room: 'A - 101',
    phoneno: '98765 43210',  
    Since: 'Jan 2024',
    rent: '₹ 5,000', 
    status: 'ACTIVE',
  ),
  
    Tenant(
    name: "Priya Sharma",
    Room: "A-102",
    phoneno: "87654 32109",
    Since: "Mar 2024",
    rent: "₹11,500",
    status: "ACTIVE",
  ),
  
  
    Tenant(
    name: "Rahul Verma",
    Room: "A-201",
    phoneno: "76123 45678",
    Since: "Feb 2024",
    rent: "₹13,000",
    status: "ACTIVE",
  ),
  
    Tenant(
    name: "Sneha Patil",
    Room: "B-202",
    phoneno: "65432 10987",
    Since: "Apr 2024",
    rent: "₹11,000",
    status: "ACTIVE",
  ),
  
  
    Tenant(
    name: "karthik Nair",
    Room: "C-301",
    phoneno: "54321 09876",
    Since: "Dec 2024",
    rent: "₹14,000",
    status: "NOTICE",
  ),
  
  
    Tenant(
    name: "Divya Iyer",
    Room: "C-302",
    phoneno: "43210 98765",
    Since: "May 2024",
    rent: "₹12,000",
    status: "ACTIVE",
  ),
  
  
    Tenant(
    name: "Suresh Kumar",
    Room: "D-401",
    phoneno: "32109 87654",
    Since: "Jun 2024",
    rent: "₹10,500",
    status: "ACTIVE",
  ),
  
  
    Tenant(
    name: "Anjali Singh",
    Room: "D-102",
    phoneno: "21098 76543",
    Since: "Jul 2024",
    rent: "₹11,000",
    status: "ACTIVE",
  ),
];






