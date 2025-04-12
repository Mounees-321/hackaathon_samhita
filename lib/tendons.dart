import 'package:flutter/material.dart';

class TendonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("What is a Tendon?")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "What is a tendon?\n"
              "A tendon is a cord of strong, flexible tissue, similar to a rope. Tendons connect your muscles to your bones. Tendons let us move our limbs. They also help prevent muscle injury by absorbing some of the impact your muscles take when you run, jump or do other movements.\n\n"
              "Your body contains thousands of tendons. You can find tendons from your head all the way down to your toes. The Achilles tendon, which connects your calf muscle to your heel bone, is the largest tendon in your body.\n\n"
              "Tendons are highly resistant to tearing but aren’t stretchy. This means they can be easily injured when strained (stretched to the point of partial tearing of rope fibers) and may take a long time to heal.\n\n"
              "Function\n"
              "What does a tendon do?...\n"
              "Rest of your tendon information...",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
