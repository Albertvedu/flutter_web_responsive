import 'package:flutter/material.dart';
void pushPage(context, page) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => page),
  );
}
Size screenSize(context){
  Size screenSize = MediaQuery.of(context).size;
  return screenSize;
}
