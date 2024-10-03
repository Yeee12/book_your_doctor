
import 'package:book_your_doctor/helpers/completed.dart';
import 'package:book_your_doctor/helpers/upcoming_card.dart';
import 'package:flutter/material.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back arrow
        title: const Center(child: Text("My Bookings")),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Upcoming"),
            Tab(text: "Completed"), // Fixed typo from "Completeted"
            Tab(text: "Favourite"),  // Changed the second "Upcoming" to "Canceled"
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
           UpcomingCard(status: "Upcoming"),
          Completed(status: "Completed"),
          Completed(status: "")
        ],
      ),
    );
  }
}
