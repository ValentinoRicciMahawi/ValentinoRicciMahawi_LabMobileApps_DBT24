import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prasetiya Mulya',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Roboto',
      ),
      home: const VisionMissionPage(),
    );
  }
}

class VisionMissionPage extends StatelessWidget {
  const VisionMissionPage({Key? key}) : super(key: key);

  
  void _showInfoDialog(BuildContext context, String menuName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Informasi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            '$menuName clicked',
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Color(0xFFB71C1C),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
    
      endDrawer: Drawer(
        child: Container(
          color: const Color(0xFF2C2C2C),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFB71C1C),
                      Color(0xFFD32F2F),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo_prasmul.png',
                      height: 50,
                      fit: BoxFit.contain,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              
              _buildDrawerItem(
                context,
                'PROGRAMS',
                Icons.school,
              ),
              _buildDrawerItem(
                context,
                'ADMISSION',
                Icons.how_to_reg,
              ),
              _buildDrawerItem(
                context,
                'PEOPLE',
                Icons.people,
              ),
              _buildDrawerItem(
                context,
                'LABORATORY',
                Icons.science,
              ),
              _buildDrawerItem(
                context,
                'CAMPUS LIFE',
                Icons.location_city,
              ),
              _buildDrawerItem(
                context,
                'OFFICE & SERVICES',
                Icons.business,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            
            _buildHeader(context),
            
           
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildUniversityLogo(),
                          const SizedBox(height: 60),
                          _buildVisionSection(),
                          const SizedBox(height: 50),
                          _buildMissionSection(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                    _buildFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 
  Widget _buildDrawerItem(BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 24,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop(); 
        _showInfoDialog(context, title); 
      },
      hoverColor: Colors.white.withOpacity(0.1),
    );
  }
  
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFB71C1C), 
            Color(0xFFD32F2F), 
          ],
        ),
      ),
      child: Row(
        children: [
        
          Image.asset(
            'assets/images/logo_prasmul.png',
            height: 50,
            fit: BoxFit.contain,
            color: Colors.white,
          ),
          const Spacer(), 
     
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
    );
  }
  
  Widget _buildUniversityLogo() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/logo_prasmul.png',
              height: 120,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
  
  Widget _buildVisionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'VISION',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: Color(0xFF2C2C2C),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'A globally recognized School for STEMpreneur Education and Research',
          style: TextStyle(
            fontSize: 19,
            color: Colors.black.withOpacity(0.6),
            height: 1.6,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
  
  Widget _buildMissionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'MISSION',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: Color(0xFF2C2C2C),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'Provide quality STEM education and research for nurturing the holistic citizen graduates through:',
          style: TextStyle(
            fontSize: 19,
            color: Colors.black.withOpacity(0.6),
            height: 1.6,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 25),
        _buildMissionPoint(
          '1',
          'Collaborative learning by enterprising involving interdisciplinary catalytic projects',
        ),
        const SizedBox(height: 18),
        _buildMissionPoint(
          '2',
          'Innovative and impactful research to the society',
        ),
      ],
    );
  }
  
  Widget _buildMissionPoint(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 25,
          child: Text(
            number,
            style: TextStyle(
              fontSize: 19,
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 19,
              color: Colors.black.withOpacity(0.6),
              height: 1.6,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      decoration: const BoxDecoration(
        color: Color(0xFF1C1C1C),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFooterText('BSD City Kavling Edutown I.1'),
          const SizedBox(height: 8),
          _buildFooterText('Jl. BSD Raya Utama, BSD City 15339'),
          const SizedBox(height: 8),
          _buildFooterText('Kabupaten Tangerang, Indonesia'),
          const SizedBox(height: 18),
          const Text(
            'Tel. (021) 304-50-500',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildFooterText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w300,
        letterSpacing: 0.3,
      ),
    );
  }
}