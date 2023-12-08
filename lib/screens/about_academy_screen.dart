import 'package:flutter/material.dart';
import 'package:i_services/dummy_data.dart';
import 'package:i_services/shared/shared_theme/shared_colors.dart';
import 'package:i_services/shared/shared_theme/shared_fonts.dart';
import 'package:i_services/shared/shared_widgets/word_widget.dart';



class AboutAcademyScreen extends StatefulWidget {
  const AboutAcademyScreen({super.key});

  @override
  State<AboutAcademyScreen> createState() => _AboutAcademyScreenState();
}

class _AboutAcademyScreenState extends State<AboutAcademyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            for (int i = 0; i < aboutData.length; i++)
            WordWidget(aboutData[i]['img']!, aboutData[i]['title']!, aboutData[i]['subtitle']!),
            Text('   Contact Info', style: SharedFonts.subFontPrimaryColor),
            contactInfoWidget('Address: Shrouk City, Cairo, Egypt', Icons.location_on),
            contactInfoWidget('email: INFO@SHA.EDU.EG', Icons.email),
            contactInfoWidget('phone: 0226300032', Icons.phone),
            contactInfoWidget('phone: 0226300033', Icons.phone),
            contactInfoWidget('fax: 0226300039', Icons.fax),
          ],
        ),
      ),
    );
  }

  contactInfoWidget(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: SharedColors.secondaryColor, size: 20.0),
      title: Text(title, style: SharedFonts.miniFontPrimaryColor)
    );
  }
}