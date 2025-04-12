import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({super.key});

  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  bool _isReminderOn = false; // Toggle state for reminder
  String _intervalTime = "00:01:00"; // Default interval time as 1 minute
  String _reminderType = "Notification Message"; // Corrected variable name to "reminderType"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reminder Settings',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reminder On/Off Card with Toggle
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(
                  _isReminderOn ? Icons.alarm_on : Icons.alarm_off,
                  color: _isReminderOn ? Colors.green : Colors.grey,
                ),
                title: Text("Reminder On/Off"),
                subtitle: Text(_isReminderOn ? "Reminder is ON" : "Reminder is OFF"),
                trailing: Switch(
                  value: _isReminderOn,
                  onChanged: (value) {
                    setState(() {
                      _isReminderOn = value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Reminder Interval Card (Enabled/Disabled based on Reminder On/Off)
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: _isReminderOn ? null : Colors.grey[300], // Grey out when reminder is off
              child: ListTile(
                leading: const Icon(Icons.timer, color: Colors.blueAccent),
                title: const Text("Reminder Interval"),
                subtitle: Text("Current Interval: $_intervalTime"),
                onTap: _isReminderOn ? () => _showIntervalDialog() : null, // Disable if reminder is off
              ),
            ),
            const SizedBox(height: 20),

            // Reminder Type Card (Enabled/Disabled based on Reminder On/Off)
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: _isReminderOn ? null : Colors.grey[300], // Grey out when reminder is off
              child: ListTile(
                leading: const Icon(Icons.notifications, color: Colors.orange),
                title: const Text("Reminder Type"), // Changed from Interval Type to Reminder Type
                subtitle: Text("Reminder type: $_reminderType"),
                onTap: _isReminderOn ? () => _showIntervalTypeDialog() : null, // Disable if reminder is off
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Show dialog to select reminder interval
  void _showIntervalDialog() async {
    String? selectedInterval = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Reminder Interval'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, "00:00:30"), // 30 seconds
              child: const Text('30 seconds'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, "00:01:00"), // 1 minute
              child: const Text('1 minute'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, "00:02:00"), // 2 minutes
              child: const Text('2 minutes'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, "00:05:00"), // 5 minutes
              child: const Text('5 minutes'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, "00:10:00"), // 10 minutes
              child: const Text('10 minutes'),
            ),
          ],
        );
      },
    );
    if (selectedInterval != null) {
      setState(() {
        _intervalTime = selectedInterval;
      });
    }
  }

  // Show reminder type selection dialog
  void _showIntervalTypeDialog() async {
    String? selected = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Reminder Type'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, "Notification Message"),
              child: const Text('Notification Message'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, "Voice"),
              child: const Text('Voice'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, "Ringtone"),
              child: const Text('Ringtone'),
            ),
          ],
        );
      },
    );
    if (selected != null) {
      setState(() {
        _reminderType = selected; // Updated to use reminderType instead of intervalType
      });
    }
  }
}
