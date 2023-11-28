import 'package:intl/intl.dart';

class CurrencyService{
  String usdToIdr(double usd){
    var format = NumberFormat.currency(locale: "id", symbol: "");
    var result = usd * 15424.30;
    return format.format(result);
  }

  String idrToUsd(double idr){
    var result = idr * 0.000065;
    return result.toString();
  }

  String sgdToIdr(double sgd){
    var format = NumberFormat.currency(locale: "id", symbol: "");
    var result = sgd * 11474.71;
    return format.format(result);
  }

  String idrToSgd(double idr){
    var result = idr * 0.000087;
    return result.toString();
  }

  String eurToIdr(double eur){
    var format = NumberFormat.currency(locale: "id", symbol: "");
    var result = eur * 16839.48;
    return format.format(result);
  }

  String idrToEur(double idr){
    var result = idr * 0.000059;
    print(result);
    return result.toString();
  }
}