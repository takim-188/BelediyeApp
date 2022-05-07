
import 'package:belediye_app/pages/home_page.dart';
import 'package:belediye_app/pages/userSignUp.dart';
import 'package:flutter/material.dart';

class UserSignInPage extends StatefulWidget {
  const UserSignInPage({Key? key}) : super(key: key);

  @override
  State<UserSignInPage> createState() => _UserSignInPageState();
}

class _UserSignInPageState extends State<UserSignInPage> {
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
          SizedBox(height: 50,),
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
              padding: const EdgeInsets.only(left: 250, right: 250),
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
              padding: const EdgeInsets.only(left: 250, right: 250),
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
                    labelText: "Parola",
                    hintText: "Parola",
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
                child: Text("Giriş",style: TextStyle(color: Colors.white),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Text("Bir hesabınız yok mu? Kaydol",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 15),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserSignUpPage()));
              },),
          )
        ],
      ),
    );
  }
}
