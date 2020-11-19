import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/bloc/pagar/pagar_bloc.dart';
import 'package:stripe_app/data/tarjetas.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/pages/tarjeta_page.dart';
import 'package:stripe_app/services/stripe_service.dart';
import 'package:stripe_app/widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  final stripeService = new StripeService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pagarBloc = context.bloc<PagarBloc>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pagar"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                final amount = pagarBloc.state.montoPagarString;
                final currency = pagarBloc.state.moneda;
                final response = await this
                    .stripeService
                    .pagarConNuevaTarjeta(amount: amount, currency: currency);

                if (response.ok) {
                  mostrarAlerta(context, "Tarjeta Ok", "Todo Correcto");
                } else {
                  mostrarAlerta(context, "Algo salió mal :(", response.msg);
                }
              })
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            width: size.width,
            height: size.height,
            top: 200,
            child: PageView.builder(
                controller: PageController(viewportFraction: 0.9),
                physics: BouncingScrollPhysics(),
                itemCount: tarjetas.length,
                itemBuilder: (_, i) {
                  final tarjeta = tarjetas[i];
                  return GestureDetector(
                    onTap: () {
                      context
                          .bloc<PagarBloc>()
                          .add(OnSeleccionarTarjeta(tarjeta));
                      Navigator.push(
                          context, navegarFadeIn(context, TarjetaPage()));
                    },
                    child: Hero(
                      tag: tarjeta.cardNumber,
                      child: CreditCardWidget(
                          cardBgColor: Color(0xff5abd8c),
                          cardNumber: tarjeta.cardNumberHidden,
                          expiryDate: tarjeta.expiracyDate,
                          cardHolderName: tarjeta.cardHolderName,
                          cvvCode: tarjeta.cvv,
                          showBackView: false),
                    ),
                  );
                }),
          ),
          Positioned(
            bottom: 0,
            child: TotalPayButton(),
          )
        ],
      ),
    );
  }
}
