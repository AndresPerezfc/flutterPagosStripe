import 'package:meta/meta.dart';
import 'package:stripe_app/models/stripe_custom_response.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripeService {
  //SingleTon

  StripeService._privateConstructor();

  static final StripeService _instance = StripeService._privateConstructor();

  factory StripeService() => _instance;

  String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';

  String _secretKey =
      'sk_test_51Hp4lPIfVYR5ciPuYtbBxeFrZ2bMprKpiKHVWEyVXjrITh7gNIVsFSap4sVI6c0rMx5efSSDVNlpI57y10LJwu4N00R7z2MFzE';
  String _apiKey =
      'pk_test_51Hp4lPIfVYR5ciPumQdh1XxHAulm5BPWU0Ti4U8cjb3MWQcDC7gOS0ZwznDvGJIlzsXtRBKgdqo0tK4UvNt1q2jz0091569IQp';

  void init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey: this._apiKey,
        androidPayMode: 'test',
        merchantId: 'test'));
  }

  Future pagarConTarjetaExiste({
    @required String amount,
    @required String currency,
    @required CreditCard card,
  }) async {}

  Future<StripeCustomResponse> pagarConNuevaTarjeta({
    @required String amount,
    @required String currency,
  }) async {
    try {
      final paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest());

      //crear el intent

      return StripeCustomResponse(ok: true);
    } catch (e) {
      return StripeCustomResponse(ok: false, msg: e.toString());
    }
  }

  Future pagarApplePayGooglePay({
    @required String amount,
    @required String currency,
  }) async {}

  Future _crearPaymentIntent({
    @required String amount,
    @required String currency,
  }) async {}

  Future _realizarPago({
    @required String amount,
    @required String currency,
    @required PaymentMethod paymentMethod,
  }) async {}
}
