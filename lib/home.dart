import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'settings.dart';
import 'blog.dart';  // Import BlogPage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    PageContent(title: 'Dashboard'),
    PageContent(title: 'Blog'),
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        _selectedIndex = 0;
      });
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsPage()),
      );
    } else if (index == 2) {
      // Navigate to BlogPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  BlogPage()), // Navigate to BlogPage
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Posturx',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Posturx',
          style: GoogleFonts.inter(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          _pages[_selectedIndex],
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                debugPrint("Start button clicked");
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "Start",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex == 1 ? 2 : _selectedIndex,
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

class PageContent extends StatelessWidget {
  final String title;

  const PageContent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildRoundGraph("Neck", 0.4),
                      const SizedBox(width: 20),
                      _buildRoundGraph("Torso", 0.5),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Weekly Activity Hours',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 300,
                      child: BarChart(
                        BarChartData(
                          gridData: FlGridData(show: true),
                          borderData: FlBorderData(show: true),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 2,
                                getTitlesWidget: (value, _) =>
                                    Text('${value.toInt()}h', style: TextStyle(fontSize: 12)),
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, _) {
                                  const days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      days[value.toInt()],
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(toY: 8, color: Colors.blue, width: 15),
                              BarChartRodData(toY: 2, color: Colors.red, width: 15),
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(toY: 6, color: Colors.blue, width: 15),
                              BarChartRodData(toY: 3, color: Colors.red, width: 15),
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(toY: 7, color: Colors.blue, width: 15),
                              BarChartRodData(toY: 1, color: Colors.red, width: 15),
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(toY: 5, color: Colors.blue, width: 15),
                              BarChartRodData(toY: 2, color: Colors.red, width: 15),
                            ]),
                            BarChartGroupData(x: 4, barRods: [
                              BarChartRodData(toY: 6, color: Colors.blue, width: 15),
                              BarChartRodData(toY: 2, color: Colors.red, width: 15),
                            ]),
                            BarChartGroupData(x: 5, barRods: [
                              BarChartRodData(toY: 7, color: Colors.blue, width: 15),
                              BarChartRodData(toY: 3, color: Colors.red, width: 15),
                            ]),
                            BarChartGroupData(x: 6, barRods: [
                              BarChartRodData(toY: 9, color: Colors.blue, width: 15),
                              BarChartRodData(toY: 1, color: Colors.red, width: 15),
                            ]),
                          ],
                        ),
                        swapAnimationDuration: Duration(milliseconds: 250),
                        swapAnimationCurve: Curves.easeOut,
                      ),
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

  Widget _buildRoundGraph(String label, double percent) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 60.0,
          lineWidth: 6.0,
          percent: percent,
          center: Text(
            "$label\n${(percent * 100).toInt()}%",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          progressColor: Colors.blueAccent,
          backgroundColor: Colors.red.shade200,
          animation: true,
        ),
        const SizedBox(height: 8),
        const Text(
          "Valid angle 40",
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
