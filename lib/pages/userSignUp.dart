
import 'package:belediye_app/pages/userSignIn_page.dart';
import 'package:flutter/material.dart';


class UserSignUpPage extends StatefulWidget {
  const UserSignUpPage({Key? key}) : super(key: key);

  @override
  State<UserSignUpPage> createState() => _UserSignUpPageState();
}

class _UserSignUpPageState extends State<UserSignUpPage> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? text = "";
  TextEditingController controller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
          Text("Kaydol", style: TextStyle(fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold ),),
          SizedBox(height: 50,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 250, right: 250),
              child: TextField(

                cursorColor: Colors.redAccent,
                keyboardType: TextInputType.text,
                controller: controller ,
                onChanged: (value){},
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

                cursorColor: Colors.redAccent,
                keyboardType: TextInputType.text,
                controller: phoneController ,
                onChanged: (value){},
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Telefon Numarası",
                    hintText: "Telefon Numarası",
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
                cursorColor: Colors.redAccent,
                keyboardType: TextInputType.text,
                obscureText: _obscureText,
                controller: passwordController ,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(icon: _obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility), onPressed: _toggle,),
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
            child: Padding(
              padding: const EdgeInsets.only(left: 250, right: 250),
              child: TextField(
                onChanged: (value){},
                cursorColor: Colors.redAccent,
                keyboardType: TextInputType.text,
                obscureText: _obscureText,
                controller: passwordController ,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(icon: _obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility), onPressed: _toggle,),
                    labelText: "Tekrar Parola",
                    hintText: "Tekrar Parola",
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
                child: Text("Kaydol",style: TextStyle(color: Colors.white),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserSignInPage()));

                }
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserSignInPage()));
                },
                child: Text("Zaten bir hesabınız var mı? Giriş", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54),)),
          )

        ],
      ),
    );
  }
}
