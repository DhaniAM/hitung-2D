import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';
import 'package:hitung_2d/widget/geometry_props.dart';
import 'package:hitung_2d/widget/hitung_button.dart';
import 'package:hitung_2d/widget/input_field.dart';
import 'package:hitung_2d/widget/reset_button.dart';

class TrapesiumPage extends StatefulWidget {
  final String geometryImgDetail;
  const TrapesiumPage({super.key, required this.geometryImgDetail});

  @override
  State<TrapesiumPage> createState() => _TrapesiumPageState();
}

class _TrapesiumPageState extends State<TrapesiumPage> {
  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  final TextEditingController sController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController kelilingController = TextEditingController();
  bool counted = false;

  void hitung() {
    setState(() {
      String a = aController.text;
      String b = bController.text;
      String t = tinggiController.text;
      String cd = sController.text;
      String l = luasController.text;
      String k = kelilingController.text;

      /// if a, b, t known, count L
      if (a != '' && b != '' && t != '' && l == '') {
        int alas = int.parse(a);
        int atap = int.parse(b);
        int tinggi = int.parse(t);
        luasController.text = ((alas + atap) * tinggi / 2).toString();
        counted = true;
      }

      /// if a, b, cd known, count K
      if (a != '' && b != '' && cd != '' && k == '') {
        int alas = int.parse(a);
        int atap = int.parse(b);
        int sisiCD = int.parse(cd);
        kelilingController.text = (alas + atap + sisiCD + sisiCD).toString();
        counted = true;
      }

      /// if L, b, t known, count a
      if (l != '' && b != '' && t != '' && a == '') {
        int luas = int.parse(l);
        int atap = int.parse(b);
        int tinggi = int.parse(t);
        aController.text = (((luas * 2) - (tinggi * atap)) / tinggi).toString();
        counted = true;
      }

      /// if L, a, t known, count b
      if (l != '' && a != '' && t != '' && b == '') {
        int luas = int.parse(l);
        int alas = int.parse(a);
        int tinggi = int.parse(t);
        bController.text = (((luas * 2) - (tinggi * alas)) / tinggi).toString();
        counted = true;
      }

      /// if L, a, b known, count t
      if (l != '' && a != '' && b != '' && t == '') {
        int luas = int.parse(l);
        int alas = int.parse(a);
        int atap = int.parse(b);
        tinggiController.text = ((luas * 2) / (alas + atap)).toString();
        counted = true;
      }

      /// if K, b, cd known, count a
      if (k != '' && b != '' && cd != '' && a == '') {
        int keliling = int.parse(k);
        int atap = int.parse(b);
        int sisi = int.parse(cd);
        aController.text = (keliling - (atap + sisi + sisi)).toString();
        counted = true;
      }

      /// if K, a, cd known, count b
      if (k != '' && a != '' && cd != '' && b == '') {
        int keliling = int.parse(k);
        int alas = int.parse(a);
        int sisi = int.parse(cd);
        bController.text = (keliling - (alas + sisi + sisi)).toString();
        counted = true;
      }

      /// if K, a, b known, count cd
      if (k != '' && a != '' && b != '' && cd == '') {
        int keliling = int.parse(k);
        int alas = int.parse(a);
        int atap = int.parse(b);
        sController.text = ((keliling - (alas + atap)) / 2).toString();
        counted = true;
      }

      // error input state
      if (counted == false) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Salah input'),
              content: const Text('Tidak bisa menghitung :('),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                )
              ],
            );
          },
        );
      }
    });
  }

  void reset() {
    setState(() {
      aController.text = '';
      bController.text = '';
      tinggiController.text = '';
      sController.text = '';
      luasController.text = '';
      kelilingController.text = '';
      counted = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    aController.dispose();
    bController.dispose();
    tinggiController.dispose();
    sController.dispose();
    luasController.dispose();
    kelilingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trapesium',
          style: TextStyle(fontSize: 24),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: myOrange,
        foregroundColor: myWhite,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Image(
                image: AssetImage(widget.geometryImgDetail),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const <Widget>[
                      SizedBox(height: 20),
                      GeometryProps(props: 'Sisi bawah (a): '),
                      GeometryProps(props: 'Sisi atas (b): '),
                      GeometryProps(props: 'Tinggi (t): '),
                      GeometryProps(props: 'Sisi (c, d): '),
                      GeometryProps(props: 'Luas (L): '),
                      GeometryProps(props: 'Keliling (K): '),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InputField(controller: aController),
                      InputField(controller: bController),
                      InputField(controller: tinggiController),
                      InputField(controller: sController),
                      InputField(controller: luasController),
                      InputField(controller: kelilingController),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HitungButton(hitung: hitung),
                  const SizedBox(width: 30),
                  ResetButton(reset: reset),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
