import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';
import 'package:hitung_2d/widget/geometry_props.dart';
import 'package:hitung_2d/widget/hitung_button.dart';
import 'package:hitung_2d/widget/input_field.dart';
import 'package:hitung_2d/widget/reset_button.dart';

class SegitigaPage extends StatelessWidget {
  final String geometryImgDetail;
  const SegitigaPage({super.key, required this.geometryImgDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Segitiga',
          style: TextStyle(fontSize: 24),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: myDarkGreen,
        foregroundColor: myBlack,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Image(
                image: AssetImage(geometryImgDetail),
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
                      GeometryProps(props: 'Alas / Sisi 1 (a): '),
                      GeometryProps(props: 'Tinggi (t): '),
                      GeometryProps(props: 'Sisi 2 (b): '),
                      GeometryProps(props: 'Sisi 3 (c): '),
                      GeometryProps(props: 'Luas (L): '),
                      GeometryProps(props: 'Keliling (K): '),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      InputField(),
                      InputField(),
                      InputField(),
                      InputField(),
                      InputField(),
                      InputField(),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  HitungButton(),
                  SizedBox(width: 30),
                  ResetButton(),
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
