import 'package:flutter/material.dart';

class LastNotification extends StatefulWidget {
  const LastNotification({Key? key}) : super(key: key);

  @override
  State<LastNotification> createState() => _LastNotificationState();
}

class _LastNotificationState extends State<LastNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00D9D2),
        title: Text("Geçmiş Bildiriler Detay Sayfası"),
      ),
      body: FittedBox(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: const [
              Align(
                alignment: Alignment.centerRight,
                child: Text('GG/AA/YYYY SS:DD'),
              ),
              SizedBox(height: 16 ),

              Text(
                'Bildirim Detayı',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold) ,
              ),
              //SizedBox(height: 16.0,)
             // Image(image: AssetImage(assetName))  // Bildirim detayı resim olacaksa aktif edin
              SizedBox(height: 16.0),
              Text(
                "Bildirim Açıklama Alanı",
                style: TextStyle(
                  fontSize: 16.0,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}