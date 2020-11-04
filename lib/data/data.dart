import 'package:flutter/material.dart';
import 'package:portfolio/models/work.dart';

class CategoryData {
  static Map<String,String> categoryList = {
    "Mobile":"Mobile Application",
    "PWA"   :"Progressive Web Application"
  };
}

class PortfolioData {
  static List<Work> workList = [
  //NOTE: Quicknote Data 
    Work(
      title: "Quicknote!",
      category: [
        "Mobile",
        "PWA"
      ],
      description: "An application for Taking Note, Cloud Save and Markdown Text Styling Support.",
      longDescription: """
Quicknote is application for Taking Note.

Quicknote is saving notes in Firebase Cloud Firestore to make the notes available in anyplace,

and supported Markdown Text formatting for styling and organize the content.
      """,
      technology: [
        "Flutter",
        "Flutter Web",
        "Cloud Firestore"
      ],
      projectRepoUrl: "https://github.com/jamesfeeder/quicknote_private",
      projectColor: Colors.amber[100],
      projectIconUrl: "assets/quicknote/00.png",
      cardThumbnailUrl: "assets/quicknote/02.jpg",
      cardThumbnailAlignment: Alignment.topCenter,
      galleryUrl: [
        "assets/quicknote/01.jpg",
        "assets/quicknote/02.jpg",
        "assets/quicknote/03.jpg",
        "assets/quicknote/01.jpg",
        "assets/quicknote/02.jpg",
        "assets/quicknote/03.jpg",
        "assets/quicknote/04.png",
      ],
    ),
  ];
}