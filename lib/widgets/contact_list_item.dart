import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactListItem extends StatelessWidget {

  final String title;
  final String contact;
  final IconData icon;
  final Function onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final String tooltip;

  ContactListItem({
    Key key,
    @required this.title,
    @required this.contact,
    @required this.icon,
    @required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.tooltip
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 56,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)
              ),
              Text(
                contact,
                style:GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(width: 16,),
        FloatingActionButton(
          onPressed: onPressed,
          tooltip: tooltip,
          //mini: true,
          elevation: 0,
          hoverElevation: 4,
          focusElevation: 2,
          highlightElevation: 2,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          splashColor: foregroundColor.withOpacity(0.5),
          hoverColor: foregroundColor.withOpacity(0),
          focusColor: foregroundColor.withOpacity(0.15),
          child: Icon(icon),
        )
      ],
    );
  }
}