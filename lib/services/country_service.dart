import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/base_response.dart';
import '../models/country_model.dart';


class CountryService{
  var url = Uri.https('restcountries.com', 'v3.1/all');


  Future<BaseResponse> getListCountry() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {

      List<CountryModel> countryList = [];
      List<dynamic> decode = json.decode(response.body);

      for (var element in decode) {
        countryList.add(CountryModel.fromJson(element));
      }

      print(countryList.first.name.common);
      print(countryList.first.capital!.first);
      print(countryList.first.region);
      print(countryList.first.subregion);
      print(countryList.first.languages!.values.first);
      print(countryList.first.population);
      print(countryList.first.flags.png);

      print(countryList.first.toJson());

      countryList.sort((a,b) => a.name.common.compareTo(b.name.common));
      BaseResponse result = BaseResponse(
          statusCode: response.statusCode,
          message: response.reasonPhrase??"",
          data: countryList
      );

      return result;
    }
    return BaseResponse(
        statusCode: response.statusCode,
        message: response.reasonPhrase??"",
        data: List.empty()
    );
  }

}