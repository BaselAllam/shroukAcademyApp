import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_services/cubits/navigation_cubit.dart';
import 'package:i_services/screens/faculty_details_screen.dart';
import 'package:i_services/shared/responsive.dart';
import 'package:i_services/shared/shared_theme/shared_colors.dart';
import 'package:i_services/shared/shared_theme/shared_fonts.dart';
import 'package:i_services/states/navigation_states.dart';


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
      child: BlocBuilder<NavigationCubit, NavigationStates>(
        builder: (context, state) {
          if (state is GetLeadersImgsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetLeadersImgsErrorState) {
            return Center(child: Text('Some thing went wrong', style: SharedFonts.miniFontPrimaryColor));
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: BlocProvider.of<NavigationCubit>(context).academyLeaders.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    minRadius: 45.0,
                    maxRadius: 45.0,
                    backgroundImage: NetworkImage(BlocProvider.of<NavigationCubit>(context).academyLeaders[index]),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget headerSection() {
    return Container(
      height: 200.0,
      child: BlocBuilder<NavigationCubit, NavigationStates>(
        builder: (context, state) {
          if (state is GetHeaderImgsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetHeaderImgsErrorState) {
            return Center(child: Text('Some thing went wrong', style: SharedFonts.miniFontPrimaryColor));
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: BlocProvider.of<NavigationCubit>(context).headerImgs.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 400.0,
                  margin: EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(BlocProvider.of<NavigationCubit>(context).headerImgs[index]),
                      fit: BoxFit.fill
                    ),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget facultySection() {
    Size size = MediaQuery.of(context).size;
    Size respSize = responsiveFacultyGridImg(size.height);
    return Container(
      height: size.height - responsiveHomeGrid(size.height),
      child: BlocBuilder<NavigationCubit, NavigationStates>(
        builder: (context, state) {
          if (state is GetFacultyLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetFacultyErrorState) {
            return Center(child: Text('Some thing went wrong', style: SharedFonts.miniFontPrimaryColor));
          } else {
            return GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: responsiveHomeGridItem(size.height),
              ),
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                for (int i = 0; i < BlocProvider.of<NavigationCubit>(context).faculities.length; i++)
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => FacultyDetailsScreen(BlocProvider.of<NavigationCubit>(context).faculities[i])));
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
                          height: respSize.height,
                          width: respSize.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(BlocProvider.of<NavigationCubit>(context).faculities[i]['facultyImg']!),
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
                          child: Text(BlocProvider.of<NavigationCubit>(context).faculities[i]['facultyName'], style: SharedFonts.miniFontPrimaryColor),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}