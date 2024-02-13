import 'dart:convert';

import 'package:e_commerce/features/home/data/models/brands.model.dart';

List<BrandsModel> changeListStringToListModel(List<String>? brandList) {
  List<BrandsModel> brandsList = [];
  for (var item in brandList ?? []) {
    var data = BrandsModel.fromJson(json.decode(item));
    brandsList.add(data);
  }
  return brandsList;
}