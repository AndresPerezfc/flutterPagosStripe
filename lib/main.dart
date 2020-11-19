import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/bloc/pagar/pagar_bloc.dart';
import 'package:stripe_app/pages/home_page.dart';
import 'package:stripe_app/pages/pago_completo_page.dart';
import 'package:stripe_app/pages/tarjeta_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => PagarBloc())],
      child: MaterialApp(
        title: 'StripeApp',
        initialRoute: 'home',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: Color(0xff5abd8c),
        ),
        routes: {
          'home': (_) => HomePage(),
          'pago_completo': (_) => PagoCompletoPage(),
          'tarjeta': (_) => TarjetaPage()
        },
      ),
    );
  }
}
