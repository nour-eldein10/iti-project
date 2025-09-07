import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F6FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with Developer Image
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.deepPurple,
                    Colors.purple,
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Developer Image
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                        image: DecorationImage(
                          image: AssetImage('assets/developer.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Ahmed Developer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Flutter Developer & UI/UX Designer',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            // Developer Information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Me',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[800],
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'I am a passionate Flutter developer with over 3 years of experience in mobile app development. '
                        'I specialize in creating beautiful, responsive, and user-friendly applications that provide '
                        'exceptional user experiences.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(height: 25),

                  Text(
                    'Skills & Expertise',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[800],
                    ),
                  ),
                  SizedBox(height: 15),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _buildSkillChip('Flutter'),
                      _buildSkillChip('Dart'),
                      _buildSkillChip('Firebase'),
                      _buildSkillChip('REST API'),
                      _buildSkillChip('UI/UX Design'),
                      _buildSkillChip('State Management'),
                      _buildSkillChip('Git'),
                      _buildSkillChip('Clean Architecture'),
                    ],
                  ),

                  SizedBox(height: 25),

                  Text(
                    'Experience',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[800],
                    ),
                  ),
                  SizedBox(height: 15),
                  _buildExperienceItem(
                    'Senior Flutter Developer',
                    'Tech Solutions Inc.',
                    '2022 - Present',
                  ),
                  _buildExperienceItem(
                    'Junior Flutter Developer',
                    'Mobile Apps Company',
                    '2021 - 2022',
                  ),
                  _buildExperienceItem(
                    'UI/UX Designer',
                    'Creative Agency',
                    '2020 - 2021',
                  ),

                  SizedBox(height: 25),

                  Text(
                    'Education',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[800],
                    ),
                  ),
                  SizedBox(height: 15),
                  _buildEducationItem(
                    'Bachelor of Computer Science',
                    'University of Technology',
                    '2016 - 2020',
                  ),

                  SizedBox(height: 25),

                  // Contact & Social
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Get In Touch',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildSocialButton(Icons.email, 'Email'),
                            _buildSocialButton(Icons.link, 'Portfolio'),
                            _buildSocialButton(Icons.code, 'GitHub'),
                            _buildSocialButton(Icons.people, 'LinkedIn'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(
        skill,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.deepPurple,
    );
  }

  Widget _buildExperienceItem(String position, String company, String period) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.work, color: Colors.deepPurple, size: 20),
      title: Text(
        position,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text('$company • $period'),
    );
  }

  Widget _buildEducationItem(String degree, String university, String period) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.school, color: Colors.deepPurple, size: 20),
      title: Text(
        degree,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text('$university • $period'),
    );
  }

  Widget _buildSocialButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}