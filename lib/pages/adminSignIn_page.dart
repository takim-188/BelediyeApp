
import 'package:belediye_app/pages/home_page.dart';
import 'package:belediye_app/pages/userSignUp.dart';
import 'package:flutter/material.dart';

class AdminSignInPage extends StatefulWidget {
  const AdminSignInPage({Key? key}) : super(key: key);

  @override
  State<AdminSignInPage> createState() => _AdminSignInPageState();
}

class _AdminSignInPageState extends State<AdminSignInPage> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? text = "";

  TextEditingController controller = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 150,),
          Center(
            child: Text("Giriş",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),

          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                onChanged: (value){},
                cursorColor: Colors.redAccent,
                keyboardType: TextInputType.text,
                controller: controller ,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Kullanıcı Adı",
                    hintText: "Kullanıcı Adı",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.redAccent)
                    )
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                onChanged: (value){},
                obscureText: _obscureText,
                cursorColor: Colors.redAccent,
                keyboardType: TextInputType.text,
                controller: passwordController ,
                decoration: InputDecoration(
                    prefixIconColor: Colors.redAccent,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(icon: _obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility,), onPressed: _toggle,),
                    labelText: "Giriş Kodu",
                    hintText: "Giriş Kodu",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.redAccent)
                    )
                ),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
                height: 50,
                minWidth: 100,
                color: Colors.blueGrey,
                child: Text("Giriş Yap",style: TextStyle(color: Colors.white),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

                }
            ),
          ),

        ],
      ),
    );
  }
}
