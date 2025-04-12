import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  String _selectedPlan = "";  // To store the selected plan
  bool _showPlanOptions = false;  // To toggle the visibility of plan options

  // Plan details for each type
  final Map<String, String> _planDetails = {
    "Beginner": "The Beginner plan is designed for newcomers who are just starting their fitness journey.",
    "Intermediate": "The Intermediate plan is ideal for individuals with some experience looking to level up their routine.",
    "Advanced": "The Advanced plan is for seasoned athletes aiming for peak performance.",
  };

  final Map<String, String> _sampleExercises = {
    "Beginner": "1. Warm-up stretches\n2. Basic endurance exercises\n3. Technique drills\n",
    "Intermediate": "1. Moderate cardio\n2. Strength training\n3. Interval drills\n",
    "Advanced": "1. High-intensity interval training (HIIT)\n2. Plyometrics\n3. Advanced strength training\n",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose Your Plan',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Choose Your Plan Card with Triangle Drag Icon
            GestureDetector(
              onTap: () {
                setState(() {
                  _showPlanOptions = !_showPlanOptions;
                });
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.account_tree, // Placeholder icon for your plan card
                    color: Colors.blueAccent,
                  ),
                  title: Text(
                    "Choose Your Plan",
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                  ),
                  trailing: _showPlanOptions
                      ? Icon(Icons.keyboard_arrow_up)
                      : Icon(Icons.keyboard_arrow_down),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Show Plan Cards when the options are toggled
            if (_showPlanOptions)
              Column(
                children: [
                  _buildPlanCard("Beginner"),
                  _buildPlanCard("Intermediate"),
                  _buildPlanCard("Advanced"),
                ],
              ),
            const SizedBox(height: 20),

            // Show Selected Plan and its Summary
            if (_selectedPlan.isNotEmpty)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selected Plan: $_selectedPlan',
                        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Summary: ${_planDetails[_selectedPlan] ?? ""}',
                        style: GoogleFonts.inter(),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Sample Exercises:',
                        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _sampleExercises[_selectedPlan] ?? "",
                        style: GoogleFonts.inter(),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Method to build individual plan cards
  Widget _buildPlanCard(String planName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlan = planName;
          _showPlanOptions = false; // Hide plan options after selection
        });
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                planName,
                style: GoogleFonts.inter(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.check, color: _selectedPlan == planName ? Colors.green : Colors.transparent),
            ],
          ),
        ),
      ),
    );
  }
}
