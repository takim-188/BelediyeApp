
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/drop_down.dart';


class BildiriPage extends StatefulWidget {

  @override
  State<BildiriPage> createState() => _BildiriPageState();
}


class _BildiriPageState extends State<BildiriPage> {
  String? selectedLanguage;
  List<String> items = [
  "Temizlik",
  "Hava Kirliliği",
  "Su"];
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    _determinePosition();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  Position? myCurrentLocation;

  Future _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    } else {
      print("serviceEnabled");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    } else {
      print("permission not denied");
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    } else {
      print("not denied forever");
    }

    Position sth = await Geolocator.getCurrentPosition();

    setState(() async {
      myCurrentLocation = sth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3b42bf),
        title: Text("Bildiri Sayfası"),
      ),
      body: Container(

        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(width*0.02),
              child: Row(
                children: [
                  SizedBox(
                    height: width * 0.35,
                    width: width * 0.35,
                    child: Card(
                      elevation: 0,
                      child: ElevatedButton(
                        child: Icon(
                          Icons.camera_alt,
                          size: width / 7,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const Center()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[350],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      dropdown_menu(
                        width: width,
                        myFocusNode: myFocusNode,
                        list: items,
                        name: "Bildiri Başlığı",
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      dropdown_menu(
                        width: width,
                        myFocusNode: myFocusNode,
                        list: items,
                        name: "Bildiri Türü",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(width*0.11, 8, width*0.11, 20),
                  child: TextField(
                    minLines: 2,
                    maxLines: 7,
                    onChanged: (value){},
                    cursorColor: Colors.blueGrey,
                    keyboardType: TextInputType.text,
                    //controller: passwordController2 ,
                    decoration: InputDecoration(
                      labelText: "Bildiri Açıklaması",
                    ),
                  ),
                ),
              ],
            ),

            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.grey, style: BorderStyle.solid, width: 2),
              ),
              elevation: 10,
              child: FutureBuilder(
                  future: _determinePosition(),
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return  SizedBox(
                        height: width / 2,
                        width: width* 0.6,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.grey, style: BorderStyle.solid, width: 1),
                          ),
                          elevation: 10,
                          child: FutureBuilder(
                              future: _determinePosition(),
                              builder: (context, snapShot) {
                                if (snapShot.connectionState == ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return FlutterMap(
                                    options: MapOptions(
                                        center: LatLng(
                                            myCurrentLocation == null
                                                ? 38.9637
                                                : myCurrentLocation!.latitude,
                                            myCurrentLocation == null
                                                ? 35.2433
                                                : myCurrentLocation!.longitude),
                                        zoom: 8),
                                    layers: [
                                      TileLayerOptions(
                                        urlTemplate:
                                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                        subdomains: ['a', 'b', 'c'],
                                      ),
                                      MarkerLayerOptions(markers: [
                                        Marker(
                                            point: LatLng(38.9637, 35.2433),
                                            builder: (context) => Icon(
                                              Icons.person_pin_circle_sharp,
                                              size: height * 0.03,
                                              color: Colors.blue,
                                            )),
                                      ])
                                    ],
                                  );
                                }
                              }),
                        ),
                      );
                    }
                  }),
            ),

            SizedBox(
              height: height*0.002,
            ),
            Padding(
              padding: EdgeInsets.only(left: width* 0.35, right: width*0.35),
              child: FlatButton(
                onPressed: () {
                },
                child: Text('Bildir', style: TextStyle( fontSize: 18, color: Colors.white)
                  ,),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Color(0xFFF2A649),
                padding: const EdgeInsets.all(15),

              ),
            )
          ],

        ),
      ),

    );
  }

}
