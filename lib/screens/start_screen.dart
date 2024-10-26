import 'package:flores_tla/screens/Welcome_screen.dart';
import 'package:flores_tla/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flores_tla/screens/create_task.dart';

// StartScreen with the task list UI
class StartScreen extends StatefulWidget { // Change to StatefulWidget
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _selectedIndex = 0; // To track the selected index

  // Function to handle bottom navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index
    });

    // Navigate to different screens based on the selected index
    switch (index) {
      case 0: // Home
        // You can handle navigation to home if needed
        break;
      case 1: // Calendar
        // You can handle navigation to calendar if needed
        break;
      case 2: // Settings
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsScreen()), // Navigate to SettingsScreen
        );
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()), // Navigate to HomeScreen
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {
              // Optionally handle navigation if needed
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Section
            Text(
              'Hello, Dianna!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color:  Colors.black,
              ),
            ),
            SizedBox(height: 10),

            // Date Section
            Text(
              'Oct, 2024',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF567DF4),
              ),
            ),
            SizedBox(height: 20),

            // Date selection bar with + Add Task Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDateChip('10', 'Mon', true),
                _buildDateChip('11', 'Tue', false),
                _buildDateChip('12', 'Wed', false),
                _buildDateChip('13', 'Thu', false),

                // + Add Task Button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateTaskScreen()),
                    );
                  },
                  icon: Icon(Icons.add, color: Colors.white),
                  label: Text(
                    'Add Task',
                    style: TextStyle(color: Colors.white), // Text color set to white
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF567DF4), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Task List Section
            Expanded(
              child: ListView(
                children: [
                  _buildTaskCard('Meeting with Ms. Princess', '12 October 2024'),
                  _buildTaskCard('Grocery', '1 November 2024'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex, // Set the current index
        onTap: _onItemTapped, // Handle tap
      ),
    );
  }

  // Widget to create date chips
  Widget _buildDateChip(String day, String weekDay, bool isSelected) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor:
              isSelected ? Color(0xFF567DF4) : Colors.grey[200],
          child: Text(
            day,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          weekDay,
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  // Widget to create task cards
  Widget _buildTaskCard(String title, String date) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xFF567DF4),
          child: Icon(Icons.task, color: Colors.white),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(date),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          // Handle task card tap
        },
      ),
    );
  }
}
