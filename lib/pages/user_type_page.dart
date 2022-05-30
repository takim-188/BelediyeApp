import 'package:belediye_app/pages/adminSignIn_page.dart';
import 'package:belediye_app/pages/userSignIn_page.dart';
import 'package:flutter/material.dart';

class UserType extends StatefulWidget {
  const UserType({Key? key}) : super(key: key);

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User Type"),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: height*0.3,),
        Padding(
          padding: const EdgeInsets.only(left:30, right: 30),
          child: SizedBox(
            height: height*0.06,
            child: ElevatedButton.icon(
              style:ElevatedButton.styleFrom(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(100, 40), //////// HERE
              ),
              label: Text("Kullanıcı Girişi", style: TextStyle(fontSize: height*0.04, fontWeight: FontWeight.bold),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserSignInPage()));

              }, icon: Icon(Icons.east_rounded, size: height*0.05,),),
          ),
        ),
            SizedBox(height: height*0.05,),
      Padding(
        padding: const EdgeInsets.only(left:30, right: 30),
        child: SizedBox(
          height: height*0.06,
          child: ElevatedButton.icon(
            style:ElevatedButton.styleFrom(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: Size(100, 40), //////// HERE
            ),
            label: Text("Çalışan Girişi", style: TextStyle(fontSize: height*0.04, fontWeight: FontWeight.bold),),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminSignInPage()));

            }, icon: Icon(Icons.east_rounded, size: height*0.05,),),
        ),
      ),
            SizedBox(height: height*0.2,),

          ],
        ),
      ),
    );
  }
}

