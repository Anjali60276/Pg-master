import 'package:flutter/material.dart';
import 'package:pgmaster/components/Tenants_data.dart';

// ignore: must_be_immutable
class TenantsPage extends StatelessWidget {
  final List<Tenant> _data = List.from(
    tenants,
  ); // Create a copy of the tenants list
  TenantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Side
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tenants",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "8 registered residents",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    // Right Side Button
                    ElevatedButton.icon(
                      onPressed: () {
                        //dailog box
                        _showAddTenantDialog(context);
                      },
                      icon: const Icon(Icons.add, color: Colors.black),
                      label: const Text(
                        "Add Tenant",
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
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                    //
                    //
                    //Add
                    //some spacing between the button and the bottom edge
                  ],
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  width: 400,
                  height: 40,
                  padding: EdgeInsets.only(left: 18),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 28, 28, 28),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade700),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey.shade500, size: 20),

                      SizedBox(width: 8),
                      Text(
                        "Search by name or room...",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                ),
              ),

              //      Divider(
              //   color: Colors.grey.shade700,
              //   thickness: 1,
              //   height: 40,
              // ),
              const SizedBox(height: 20),

              LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: constraints.maxWidth,
                        ),
                        child: DataTable(
                          headingRowHeight: 59.0,
                          dataRowMinHeight: 48.0,
                          dataRowMaxHeight: 54.0,
                          // Set the width of each data row
                          columnSpacing: 10.0, // Space between columns
                          horizontalMargin: 19.0,
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Create the functions which is going to return the a list of data Column
  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Name')),
      DataColumn(label: Text('Room')),
      DataColumn(label: Text('Phone No.')),
      DataColumn(label: Text('Since')),
      DataColumn(label: Text('Rent')),
    ];
  }

  List<DataRow> _createRows() {
    return _data.map((e) {
      return DataRow(
        cells: [
          DataCell(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(e.name.toString()),

                SizedBox(height: 3),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: e.status == 'ACTIVE'
                        ? Colors.green.shade500
                        : Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    e.status,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          DataCell(Text(e.Room.toString())),
          DataCell(Text(e.phoneno.toString())),
          DataCell(Text(e.Since.toString())),
          DataCell(Text(e.rent.toString())),
        ],
      );
    }).toList();
  }
}

void _showAddTenantDialog(BuildContext context) {
  final scaffoldContext = context;
  final formKey = GlobalKey<FormState>();
  final joinDateController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 600,
          height: 600,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "New Tenants",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            "Fill in the details to register a resident",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),

                      //here space between work
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Divider(
                    color: Colors.grey.shade700,
                    thickness: 1,
                    // endIndent: 20,
                    height: 20,
                  ),

                  const SizedBox(height: 20),

                  //TextFormFields start here
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              " Full Name",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),

                            const SizedBox(height: 8),

                            TextFormField(
                              obscureText: false,
                              //using if statement
                              validator: (value) {
                                if(value == null || value.trim().isEmpty){
                                  return "Please enter full name";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'e.g. Anjali Singh',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                                filled: true,
                                fillColor: const Color.fromARGB(
                                  255,
                                  28,
                                  28,
                                  28,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              " Room No.",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            TextFormField(
                              obscureText: false,
                               validator: (value) {
                                if(value == null || value.trim().isEmpty){
                                  return "Please enter you room no ";
                                } 
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'e.g. D-402',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                ),

                                filled: true,
                                fillColor: const Color.fromARGB(
                                  255,
                                  28,
                                  28,
                                  28,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              " Phone No.",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                               validator: (value) {
                                if(value == null || value.trim().isEmpty){
                                  return "Please enter phone no";
                                } if (value.length != 10) {
                                  return "Phone no must be 10 digits";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "10-digit mobile",
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                                filled: true,
                                fillColor: const Color(0xFF1E1E1E),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 20),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Gender",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),

                            DropdownButtonFormField<String>(
                              // isExpanded: true,
                              
                              
                               validator: (value) {
                                if(value == null ){
                                  return "Please select one";
                                } 
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Select..",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                filled: true,
                                fillColor: const Color(0xFF1E1E1E),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: "Male",
                                  child: Text("Male"),
                                ),
                                DropdownMenuItem(
                                  value: "Female",
                                  child: Text("Female"),
                                ),
                                DropdownMenuItem(
                                  value: "Other",
                                  child: Text("Other"),
                                ),
                              ],
                              onChanged: (String? value) {
                                // Handle gender selection
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "JOIN DATE",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 4),

                            TextFormField(
                               validator: (value) {
                                if(value == null || value.trim().isEmpty){
                                  return "Select join date";
                                } 
                                return null;
                              },
                              controller: joinDateController,
                              readOnly: true,

                              onTap: () async {
                                final DateTime? pickedDate =
                                    await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2026),
                                      lastDate: DateTime(2100),
                                    );
                                if (pickedDate != null) {
                                  joinDateController.text =
                                      "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                                }
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFF1E1E1E),
                                hintText: 'dd-mm-yyyy',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),

                                suffixIcon: Icon(Icons.calendar_today_outlined),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 20),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              " MONTHLY RENT",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 4),

                            TextFormField(
                               validator: (value) {
                                if(value == null || value.trim().isEmpty){
                                  return "Enter rent payment";
                                } 
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "e.g 12000",
                                filled: true,
                                fillColor: const Color(0xFF1E1E1E),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Divider(height: 3, endIndent: 20),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ID PROOF TYPE",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),

                            const SizedBox(height: 6),

                            DropdownButtonFormField<String>(
                              // isExpanded: true,
                               validator: (value) {
                                if(value == null  ){
                                  return "Please select one";
                                } 
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Select..",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                filled: true,
                                fillColor: const Color(0xFF1E1E1E),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: "Aadhar",
                                  child: Text("Aadhar"),
                                ),
                                DropdownMenuItem(
                                  value: "Voter id",
                                  child: Text("Voter id"),
                                ),
                                DropdownMenuItem(
                                  value: "Passport",
                                  child: Text("Passport"),
                                ),
                                DropdownMenuItem(
                                  value: "Driving License",
                                  child: Text("Driving License"),
                                ),
                              ],
                              onChanged: (String? value) {
                                // Handle gender selection
                              },
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ID Number",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            TextFormField(
                               validator: (value) {
                                if(value == null || value.trim().isEmpty){
                                  return "Enter your id man";
                                } 
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter ID number",
                                filled: true,
                                fillColor: const Color(0xFF1E1E1E),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Emergency Contact",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            TextFormField(
                               validator: (value) {
                                if(value == null || value.trim().isEmpty){
                                  return "Dont Forget to add emergency number ";
                                } 
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter Emergency number",
                                filled: true,
                                fillColor: const Color(0xFF1E1E1E),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 450,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  if(formKey.currentState!.validate()){
                                  Navigator.pop(context);
                                  // Close the dialog first

                                  ScaffoldMessenger.of(
                                    scaffoldContext,
                                  ).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Tenant registered successfully!",
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.deepOrange,
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepOrange,
                                  foregroundColor: Colors.black,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),

                                child: Text(
                                  "Registered the Tenants",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () => {Navigator.pop(context)},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black38,
                                foregroundColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),

                              child: Text(
                                "Close",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
