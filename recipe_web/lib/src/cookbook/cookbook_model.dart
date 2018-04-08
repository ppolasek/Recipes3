// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of recipe_web.common_model;

class Cookbook extends DomainCommon {
  String name;

  Cookbook({this.name});

  @override
  String toString() {
    return 'Cookbook[ '
        'id: $id, '
        'version: $version, '
        'name: $name'
        ' ]';
  }

  Map toJson() {
    var jsonMap = {};
    RecipeUtil.addIfNotNull(jsonMap, "name", name);

    RecipeUtil.addIntIfNotNull(jsonMap, "id", id);
    RecipeUtil.addIntIfNotNull(jsonMap, "version", version);
    return jsonMap;
  }

  Cookbook.fromJson(Map jsonMap) {
    if (jsonMap['id'] != null)      this.id      = jsonMap['id'];
    if (jsonMap['version'] != null) this.version = jsonMap['version'];
    if (jsonMap['name'] != null)    this.name    = jsonMap['name'];
  }

  static List<Cookbook> fromList(List<Map> jsonList) {
    var returnList = <Cookbook>[];
    if (jsonList is List) {
      jsonList.forEach((map) => returnList.add(new Cookbook.fromJson(map)));
    }

    return returnList;
  }
}
