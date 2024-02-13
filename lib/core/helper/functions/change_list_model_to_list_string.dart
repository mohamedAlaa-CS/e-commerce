import 'dart:convert';

import 'package:e_commerce/features/home/domain/entity/brands_entity.dart';

List<String> changeListModelToListString(
    {required List<BrandsEntity> brandsList}) {
  List<String> newList = [];
  for (var item in brandsList) {
    var data = json.encode(item);
    newList.add(data);
  }
  return newList;
}
