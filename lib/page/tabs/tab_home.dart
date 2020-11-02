import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/theme.dart';

class HomeTab extends StatelessWidget {

  final double titleFontSize = 36;
  final double codeFontSize = 21;
  final Color codeBlack = Colors.black;
  final Color codeBlue = Colors.blue;
  final Color codeGrey = Colors.grey;
  final Color codePurple = Colors.deepPurple;
  final Color codeRed = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: FittedBox(
        child: Container(
          height: MediaQuery.of(context).size.height - WebTheme.appBarHeight,
          child: Padding(
            padding: WebTheme.defaultPagePadding,
            child: RepaintBoundary(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jetsadakorn Maliwan".toUpperCase(),
                    style: GoogleFonts.lato(color: codeBlack, fontSize: titleFontSize, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "\n// Mobile Apps Developer\n// Flutter\n",
                    style: TextStyle(fontFamily: "JetBrains Mono", color: codeGrey, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'MobileApps ',
                      style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlue, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'createApp',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codePurple, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: '(',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlack, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: 'Brief',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlue, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: ' yourBrief) {',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlack, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                      ]
                    )
                  ),
                  RichText(
                    text: TextSpan(
                      text: '  var ',
                      style: TextStyle(fontFamily: "JetBrains Mono", color: codeRed, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'yourApp',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlack, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: ' = ',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeRed, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: 'Coding',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlue, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: '(',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlack, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                      ]
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '    function',
                      style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlack, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: ': ',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeRed, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: 'yourBrief.function,',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlack, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        )
                      ]
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '    theme',
                      style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlack, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: ': ',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeRed, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: 'yourBrief.theme',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlack, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: ' != ',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeRed, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: 'null',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlack, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: ' ? ',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeRed, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: 'yourBrief.theme',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlack, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: ' : ',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeRed, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: 'MyDesign',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlue, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: '()',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlack, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        ),
                      ]
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '  );',
                      style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlack, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '  return ',
                      style: TextStyle(fontFamily: "JetBrains Mono", color: codeRed, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' yourApps;',
                          style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlack, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                        )
                      ]
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '}',
                      style: TextStyle(fontFamily: "JetBrains Mono", color: codeBlack, fontSize: codeFontSize, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}