import 'package:flutter/material.dart';
import 'package:i_services/screens/apply_screen.dart';
import 'package:i_services/shared/responsive.dart';
import 'package:i_services/shared/shared_theme/shared_colors.dart';
import 'package:i_services/shared/shared_theme/shared_fonts.dart';



class FacultyDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const FacultyDetailsScreen(this.data);

  @override
  State<FacultyDetailsScreen> createState() => _FacultyDetailsScreenState();
}

class _FacultyDetailsScreenState extends State<FacultyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.data['facultyName']} Details', style: SharedFonts.subFontPrimaryColor),
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
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / responsiveFacultyDetailsAbout(size.height),
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
                    image: NetworkImage(widget.data['facultyImg']),
                    fit: BoxFit.fill
                  )
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 190,
                child: ListTile(
                  title: Text(widget.data['descTitle'], style: SharedFonts.subFontPrimaryColor),
                )
              )
            ],
          ),
          ListTile(
            title: Text(
              widget.data['descSubtitle'],
              style: SharedFonts.miniFontSecondaryColor,
            ),
          )
        ],
      ),
    );
  }

  departmentSection() {
    Size size = MediaQuery.of(context).size;
    Size respSize = responsiveFacultyGridImg(size.height);
    return Container(
      height: size.height / responsiveFacultyDetailsDepart(size.height),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: responsiveHomeGridItem(size.height),
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.data['departments'].length,
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
                Image.network(widget.data['departments'][index]['depImg']!, height: respSize.height, width: respSize.width),
                Text(widget.data['departments'][index]['depName']!, textAlign: TextAlign.center, style: SharedFonts.miniFontPrimaryColor)
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
        itemCount: widget.data['successStories'].length,
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
                      image: NetworkImage(widget.data['successStories'][index]['personImg']),
                      fit: BoxFit.fill
                    )
                  ),
                ),
                SizedBox(height: 10.0),
                Text(widget.data['successStories'][index]['personName'], style: SharedFonts.miniFontPrimaryColor),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(widget.data['successStories'][index]['personSubtitle'], style: SharedFonts.miniFontSecondaryColor),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}