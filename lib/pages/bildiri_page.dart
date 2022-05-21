import 'package:flutter/material.dart';

class BildiriPage extends StatefulWidget {
  const BildiriPage({Key? key}) : super(key: key);

  @override
  State<BildiriPage> createState() => _BildiriPageState();
}

class _BildiriPageState extends State<BildiriPage> {
  String? selectedLanguage;
  List<String> items = [
  "Temizlik",
  "Hava Kirliliği",
  "Su"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Bildiri Sayfası"),
      ),
      body: Container(

        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(width*0.11, 8, width*0.11, 20),
                  child: TextField(

                    onChanged: (value){},
                    cursorColor: Colors.blueGrey,

                    keyboardType: TextInputType.text,
                    //controller: passwordController2 ,
                    decoration: InputDecoration(

                      labelText: "Bildiri Başlığı",
                      //prefixIcon: Icon(Icons.work_outline),
                      //prefixIconColor: Colors.blueGrey,
                     // suffixIcon: IconButton(icon: _isEditOn2 ? Icon(Icons.edit, color: Colors.blueGrey,) : Icon(Icons.done, color: Colors.blueGrey,), onPressed: _toggle2,),

                      //border: OutlineInputBorder(
                      //  borderRadius: BorderRadius.circular(20),
                      // borderSide: BorderSide(color: Colors.redAccent,style: BorderStyle.solid)
                      //)
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(width*0.11, 8, width*0.11, 20),
                  child: DropdownButton(
                    value: selectedLanguage,
                    onChanged: (value) {
                      setState((){
                        selectedLanguage = value.toString();
                      });
                    },
                    hint: Padding(
                      padding: EdgeInsets.fromLTRB(width*0.11, 8, width*0.11, 20),
                      child: Center(child: Text("Bildiri Türü", style: TextStyle(color: Colors.blueGrey),)),
                    ),


                    items: items.map((String name) {
                      return DropdownMenuItem<String>(
                        value: name,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(name),
                        ),
                      );

                    }).toList(),
                  ),
                ),


                Padding(
                  padding: EdgeInsets.fromLTRB(width*0.11, 8, width*0.11, 20),
                  child: TextField(

                    onChanged: (value){},
                    cursorColor: Colors.blueGrey,

                    keyboardType: TextInputType.text,
                    //controller: passwordController2 ,
                    decoration: InputDecoration(

                      labelText: "Bildiri Açıklaması",
                      //prefixIcon: Icon(Icons.work_outline),
                      //prefixIconColor: Colors.blueGrey,
                      // suffixIcon: IconButton(icon: _isEditOn2 ? Icon(Icons.edit, color: Colors.blueGrey,) : Icon(Icons.done, color: Colors.blueGrey,), onPressed: _toggle2,),

                      //border: OutlineInputBorder(
                      //  borderRadius: BorderRadius.circular(20),
                      // borderSide: BorderSide(color: Colors.redAccent,style: BorderStyle.solid)
                      //)
                    ),
                  ),
                ),
              ],
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),//or 15.0
              child: Padding(
                padding: EdgeInsets.only(left: width*0.1, right: width*0.2),
                child: Container(
                  height: width*0.2,
                  width: width*0.2,
                  color: Colors.grey[300],
                  child: Icon(Icons.camera, color: Colors.white, size: 50.0),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
