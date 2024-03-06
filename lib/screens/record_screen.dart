import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/about_screen.dart';
import 'package:quiz_app/screens/subject_selection_screen.dart';
import 'package:quiz_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordScreen extends StatefulWidget {
  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  final List<String> subjects = ['English', 'Math', 'Physics'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF141A33),
        title: Text(
          'WowQuiz',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0FC89B),
            ),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF141A33),
      body: Padding(
        padding: const EdgeInsets.all(20.0), 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Records',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              SizedBox(height: 20), 
              Expanded(
                child: ListView.builder(
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    final subject = subjects[index];
                    return RecordCard(
                      subject: subject,
                      imageAsset: 'images/${subject.toLowerCase()}.png',
                      colorIndex: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => SubjectSelectionScreen()));
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AboutScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}

class RecordCard extends StatelessWidget {
  final String subject;
  final String imageAsset;
  final int colorIndex;

  RecordCard({
    required this.subject,
    required this.imageAsset,
    required this.colorIndex,
  });

  Future<int?> getBestRecord(String subject) async {
    final prefs = await SharedPreferences.getInstance();
    final bestRecordKey = '$subject-best-record';
    return prefs.getInt(bestRecordKey);
  }

  Future<int?> getBestTime(String subject) async {
    final prefs = await SharedPreferences.getInstance();
    final bestTimeKey = '$subject-best-time';
    return prefs.getInt(bestTimeKey);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int?>(
      future: getBestRecord(subject),
      builder: (context, bestRecordSnapshot) {
        return FutureBuilder<int?>(
          future: getBestTime(subject),
          builder: (context, bestTimeSnapshot) {
            final bestRecord = bestRecordSnapshot.data;
            final bestTime = bestTimeSnapshot.data;

            final List<Color> buttonColors = [
              Color(0xFF465CC2),
              Color(0xFF0FC89B),
              Color(0xFF06D3F6),
            ];
            final int colorIndex = this.colorIndex % buttonColors.length;
            return Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.all(16.0),
              height: 180.0,
              decoration: BoxDecoration(
                color: buttonColors[colorIndex],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "$subject",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Best record: ${bestRecord ?? '0'}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Best time: ${bestTime != null ? '$bestTime s' : '0'}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        imageAsset,
                        width: 110,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
