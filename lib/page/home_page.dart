import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';
import 'package:hitung_2d/page/about_page.dart';
import 'package:hitung_2d/widget/geometry_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myCyan,
        toolbarHeight: 60,
        title: const Text(
          'Hitung 2D',
          style: TextStyle(color: myWhite, fontSize: 36),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) => const AboutPage()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.info_outline,
                size: 36,
                color: myWhite,
              ),
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: const <GeometryTile>[
          GeometryTile(
            geometryName: 'Persegi',
            geometryImg: 'assets/img/persegi.jpg',
            geometryImgDetail: 'assets/img/persegi-detail.jpg',
          ),
          GeometryTile(
            geometryName: 'Persegi Panjang',
            geometryImg: 'assets/img/persegi-panjang.jpg',
            geometryImgDetail: 'assets/img/persegi-panjang-detail.jpg',
          ),
          GeometryTile(
            geometryName: 'Segitiga',
            geometryImg: 'assets/img/segitiga.jpg',
            geometryImgDetail: 'assets/img/segitiga-detail.jpg',
          ),
          GeometryTile(
            geometryName: 'Lingkaran',
            geometryImg: 'assets/img/lingkaran.jpg',
            geometryImgDetail: 'assets/img/lingkaran-detail.jpg',
          ),
          GeometryTile(
            geometryName: 'Jajar Genjang',
            geometryImg: 'assets/img/jajar-genjang.jpg',
            geometryImgDetail: 'assets/img/jajar-genjang-detail.jpg',
          ),
          GeometryTile(
            geometryName: 'Trapesium',
            geometryImg: 'assets/img/trapesium.jpg',
            geometryImgDetail: 'assets/img/trapesium-detail.jpg',
          ),
          GeometryTile(
            geometryName: 'Belah Ketupat',
            geometryImg: 'assets/img/belah-ketupat.jpg',
            geometryImgDetail: 'assets/img/belah-ketupat-detail.jpg',
          ),
          GeometryTile(
            geometryName: 'Layang-Layang',
            geometryImg: 'assets/img/layang-layang.jpg',
            geometryImgDetail: 'assets/img/layang-layang-detail.jpg',
          ),
        ],
      ),
    );
  }
}
