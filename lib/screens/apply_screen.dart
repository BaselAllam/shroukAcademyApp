import 'package:flutter/material.dart';
import 'package:i_services/shared/shared_theme/shared_colors.dart';
import 'package:i_services/shared/shared_theme/shared_fonts.dart';
import 'package:i_services/shared/shared_widgets/field_widget.dart';
import 'package:i_services/shared/shared_widgets/snack_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';



class ApplyScreen extends StatefulWidget {
  const ApplyScreen({super.key});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  File? pcikedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply Now', style: SharedFonts.subFontPrimaryColor),
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
        alignment: Alignment.center,
        child: ListView(
          children: [
            Container(
              height: 200.0,
              width: 200.0,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: pcikedImage == null ? DecorationImage(
                  image: NetworkImage('https://www.sha.edu.eg/layout/images/logo.png'),
                  fit: BoxFit.fill
                ) : DecorationImage(
                  image: FileImage(pcikedImage!),
                  fit: BoxFit.fill
                ) 
              ),
              alignment: Alignment.bottomCenter,
              child: IconButton(
                icon: Icon(Icons.add_a_photo),
                color: SharedColors.secondaryColor,
                iconSize: 30.0,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                        ),
                        child: Column(
                          children: [
                            Text('\nChoose Destination\n', style: SharedFonts.subFontPrimaryColor),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    pickImage(ImageSource.camera);
                                  },
                                  child: Container(
                                    height: 100.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: SharedColors.greyColor, width: 0.5),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(Icons.camera, color: SharedColors.secondaryColor, size: 50.0),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    pickImage(ImageSource.gallery);
                                  },
                                  child: Container(
                                    height: 100.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: SharedColors.greyColor, width: 0.5),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(Icons.album, color: SharedColors.secondaryColor, size: 50.0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  );
                },
              ),
            ),
            field('Email Address', Icons.email, emailController, TextInputAction.done, TextInputType.emailAddress),
            field('Full Name', Icons.person, nameController, TextInputAction.done, TextInputType.text),
            field('Address', Icons.location_on, addressController, TextInputAction.done, TextInputType.text),
            field('Mobile Number', Icons.phone, phoneController, TextInputAction.done, TextInputType.number),
            Container(
              margin: const EdgeInsets.all(8.0),
              alignment: Alignment.bottomCenter,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: SharedColors.secondaryColor,
                  elevation: 0.0,
                  fixedSize: Size(150.0, 35.0),
                ),
                child: Text('Apply Now', style: SharedFonts.miniFontWhiteColor),
                onPressed: () {
                  if (emailController.text.isEmpty || nameController.text.isEmpty || addressController.text.isEmpty || phoneController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(snack('Some Fields Required!', Colors.red));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(snack('Applied Success!', Colors.green));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  pickImage(ImageSource imageSource) async {
    XFile? img = await ImagePicker().pickImage(source: imageSource);
    setState(() {
      pcikedImage = File(img!.path);
    });
  }
}