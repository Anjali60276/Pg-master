import 'fee_model.dart';

class FeeModel {
  final String name;
  final String room;
  final String month;
  final String? amount;
  final String? status;
  final String? action;

  FeeModel({
    required this.name,
    required this.room,
    required this.month,
     this.amount,
    this.status,
    this.action,
  });
}

List<FeeModel> fee = [

  FeeModel(
    name: "Arjun Mehta",
    room: "A-101",
    month: "Jun 2025",
    amount: "₹12,000",
    status: "PAID",
    action: "2025-06-03",
  ),

  FeeModel(
    name: "Priya Sharma",
    room: "A-102",
    month: "Jun 2025",
    amount: "₹11,500",
    status: "PENDING",
    action: "MARK PAID",
  ),
  
  FeeModel(name: "RahulVerma",
   room: "B-201",
    month: "Jun 2025",
    amount: "₹13,000",
    status: "PAID",
    action:"2025-06-04",
    ),
    
      FeeModel(name: "Sneha Patil",
   room: "B-202",
    month: "Jun 2025",
    amount: "₹11,000",
    status: "OVERDUE",
    action:"MARK PAID",
    ),
    
      FeeModel(name: "Karthik Nair",
   room: "C-301",
    month: "Jun 2025",
    amount: "₹14,000",
    status: "OVERDUE",
    action:"MARK PAID",
    ),
    
      FeeModel(name: "Diya Iyer",
   room: "C-302",
    month: "Jun 2025",
    amount: "₹12,000",
    status: "PAID",
    action:"2025-06-02",
    ),


  FeeModel(name: "Suresh Kumar",
   room: "D-401",
    month: "Jun 2025",
    amount: "₹12,500",
    status: "PENDING",
    action:"MARK PAID",
    ),
    
      FeeModel(name: "Anjali Singh",
   room: "D-402",
    month: "Jun 2025",
    amount: "₹11,000",
    status: "PAID",
    action:"2025-06-01",
    ),
   
];