import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:project/ContentManager/card_archive.dart';
import 'package:project/ContentManager/inventory.dart';
import 'package:project/ContentManager/queue.dart';
import 'package:project/ContentManager/shop.dart';
import 'package:project/ContentManager/slide_show.dart';

import '../MainPage/start_menu.dart';
import '../GamePage/game_page.dart';

class ContentManager extends ChangeNotifier{

  String _currentContent = "SlideShow";

  final HashMap<String, Widget> _widgets = HashMap<String, Widget>();
  UnmodifiableMapView<String, Widget> get widgets => UnmodifiableMapView(_widgets);

  ContentManager(){
    _widgets.addAll({"SlideShow": const SlideShow(), "Shop": const Shop(), "Inventory" : const Inventory(), "CardArchive": const CardArchive(), "Queue": const QueueMenu()});
  }

  set setCurrentContent(String newContent) {
    _currentContent = newContent;
    notifyListeners();
  }

  String get getCurrentContent => _currentContent;


}