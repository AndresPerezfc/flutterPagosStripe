import 'package:meta/meta.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripeService {
  //SingleTon

  StripeService._privateConstructor();

  static final StripeService _instance = StripeService._privateConstructor();

  factory StripeService() => _instance;

  String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';

  String _secretKey =
      'sk_test_51Hp4lPIfVYR5ciPuYtbBxeFrZ2bMprKpiKHVWEyVXjrITh7gNIVsFSap4sVI6c0rMx5efSSDVNlpI57y10LJwu4N00R7z2MFzE';

  void init() {}

  Future pagarConTarjetaExiste({
    @required String amount,
    @required String currency,
    @required CreditCard card,
  }) async {}

  Future pagarConNuevaTarjeta({
    @required String amount,
    @required String currency,
  }) async {}

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
