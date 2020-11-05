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
        "Firebase Cloud Firestore"
      ],
      projectRepoUrl: "https://github.com/jamesfeeder/quicknote_private",
      projectColor: Colors.amber[100],
      projectSecondaryColor: Colors.grey[850],
      projectIconUrl: "assets/quicknote/00.png",
      cardThumbnailUrl: "assets/quicknote/02.jpg",
      cardThumbnailAlignment: Alignment.topCenter,
      galleryUrl: [
        "assets/quicknote/01.jpg",
        "assets/quicknote/02.jpg",
        "assets/quicknote/03.jpg",
        "assets/quicknote/04.png",
      ],
    ),
  //NOTE: SABISU Data
    Work(
      title: "SABISU",
      description: "A mobile Application Platform for SMEs, that want to have their own Mobile Application",
      longDescription: '''
A mobile Application Platform for SMEs, that want to have their own Mobile Application

This Platform provided 2 applications
- SABISU (Client Side)
- SABISU Store (Store Side)

#### Feature
      ''',
      category: ["Mobile"],
      technology: [
        "Flutter",
        "Firebase Cloud Firestore"
      ],
      projectRepoUrl: "https://github.com/jamesfeeder/sabisu",
      projectColor: Color.fromRGBO(152, 129, 93, 1.0),
      projectSecondaryColor: Colors.white,
      projectIconUrl: "assets/sabisu/00.png",
      cardThumbnailUrl: "assets/sabisu/01.jpg",
      cardThumbnailAlignment: Alignment.topCenter,
      galleryUrl: [
        "assets/sabisu/01.jpg",
        "assets/sabisu/02.jpg",
        "assets/sabisu/03.jpg",
        "assets/sabisu/04.jpg",
        "assets/sabisu/05.jpg",
        "assets/sabisu/06.jpg",
        "assets/sabisu/07.jpg",
        "assets/sabisu/08.jpg",
        "assets/sabisu/09.jpg",
        "assets/sabisu/10.jpg",
        "assets/sabisu/11.jpg"
      ]
    ),
  //NOTE: FSC Tracker Data
    Work(
      title: "FSC Tracker",
      category: ["PWA"],
      description: "Content Management System for Nam Yang Tai Co-operatives Limited (NTC)",
      longDescription: '''
Content Management System for Nam Yang Tai Co-operatives Limited (NTC).
#### Feature
- Dashboard for display overall information, with history stored user can open the old information for statistic calculation
- Save, Edit and View forms
- All form store on Cloud Storage (Firebase Realtime Database)
- Show Google Maps with Start and Destination Marker in Shipment Information Page.
      ''',
      technology: [
        "Flutter Web",
        "Firebase Realtime Database",
        "Firebase Cloud Function"
        "Google Maps"
      ],
      projectRepoUrl: "https://github.com/jamesfeeder/fsc",
      projectColor: Color(0xff00553D),
      projectSecondaryColor: Colors.white,
      projectIconUrl: "assets/ntc_fsc/00.png",
      cardThumbnailUrl: "assets/ntc_fsc/02.png",
      cardThumbnailAlignment: Alignment.topCenter,
      galleryUrl: [
        "assets/ntc_fsc/01.png",
        "assets/ntc_fsc/02.png",
        "assets/ntc_fsc/03.png",
        "assets/ntc_fsc/04.png",
        "assets/ntc_fsc/05.png",
        "assets/ntc_fsc/06.png"
      ]
    )
  ];
}