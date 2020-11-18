import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PagoCompletoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pago realizado"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.star,
            color: Colors.black54,
            size: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Pago Realizado correctamente",
            style: TextStyle(color: Colors.black54, fontSize: 20),
          )
        ],
      )),
    );
  }
}
