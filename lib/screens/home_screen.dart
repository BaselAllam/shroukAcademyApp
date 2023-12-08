import 'package:flutter/material.dart';
import 'package:i_services/dummy_data.dart';
import 'package:i_services/screens/faculty_details_screen.dart';
import 'package:i_services/shared/shared_theme/shared_colors.dart';
import 'package:i_services/shared/shared_theme/shared_fonts.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            headerSection(),
            sectionTitle('Academy Leaders', Icons.volunteer_activism_outlined),
            teachersSection(),
            sectionTitle('Faculities', Icons.category),
            facultySection(),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: SharedFonts.primaryFontPrimaryColor,
      ),
      trailing: Icon(icon, color: SharedColors.primaryColor, size: 25.0)
    );
  }

  Widget teachersSection() {
    return Container(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              minRadius: 45.0,
              maxRadius: 45.0,
              backgroundImage: NetworkImage('https://www.sha.edu.eg/layout/images/03.jpg'),
            ),
          );
        },
      ),
    );
  }

  Widget headerSection() {
    return Container(
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < headerImgs.length; i++)
          Container(
            width: 400.0,
            margin: EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(headerImgs[i]),
                fit: BoxFit.fill
              ),
              borderRadius: BorderRadius.circular(20.0)
            ),
          ),
        ],
      ),
    );
  }

  Widget facultySection() {
    return Container(
      height: MediaQuery.of(context).size.height - 440,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
        ),
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          for (int i = 0; i < facultyData.length; i++)
          InkWell(
            onTap: () {
              // Navigator.pushNamed(context, 'about');
              Navigator.push(context, MaterialPageRoute(builder: (_) => FacultyDetailsScreen(facultyData[i]['title']!)));
            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(color: SharedColors.greyColor, width: 1.0),
                borderRadius: BorderRadius.circular(20.0)
              ),
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Container(
                    height: 115.0,
                    width: 145,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(facultyData[i]['img']!),
                        fit: BoxFit.fill
                      ),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.grey.shade100
                    ),
                    child: Text(facultyData[i]['title']!, style: SharedFonts.miniFontPrimaryColor),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}