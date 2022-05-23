import 'dart:async';
import 'package:belediye_app/pages/user_type_page.dart';
import 'package:flutter/material.dart';
import '../models/slide.dart';
import '../widgets/slide_dots.dart';
import '../widgets/slide_item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  final PageController _pageController = PageController(
      initialPage: 0
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {

      if (_currentPage < 2) {
        _currentPage++;
      }
      else {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Anasayfa'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children:<Widget> [
              //DropdownButton(
              DropdownButtonFormField(
                  decoration:InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width:1,color:Colors.orange),
                    ),
                  ),
                  //),
                  items: <String>['A Belediyesi', 'B Belediyesi', 'C Belediyesi', 'D Belediyesi'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {

                  }
              ),
              Expanded(
                child:
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget> [
                    PageView.builder(
                      itemBuilder: (ctx, i) => SlideItem(i),
                      itemCount: slideList.length,
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,

                    ),
                    Stack(
                      children: <Widget> [
                        Container(
                          margin: const EdgeInsets.only(bottom: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget> [
                              for (int i = 0 ; i < slideList.length; i++)
                                if (i == _currentPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)

                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget> [
                  FlatButton(
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserType()));
                    },
                    child: Text('Giriş Yap', style: TextStyle( fontSize: 18, color: Colors.white)
                      ,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.orange,
                    padding: const EdgeInsets.all(15),

                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );


    throw UnimplementedError();
  }
}