import 'package:flutter/material.dart';
import 'tendons.dart'; // Import the tendons.dart file

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Blog")),
      body: SingleChildScrollView( // Make the entire page scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wrapping the text inside a Card widget
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'What is posture?\n'
                      'Your posture is the natural way you hold your body. It’s the position your body’s in while you’re sitting still and moving.\n\n'
                      'Your musculoskeletal system maintains your posture. Muscles, ligaments and tendons work with joints throughout your body to control your position at all times. They adjust your body to hold you in a stable, comfortable shape. '
                      'It’s how you’re able to stay in one place when you’re not moving without sliding out of your chair.\n\n'
                      'Changes to your posture also make certain movements possible. If your body couldn’t change its shape, you’d be stuck in one position like a mannequin. Bending over to pick up a pen you dropped would be a lot harder if you had to tip your entire body onto the floor to grab it.\n\n'
                      'Everyone has a unique natural posture, but there are a few general rules you can follow to improve your posture and prevent common issues like back pain.\n\n'
                      'Types of posture\n'
                      'There are two types of posture:\n\n'
                      'Static posture: Static posture is the way you hold your body when you’re not moving. It’s when you’re standing, sitting or lying down (including sleeping). If someone’s ever scolded you to sit up straight and not slouch, '
                      'they were (maybe rudely) asking you to adjust your static posture.\n\n'
                      'Dynamic posture: Dynamic posture is how you keep your body stable while you’re moving. Even if you’re not actively thinking about it, your body constantly adjusts itself while you’re running, stretching to reach something or walking up and down the stairs. '
                      'People who focus on their body position while they’re playing a sport or doing yoga are concentrating on their dynamic posture.\n\n'
                      'What is proper posture?\n'
                      'There’s no such thing as perfect or imperfect posture. Everyone’s body is slightly different. Don’t stress about having exactly perfect posture all the time. In fact, some studies have found that commonly considered poor or bad posture has more to do with self-esteem '
                      'and thinking you look good rather than staying healthy or preventing pain. What that means is, you can be mindful about sitting or moving safely, but try not to worry about it all the time.\n\n'
                      'Even if there’s not one type of posture that’s best for everyone in every situation, there are still a few general rules you can follow to support your body. The best way to maintain good posture is to protect your spine’s curves.\n\n'
                      'Your spine naturally has three curves — one in your neck (your cervical spine), the middle of your back (your thoracic spine) and in your lower back (your lumbar spine). These three curves give your spine a shape like a gently curved uppercase S. Your posture shouldn’t be bent or flexed in a way that adds extra curve to any section of your spine.\n\n'
                      'Your body controls a lot of your posture automatically, but there are a few things you can do to maintain good, healthy posture:\n\n'
                      '• Keep your head above your shoulders: Don’t crane your neck back or hang your head heavy in front of yourself.\n'
                      '• Hold your shoulders above your hips: Picture an imaginary line running from your hips to your shoulders. You want that line to be as straight as possible. That line will aim further off center if you slouch forward or back. If you’re sitting down, try to keep a 90-degree angle (the angle in the corners of a square) between your back and hips.\n'
                      '• Keep your lower body in a stable position: The best place for your legs and feet depends on if you’re sitting down or standing up. If you’re sitting, keep your feet flat on the floor in front of you with your knees bent at 90 degrees and your ankles separated.\n\n'
                      'Why is proper posture important?\n'
                      'Having good posture can help you avoid common aches and pains in your back, neck and shoulders. Having a safe dynamic posture (especially when you’re working out or doing physical activity) can help prevent sports injuries.\n\n'
                      'Maintaining healthy posture can reduce wear and tear on your joints, especially in your spine. Good posture can’t completely prevent joint issues like arthritis, but it can reduce stress on your joints.\n\n'
                      'Some simple ways to improve your posture include:\n\n'
                      '• Thinking about your posture in short bursts: Check in on your posture every once in a while, instead of thinking about it constantly.\n'
                      '• Activate your core: Gently squeezing your core muscles (the muscles in and around your abdomen) can naturally straighten your posture and keep your spine in alignment.\n'
                      '• Wear well-fitting, comfortable shoes: Some types of shoes can force your feet and ankles into unnatural positions, which can affect your posture.\n\n'
                      '• Stretch after exercise: Stretching your muscles when they’re more pliable after exercise, and never to the point of pain, can help prevent tendon injury.\n\n'
                      'Your body controls a lot of your posture automatically, but there are a few things you can do to maintain good, healthy posture.\n\n'
                      '• Keep your head above your shoulders: Don’t crane your neck back or hang your head heavy in front of yourself.\n'
                      '• Hold your shoulders above your hips: Picture an imaginary line running from your hips to your shoulders. You want that line to be as straight as possible. '
                      'That line will aim further off center if you slouch forward or back. If you’re sitting down, try to keep a 90-degree angle between your back and hips.\n\n'
                      'What is a tendon? '
                      'A tendon is a cord of strong, flexible tissue, similar to a rope. Tendons connect your muscles to your bones. '
                      'Tendons let us move our limbs. They also help prevent muscle injury by absorbing some of the impact your muscles take when you run, jump or do other movements.\n\n'
                      'You can read more about tendons by clicking the word "tendons" below:',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to tendons.dart page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TendonsPage()),
                );
              },
              child: Text(
                'Tendons',
                style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
