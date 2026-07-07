// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pgmaster/components/fee_data.dart';
import 'package:pgmaster/components/fee_model.dart';

class FeesCollectionPage extends StatefulWidget {
  FeesCollectionPage({super.key});

  @override
  State<FeesCollectionPage> createState() => _FeesCollectionPageState();
}

class _FeesCollectionPageState extends State<FeesCollectionPage> {
  String selectedFilter = "ALL";

  List<FeeModel> get filteredFees {
    if (selectedFilter == "ALL") {
      return fee;
    }
    // its means if we click the all then items of fees should b called here
    return fee.where((item) => item.status == selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fee Collection",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 1),

                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "June 2025 billing cycle",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                      ],
                    ),

                    ElevatedButton.icon(
                      onPressed: () {
                        //dailog box
                      },
                      icon: const Icon(
                        Icons.currency_rupee,
                        color: Colors.black,
                      ),
                      label: const Text(
                        "Record Payment",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 4),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: FeesCard(
                        title: 'COLLECTED',
                        value: '48,500',
                        subtitle: '4 tenants',
                        containerColor: Colors.grey.shade800,
                        textColor: Colors.lightGreenAccent,
                        rupeesIcon: const Icon(
                          Icons.currency_rupee,
                          size: 18,
                          color: Colors.lightGreenAccent,
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: FeesCard(
                        title: "PENDING",
                        value: '47,000',
                        subtitle: '4 tenants',
                        containerColor: Colors.grey.shade800,
                        textColor: Colors.amber.shade600,
                        rupeesIcon: const Icon(
                          Icons.currency_rupee,
                          size: 18,
                          color: Colors.amber,
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: FeesCard(
                        title: "COLLECTION RATE",
                        value: '51%',
                        subtitle: '',
                        containerColor: Colors.grey.shade800,
                        textColor: Colors.deepOrange.shade400,
                        rupeesIcon: null,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 6),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        // ALL
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFilter = "ALL";
                            });
                          },
                          child: Container(
                            height: 36,
                            width: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selectedFilter == "ALL"
                                  ? Colors.deepOrange
                                  : Colors
                                        .transparent, // here using ternary operatorr condition ? expression_if_true : expression_if_false;

                              border: Border.all(color: Colors.grey.shade700),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              "ALL",
                              style: TextStyle(
                                color: selectedFilter == "ALL"
                                    ? Colors.black
                                    : Colors.blueGrey,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 13),

                        // PAID
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFilter = "PAID";
                            });
                          },
                          child: Container(
                            height: 36,
                            width: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selectedFilter == "PAID"
                                  ? Colors.deepOrange
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.grey.shade700),
                            ),
                            child: Text(
                              "PAID",
                              style: TextStyle(
                                color: selectedFilter == "PAID"
                                    ? Colors.black
                                    : Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 13),

                        // PENDING
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFilter = "PENDING";
                            });
                          },
                          child: Container(
                            height: 36,
                            width: 90,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selectedFilter == "PENDING"
                                  ? Colors.deepOrange
                                  : Colors.transparent,
                              border: Border.all(color: Colors.grey.shade700),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              "PENDING",
                              style: TextStyle(
                                color: selectedFilter == "PENDING"
                                    ? Colors.black
                                    : Colors.blueGrey,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 13),

                        // OVERDUE
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFilter = "OVERDUE";
                            });
                          },
                          child: Container(
                            height: 36,
                            width: 90,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selectedFilter == "OVERDUE"
                                  ? Colors.deepOrange
                                  : Colors.transparent,
                              border: Border.all(color: Colors.grey.shade700),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              "OVERDUE",
                              style: TextStyle(
                                color: selectedFilter == "OVERDUE"
                                    ? Colors.black
                                    : Colors.blueGrey,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),

                child: SizedBox(
                  width: double.infinity,

                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        dividerThickness: 0,
                        horizontalMargin: 12,

                        // Set the width of each data row
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 28, 28, 28),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey.shade700),
                        ),
                        columns: _createColumns(),
                        rows: _createRows(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: Text('TENANTS', style: TextStyle(color: Colors.blueGrey)),
      ),
      DataColumn(
        label: Text('ROOM', style: TextStyle(color: Colors.blueGrey)),
      ),
      DataColumn(
        label: Text('MONTH', style: TextStyle(color: Colors.blueGrey)),
      ),
      DataColumn(
        label: Text('AMOUNT', style: TextStyle(color: Colors.blueGrey)),
      ),
      DataColumn(
        label: Text('STATUS', style: TextStyle(color: Colors.blueGrey)),
      ),
      DataColumn(
        label: Text('ACTION', style: TextStyle(color: Colors.blueGrey)),
      ),
    ];
  }

  List<DataRow> _createRows() {
    Color _statusBackground(String status) {
      switch (status) {
        case "PAID":
          return Colors.green.withOpacity(0.2);

        case "PENDING":
          return Colors.orange.withOpacity(0.2);

        case "OVERDUE":
          return Colors.red.withOpacity(0.2);

        default:
          return Colors.grey.withOpacity(0.2);
      }
    }

    Color _statusTextColor(String status) {
      switch (status) {
        case "PAID":
          return Colors.greenAccent;

        case "PENDING":
          return Colors.amber;

        case "OVERDUE":
          return Colors.redAccent;

        default:
          return Colors.white;
      }
    }

    return filteredFees.map((e) {
      return DataRow(
        cells: [
          DataCell(
            SizedBox(
              width: 220,
              child: Text(
                e.name.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          //adding another cells for row
          DataCell(SizedBox(width: 220, child: Text(e.room.toString()))),

          DataCell(SizedBox(width: 220, child: Text(e.month.toString()))),

          DataCell(SizedBox(width: 110, child: Text(e.amount.toString()))),

          DataCell(
             SizedBox(
                width: 130,
                child: Center(
                  child: Container(
                    constraints:  BoxConstraints(minWidth: 50, minHeight: 10),
                  
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: _statusBackground(e.status!),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "${e.status}",
                      style: TextStyle(
                        color: _statusTextColor(e.status!),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
           
          ),

          DataCell(
            e.status == "PAID"
                ? SizedBox(
                    width: 220,
                    child: Text(
                      e.action!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  )
                : OutlinedButton(
                    onPressed: () {
                      print("Mark paid");
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.deepOrange),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: const Text(
                      "Mark Paid",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
          ),
        ],
      );
    }).toList();
  }
}
