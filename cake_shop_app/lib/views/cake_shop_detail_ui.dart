// ignore_for_file: sized_box_for_whitespace

import 'package:cake_shop_app/models/cake_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class CakeShopDetailUi extends StatefulWidget {
//สร้างตัวแปลเพื่อรับข้อมูลที่ส่งมาจากอีกหน้านึง
  CakeShop? cakeShop;

//เอาตัวแปลที่สร้างมารับข้อมูลที่ส่งมาจากอีกหน้านึง
  CakeShopDetailUi({super.key, this.cakeShop});

  @override
  State<CakeShopDetailUi> createState() => _CakeShopDetailUiState();
}

class _CakeShopDetailUiState extends State<CakeShopDetailUi> {
  //method โทร
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  //mathod เปิดwebsite และเปิดแอปภายนอกผ่านทาง URL
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.cakeShop!.name!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40,
            left: 35,
            right: 35,
            bottom: 50,
          ),
          child: Center(
            child: Column(
              children: [
                //ส่วนของรูปภาพ1
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.cakeShop!.image1!,
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //ส่วนของรูปภาพ2
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.cakeShop!.image2!,
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  //ส่วยนของรูปภาพ3
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.cakeShop!.image3!,
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 20,
                ),
                //ส่วนของชื่อร้าน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('ชื่อร้าน ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.cakeShop!.name!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('เวลาเปิด-ปิด',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.cakeShop!.openCloseTime!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('ราละเอียดของร้าน',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.cakeShop!.description!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('ที่อยู่ร้าน',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.cakeShop!.address!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      )),
                ),

                SizedBox(
                  height: 20,
                ),
                //ส่วนของเบอร์โทร ต้องสามารถโทรได้
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    _makePhoneCall(widget.cakeShop!.phone!);
                  },
                  child: Text('โทร ${widget.cakeShop!.phone}'),
                ),
                SizedBox(
                  height: 20,
                ),
                //ส่วนของเว็บไซต์
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.globe,
                    color: Colors.yellow,
                  ),
                  title: Text(widget.cakeShop!.website!),
                  trailing: Icon(Icons.link),
                  onTap: () {
                    _launchInBrowser(Uri.parse(widget.cakeShop!.website!));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                //ส่วนของเฟสบุ๊ค
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blueAccent,
                  ),
                  title: Text(widget.cakeShop!.facebook!),
                  trailing: Icon(Icons.link),
                  onTap: () {
                    _launchInBrowser(Uri.parse(widget.cakeShop!.facebook!));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                //ส่วนของแผนที่
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 450,
                  child: FlutterMap(
                    //กำหนดตำแห่งแผนที่
                    options: MapOptions(
                      initialCenter: LatLng(
                        double.parse(widget.cakeShop!.latitude!),
                        double.parse(widget.cakeShop!.longitude!),
                      ),
                      initialZoom: 16,
                    ),
                    //วาดตัวแผนที่
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://{s}.google.com/vt/lyrs=m,h&x={x}&y={y}&z={z}&hl=ar-MA&gl=MA',
                        subdomains: const ['mt0', 'mt1', 'mt2', 'mt3'],
                        userAgentPackageName: 'com.example.app',
                      ),
                      RichAttributionWidget(
                        attributions: [
                          TextSourceAttribution(
                            'OpenStreetMap contributors',
                            onTap: () {
                              launchUrl(
                                Uri.parse(
                                    'https://openstreetmap.org/copyright'),
                              );
                            },
                          ),
                        ],
                      ),
                      //ใส่มาร์คเกอร์
                      MarkerLayer(
                        markers: [
                          Marker(
                              point: LatLng(
                                double.parse(widget.cakeShop!.latitude!),
                                double.parse(widget.cakeShop!.longitude!),
                              ),
                              child: InkWell(
                                onTap: () {
                                  //เปิดแผนที่ไปยังตัวมาร์คเกอร์
                                  _launchInBrowser(
                                    Uri.parse('https://www.google.com/maps/search/?api=1&query=${widget.cakeShop!.latitude},${widget.cakeShop!.longitude}'),
                                  );
                                },
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                  size: 40,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
