import 'package:book_your_doctor/helpers/basic_app_btn.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting the date

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  DateTime selectedDate = DateTime.now();
  int? selectedHourIndex;

  final List<String> availableItems = [
    "09:00 AM", "09:30 AM", "10:00 AM", "10:30 AM",
    "11:00 AM", "11:30 AM", "3:00 PM", "3:30 PM",
    "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM",
  ];

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/bench.png', // Your image path
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                "Congratulations!",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: Text(
                  "Your appointment with Dr. David Patel\n is confirmed for ${DateFormat('MMMM d, yyyy').format(selectedDate)},\n at ${availableItems[selectedHourIndex!]}",
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              BasicAppBtn(
                label: "Done",
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text("Edit your appointment"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _confirm() {
    _showLoadingDialog(); // Show loading dialog
    Future.delayed(const Duration(seconds: 300), () {
      Navigator.pop(context); // Dismiss the dialog after 3 seconds
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Book Appointment",
          style: TextStyle(fontSize: 20, color: Color(0xff374151)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Date",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff1C2A3A),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CalendarDatePicker(
                  initialDate: selectedDate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2040),
                  onDateChanged: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Select Hour",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff1C2A3A),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: availableItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedHourIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: selectedHourIndex == index
                            ? Colors.black
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: selectedHourIndex == index
                              ? const Color(0xff6B7280)
                              : Colors.grey,
                        ),
                      ),
                      child: Text(
                        availableItems[index],
                        style: TextStyle(
                          fontSize: 16,
                          color: selectedHourIndex == index
                              ? Colors.white
                              : const Color(0xff6B7280),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedHourIndex != null
                      ? () {
                    _confirm();
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedHourIndex != null
                        ? const Color(0xff1C2A3A)
                        : Colors.grey,
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
