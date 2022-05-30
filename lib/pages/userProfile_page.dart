import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';



class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {


  String? selectedLanguage;
  File? _secilenDosya;
  bool _isEditOn = true;
  bool _isEditOn2 = true;


  void _toggle() {
    setState(() {
      _isEditOn = !_isEditOn;
    });
  }

  void _toggle2() {
    setState(() {
      _isEditOn2 = !_isEditOn2;
    });
  }
  String text = "";
  String languageName = "Choose a Language";
  TextEditingController controller = TextEditingController();

  File? image;
  Future pickImage(ImageSource source) async {
    try{
      final image = await ImagePicker().pickImage(source: source);
      if(image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    }on PlatformException catch (e){
      print('Failed to pick image: $e');

    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(

      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text("22/05/2022", style: TextStyle(fontSize: 20),),
                    ),
                  ],),

                Container(
                  child: Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          child: image == null ? Icon(Icons.person, size: 60,): null,
                          radius: 75,
                          backgroundImage: image != null ? FileImage(image!): null,
                        ),
                        Positioned(
                            bottom: 2,
                            right: 3,
                            child:
                            Container(
                              width: width*0.09,
                              height: width*0.09,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: IconButton(
                                onPressed: (){
                                  _showPhoto(context);
                                },
                                icon: Center(
                                  child: Icon(Icons.camera_alt_rounded,
                                  ),
                                ),),

                            )
                        )],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(text, style: TextStyle(fontSize: 24),
                    )],
                ),

              ],
            ),
          ),
          SizedBox(height: height*0.01,),
          Padding(
            padding: EdgeInsets.fromLTRB(width*0.11, 8, width*0, 20),
            child: TextField(
              controller: controller,
              onChanged: (value){},
              keyboardType: TextInputType.text,
              readOnly: _isEditOn,
              //controller: passwordController2 ,
              decoration: InputDecoration(

                prefixIcon: Icon(Icons.person, ),
                labelText: "Ad Soyad",
                suffixIcon: IconButton(icon: _isEditOn ? Icon(Icons.edit) : Icon(Icons.done),
                  onPressed: (){
                    setState(() {
                      _toggle();
                      text = controller.text;
                    });
                  },
                ),


                //border: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(20),
                //borderSide: BorderSide(color: Colors.redAccent,style: BorderStyle.solid)
                // )
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(width*0.11, 8, width*0, 20),
            child: TextField(
              maxLines: 5,
              minLines: 2,
              onChanged: (value){},

              keyboardType: TextInputType.text,
              readOnly: _isEditOn2,
              //controller: passwordController2 ,
              decoration: InputDecoration(

                labelText: "Telefon Numarası",
                prefixIcon: Icon(Icons.phone),
                suffixIcon: IconButton(icon: _isEditOn2 ? Icon(Icons.edit) : Icon(Icons.done), onPressed: _toggle2,),

                //border: OutlineInputBorder(
                //  borderRadius: BorderRadius.circular(20),
                // borderSide: BorderSide(color: Colors.redAccent,style: BorderStyle.solid)
                //)
              ),
            ),
          ),
          SizedBox(height: height*0.01,),

          Padding(
            padding: EdgeInsets.only(left: width* 0.2, right: width*0.2),
            child: FlatButton(
              onPressed: () {
              },
              child: Text('Geçmiş Bildirilerim', style: TextStyle( fontSize: 18)
                ,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(15),

            ),
          )

        ],
      ),
    );
  }

  void _showPhoto(BuildContext context) {

    showDialog(context: context,
        builder: (context) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget> [
              buildButton(
                  title: 'Gallery',
                  icon: Icons.image_outlined,
                  onClicked: () {
                    pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  }),
              buildButton(
                title: 'Camera',
                icon: Icons.camera,
                onClicked: () {
                  pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }


  void _secimYukle(ImageSource source) async{
    final picker = ImagePicker();
    final secilen = await picker.getImage(source: source);
    setState(() {
      if(secilen != null){

        // _secilenDosya = File(secilen.path);
        _fotografKes(File(secilen.path));
      }
    });

  }
  void _fotografKes(File photo) async{
    File? kesilenFoto = (await ImageCropper().cropImage(
      sourcePath: photo.path,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      maxWidth: 800,
    )) as File?;
    if(kesilenFoto != null){
      setState(() {
        _secilenDosya = kesilenFoto;
      });
    }
  }
}

class ProfileButton extends StatelessWidget {
  ProfileButton({
    Key? key, required this.title
  }) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: MaterialButton(
          elevation: 10,
          minWidth: 30,
          height: height*0.08 ,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Text(title, style: TextStyle(fontSize: 18),),
          onPressed: (){}),
    );
  }
}

Widget buildButton({
  required String title,
  required IconData icon,
  required VoidCallback onClicked,
}) =>
    ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(56),
            textStyle: TextStyle(fontSize: 20),
            elevation: 0
        ),
        onPressed: onClicked,
        child: Row(
          children: [
            Icon(icon, size: 28),
            const SizedBox(width: 16),
            Text(title),
          ],
        ));
