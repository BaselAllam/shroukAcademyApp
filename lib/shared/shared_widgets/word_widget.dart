import 'package:flutter/material.dart';
import 'package:i_services/shared/shared_theme/shared_fonts.dart';



class WordWidget extends StatefulWidget {
  final String img;
  final String title;
  final String subtitle;
  const WordWidget(this.img, this.title, this.subtitle);

  @override
  State<WordWidget> createState() => _WordWidgetState();
}

class _WordWidgetState extends State<WordWidget> {
  bool isOpened = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isOpened ? widget.subtitle.length * 0.7 : 250.0,
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 150.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: NetworkImage(widget.img),
                    fit: BoxFit.fill
                  )
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 120,
                child: ListTile(
                  title: Text(widget.title, style: SharedFonts.subFontSecondaryColor),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(isOpened ? widget.subtitle : '${widget.subtitle.substring(0, 100)} ...', style: SharedFonts.miniFontPrimaryColor),
                InkWell(
                  child: Text('read ${isOpened ? 'less' : 'more'}', style: SharedFonts.miniFontPrimaryColor),
                  onTap: () {
                    isOpened = !isOpened;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}