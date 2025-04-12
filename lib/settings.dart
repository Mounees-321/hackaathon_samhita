import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reminder.dart';  // Import the ReminderPage
import 'plan.dart';  // Import the PlanPage
import 'home.dart';  // Import the DashboardPage
import 'blog.dart';  // Import the BlogPage

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedIndex = 1; // To make Settings selected initially

  final List<Widget> _pages = [
    BlogPage(),       // Blog page
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      // Navigate to HomePage (Dashboard)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (index == 2) {
      // Navigate to BlogPage
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: _selectedIndex == 1
          ? SettingsBody() // Show SettingsBody when the settings tab is selected
          : _pages[_selectedIndex], // Show the page based on selected index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.inter(),
        unselectedLabelStyle: GoogleFonts.inter(),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Blog',
          ),
        ],
      ),
    );
  }
}

// Settings Page Content (Separate Widget)
class SettingsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Settings',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // Reminder Box
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.alarm, color: Colors.blueAccent),
              title: const Text("Reminder"),
              subtitle: const Text("Manage your reminders"),
              onTap: () {
                // Navigate to ReminderPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReminderPage()),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // Plan Box
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.calendar_today, color: Colors.green),
              title: const Text("Plan"),
              subtitle: const Text("View or update your plan"),
              onTap: () {
                // Navigate to PlanPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlanPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
