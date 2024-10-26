import 'package:flutter/material.dart';

class CreateTaskScreen extends StatefulWidget {
  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay(hour: 13, minute: 0);
  TimeOfDay endTime = TimeOfDay(hour: 15, minute: 0);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? startTime : endTime,
    );
    if (picked != null)
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Text(
              'New Task',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24),

            // Title Input
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Date Picker
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Date',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today, color: Colors.grey),
                  ),
                  controller: TextEditingController(
                    text:
                        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Time Picker for Start and End Times
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectTime(context, true),
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Start Time',
                          labelStyle: TextStyle(color: Colors.grey),
                          border: UnderlineInputBorder(),
                        ),
                        controller: TextEditingController(
                          text: startTime.format(context),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectTime(context, false),
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'End Time',
                          labelStyle: TextStyle(color: Colors.grey),
                          border: UnderlineInputBorder(),
                        ),
                        controller: TextEditingController(
                          text: endTime.format(context),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Description Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),

            // Category Chips
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                Chip(label: Text('Business')),
                Chip(label: Text('Meeting')),
                Chip(label: Text('Shopping')),
                Chip(label: Text('House Cleaning')),
                Chip(label: Text('School Works')),
                Chip(label: Text('Workout')),

              ],
            ),
            SizedBox(height: 24),

            // Create New Task Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add task creation logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF567DF4), // Blue button color
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Create New Task',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
