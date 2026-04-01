import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/experience_section.dart';
import '../sections/footer_section.dart';
import '../sections/navbar_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../widgets/particles_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showBackToTop = _scrollController.offset > 400;
      });
    });
  }

  void _scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: _showBackToTop
          ? FloatingActionButton(
              mini: true,
              backgroundColor: AppColors.primary,
              onPressed: () => _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
              ),
              child: const Icon(Icons.arrow_upward, color: Colors.white),
            )
          : null,
      body: Stack(
        children: [
          const ParticlesBackground(),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                NavbarSection(
                  //onHomePressed: () => _scrollToSection(_heroKey),
                  onAboutPressed: () => _scrollToSection(_aboutKey),
                  onSkillsPressed: () => _scrollToSection(_skillsKey),
                  onProjectsPressed: () => _scrollToSection(_projectsKey),
                  onExperiencePressed: () => _scrollToSection(_experienceKey),
                  onContactPressed: () => _scrollToSection(_contactKey),
                ),
                // HeroSection(
                //   key: _heroKey,
                //   onContactPressed: () => _scrollToSection(_contactKey),
                // ),
                AboutSection(key: _aboutKey),
                SkillsSection(key: _skillsKey),
                ProjectsSection(key: _projectsKey),
                ExperienceSection(key: _experienceKey),
                ContactSection(key: _contactKey),
                const FooterSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
