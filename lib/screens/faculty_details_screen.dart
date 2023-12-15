import 'package:flutter/material.dart';
import 'package:i_services/dummy_data.dart';
import 'package:i_services/screens/apply_screen.dart';
import 'package:i_services/shared/shared_theme/shared_colors.dart';
import 'package:i_services/shared/shared_theme/shared_fonts.dart';



class FacultyDetailsScreen extends StatefulWidget {
  final String title;
  const FacultyDetailsScreen(this.title);

  @override
  State<FacultyDetailsScreen> createState() => _FacultyDetailsScreenState();
}

class _FacultyDetailsScreenState extends State<FacultyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} Details', style: SharedFonts.subFontPrimaryColor),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: SharedColors.blackColor,
          iconSize: 20.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            aboutFacultySection(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: SharedColors.secondaryColor,
                      elevation: 0.0,
                      fixedSize: Size(150.0, 35.0),
                    ),
                    child: Text('Apply Now', style: SharedFonts.miniFontWhiteColor),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ApplyScreen()));
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Departments and Programmes', style: SharedFonts.subFontPrimaryColor),
            ),
            departmentSection(),
            ListTile(
              title: Text('Success Stories', style: SharedFonts.subFontPrimaryColor),
            ),
            successStoriesSection(),
          ],
        ),
      ),
    );
  }

  aboutFacultySection() {
    return Container(
      height: MediaQuery.of(context).size.height / 2.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: SharedColors.whiteColor,
      ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: NetworkImage('https://hie.sha.edu.eg/images/461308500_sha-5.jpg'),
                    fit: BoxFit.fill
                  )
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 190,
                child: ListTile(
                  title: Text('Introduction to the institute and programs', style: SharedFonts.subFontPrimaryColor),
                )
              )
            ],
          ),
          ListTile(
            title: Text(
              '''The Higher Institute of Engineering was established in 1995 by Ministerial Resolution issued by the Ministry of Higher Education No. 1712 dated 11/22/1995.....''',
              style: SharedFonts.miniFontSecondaryColor,
            ),
          )
        ],
      ),
    );
  }

  departmentSection() {
    return Container(
      height: MediaQuery.of(context).size.height / 1.15,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.1
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: departmentData.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: SharedColors.greyColor, width: 0.5),
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(departmentData[index]['img']!, height: 75.0, width: 75.0),
                Text(departmentData[index]['txt']!, textAlign: TextAlign.center, style: SharedFonts.miniFontPrimaryColor)
              ],
            ),
          );
        },
      ),
    );
  }

  successStoriesSection() {
    return Container(
      height: 320.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: 200.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: SharedColors.greyColor, width: 0.5),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Container(
                  width: 200.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: NetworkImage('https://hie.sha.edu.eg/upload/honorable/55048849_9.jpg'),
                      fit: BoxFit.fill
                    )
                  ),
                ),
                SizedBox(height: 10.0),
                Text('ENG: Mohamed Abel Aziz', style: SharedFonts.miniFontPrimaryColor),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Honoring engineer Ahmed Barakat Hassan Ibrahim Director of the Electromechanical Department at MI International Company', style: SharedFonts.miniFontSecondaryColor),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}