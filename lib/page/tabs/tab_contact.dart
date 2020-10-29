import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/theme.dart';
import 'package:portfolio/widgets/contact_list_item.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-(2*48)-WebTheme.appBarHeight,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height-WebTheme.appBarHeight,
            child: Padding(
              padding: WebTheme.defaultPagePadding,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Contact".toUpperCase(),
                  style: TextStyle(
                    fontSize: 84,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height-WebTheme.appBarHeight,
            child: Center(
              child: Card(
                elevation: 8,
                margin: WebTheme.defaultPagePadding,
                child: Padding(
                  padding: WebTheme.defaultItemPadding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 360,
                        child: ContactListItem(
                          title: "Email",
                          contact: "jatsadakorn555@gmail.com",
                          icon: FluentIcons.send_20_filled,
                          tooltip: "Send Email",
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          onPressed: () {
                            launch("mailto:jatsadakorn555@gmail.com");
                          },
                        ),
                      ),
                      SizedBox(height: 16,),
                      Container(
                        width: 360,
                        child: ContactListItem(
                          title: "GitHub",
                          contact: "github.com/jamesfeeder",
                          icon: FluentIcons.open_20_filled,
                          tooltip: "Go to GitHub",
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          onPressed: () {
                            launch("https://www.github.com/jamesfeeder");
                          },
                        ),
                      ),
                      SizedBox(height: 16,),
                      Container(
                        width: 360,
                        child: ContactListItem(
                          title: "Facebook",
                          contact: "facebook.com/jf86555",
                          icon: FluentIcons.open_20_filled,
                          tooltip: "Go to Facebook",
                          backgroundColor: Color(0xff1778F2),
                          foregroundColor: Colors.white,
                          onPressed: () {
                            launch("https://www.facebook.com/jf86555");
                          },
                        ),
                      )
                    ]
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}