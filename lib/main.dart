import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Util.dart';

//
// VIDEO EN: https://www.youtube.com/watch?v=FqTES533y58
// VIDEO: https://www.youtube.com/watch?v=i819v3WXI9w&t=315s
void main() =>  runApp(MyApp());
final int Max_WIDTH = 1440;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: ContentWidget(
            child: Column(
              children: <Widget>[
                SizedBox(height: 8.0,),
                HeaderWidget(),
                SizedBox(height: 8.0,),
                BrandsWidget(),
                SizedBox(height: 8.0,),
                FeatureWidget(),
                SizedBox(height: 8.0,),
                ItemsWidget(),
                SizedBox(height: 8.0,),
                ServicesWidget(),
                SizedBox(height: 8.0,),
                FormWidget(),
                SizedBox(height: 8.0,),
                FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  final Widget child;

  const ContentWidget({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: screenSize(context).width < Max_WIDTH ? screenSize(context).width : Max_WIDTH,
            child: child),
      ],
    );
  }
}
class HideIf extends StatelessWidget {
  final double widthLessThan;
  final Widget child;

  const HideIf({Key key, this.widthLessThan, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    if (screenSize.width > widthLessThan){
      return child;
    }
    return Container();
  }
}

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Size screenSize = MediaQuery.of(context).size;
    var width =  screenSize(context).width < Max_WIDTH ? screenSize(context).width : Max_WIDTH;
    print("............................ANCHO PANTALLA .............................................. "+ screenSize(context).width.toString());
    return Container(
      height: width * 3 / 7.0,
      child: Row(
        children: [
          Container(
            color: Color(0xff1D8179),
            width: width * 3 / 7.0,
            child: AspectRatio(
                aspectRatio: 1.0,
                child: _headline(context)
            ),
          ),
          Expanded(flex: 3, child: Image.asset('salonPortada.jpg')),
        ],
      ),
    );
  }
  Widget _headline(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;
    var width = screenSize.width < Max_WIDTH ? screenSize.width : Max_WIDTH;
    var leftPadding = lerpDouble(8, 180, (width - 500) / Max_WIDTH );
    var otherPadding = lerpDouble(4, 40, (width - 500) / Max_WIDTH );
    var titleFontSize = lerpDouble(12, 45, (width - 500) / Max_WIDTH );
    var subTitleFontSize = lerpDouble(8, 16, (width - 500) / Max_WIDTH );

    print(titleFontSize);
    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding,
        right: otherPadding,
        top: otherPadding,
        bottom: otherPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Feel the Conform Using our Products",
            style: TextStyle(
              color: Colors.white,
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),),
          SizedBox(height: 12.0,),
          Text("Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta)",
            style: TextStyle(
              color: Colors.white,
              fontSize: subTitleFontSize,
            ),),
          SizedBox(height: 12.0,),
          Row(
            children: [
              Container(
                color: Colors.orange,
                child: FlatButton(
                  color: Colors.orange,
                  textColor: Colors.white,
                  child: Text("Shop Now"),
                  onPressed: (){},
                ),
              ),
              SizedBox(width: 12.0,),
              HideIf(widthLessThan: 700,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                        right: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                        top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                        bottom: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                      )
                  ),
                  child: FlatButton(
                    textColor: Colors.white,
                    child: Text("Try to My Room"),
                    onPressed: (){},
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BrandsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(width: 100, height: 80, child: Placeholder()),
        Container(width: 100, height: 80, child: Placeholder()),
        Container(width: 100, height: 80, child: Placeholder()),
        Container(width: 100, height: 80, child: Placeholder()),
      ],
    );
  }
}

class FeatureWidget extends StatefulWidget {
  @override
  _FeatureWidgetState createState() => _FeatureWidgetState();
}

class _FeatureWidgetState extends State<FeatureWidget> {
  int currentSelection = 0;
  List<String> chosen = [
    'sofa1.jpg',
    'sofa2.jpg',
    'sofa3.jpg',
    'sofa4.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Column(
        children: [
          _header(),
          Expanded(child: _content()),
        ],
      ),
    );
  }

  Widget _header(){
    return Row(
      children: [
        Text("Our Featured\n Item",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            width: 2.0,
            color: Colors.grey,
            height: 40.0,
          ),
        ),
        Flexible(child: Text("Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta)")),
      ],
    );
  }

  Widget _content(){
    // VIDEO: https://www.youtube.com/watch?v=i819v3WXI9w&t=315s
    // minuts: 14:00
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        return Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: constraints.biggest.width * 0.2),
                child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: Image.asset(
                        chosen[currentSelection],
                        key: Key(chosen[currentSelection]) // li fa falta un Key per fer l'animació
                    )),
              ),
            ),
            Positioned(
              right: constraints.biggest.width * 0.2 / 2.5,
              bottom: 0,
              top: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Color\nChoise"),
                  _choise(Colors.green, 0),
                  SizedBox(height: 10,),
                  _choise(Colors.orange, 1),
                  SizedBox(height: 10,),
                  _choise(Colors.blue, 2),
                  SizedBox(height: 10,),
                  _choise(Colors.brown, 3),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Widget _choise(Color color, int index ){
    return GestureDetector(
      onTap: (){
        setState(() {
          currentSelection = index;
        });
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: currentSelection == index ? Center(
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
          ),
        ) : null,
      ),
    );
  }
}

class ItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Placeholder(),
    );
  }
}

class ServicesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Placeholder(),
    );
  }
}

class FormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Placeholder(),
    );
  }
}

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Footer"),
      ],
    );
  }
}
