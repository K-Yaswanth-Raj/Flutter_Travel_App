import 'package:dio/dio.dart';
import 'package:travel_app/services/model/model.dart';

import 'api/api.dart';

class DataServices {
  API api = API();
  Future<List<Model>> getInfo() async {
    try {
      Response response = await api.sendRequest.get('/getplaces');

      List<dynamic> data = response.data;
      return data.map((e) => Model.fromJson(e)).toList();
    } catch (ex) {
      throw (ex);
    }
  }
}
