// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
library recipe_web.common_model;

// import 'package:angular/angular.dart';
// import 'package:recipe_web/src/logger/logger.dart';
import 'package:recipe_web/src/common/recipe_util.dart';

part '../cookbook/cookbook_model.dart';
part '../logger/logger_model.dart';
part 'package:recipe_web/src/recipe/common/recipe_model.dart';

class Recipes3AppConfig {
  String serverUrl;
  String contextPath;
  String servletPath;

  Recipes3AppConfig(this.serverUrl, this.contextPath, this.servletPath);
}

enum RecipeAction {
  cancel,
  discard,
  disagree,
  agree,
  yes,
  no,
  reload,
}

enum HistoryRetention {
  none,
  sixMonths,
  oneYear,
  neverDelete
}

class DomainCommon {
  int id = -1;
  int version = 0;

  bool get isNew => id == null || id < 0;
}

class RecipeConfiguration {
//  static Recipes3Logger _log = new Recipes3Logger('RecipeConfiguration');

  bool showDivider = true;
  bool showDenseLayout = true;
//  MaterialListType materialListType = MaterialListType.threeLine;
  HistoryRetention retention = HistoryRetention.neverDelete;

  RecipeConfiguration();

  @override
  String toString() {
    return 'RecipeConfiguration['
        'showDivider: $showDivider, '
        'showDenseLayout: $showDenseLayout, '
//        'materialListType: $materialListType, '
        'retention: $retention'
        ']';
  }

  Map toJson() {
    var jsonMap = {};
    RecipeUtil.addBoolIfNotNull(jsonMap, "showDivider",      showDivider);
    RecipeUtil.addBoolIfNotNull(jsonMap, "showDenseLayout",  showDenseLayout);
//    RecipeUtil.addEnumIfNotNull(jsonMap, "materialListType", materialListType);
    RecipeUtil.addEnumIfNotNull(jsonMap, "retention",        retention);
    return jsonMap;
  }

  RecipeConfiguration.fromJson(Map jsonMap) {
    if (jsonMap['showDivider']      != null) this.showDivider      = jsonMap['showDivider'].toLowerCase() == 'true';
    if (jsonMap['showDenseLayout']  != null) this.showDenseLayout  = jsonMap['showDenseLayout'].toLowerCase() == 'true';
//    if (jsonMap['materialListType'] != null) this.materialListType = materialListTypeFromString(jsonMap['materialListType']);
    if (jsonMap['retention']        != null) this.retention        = historyRetentionFromString(jsonMap['retention']);
  }
// this was an enum in the flutter language
//  static MaterialListType materialListTypeFromString(String jsonValue) {
////    _log.fine('materialListTypeFromString($jsonValue)');
////    _log.fine('materialListTypeFromString() MaterialListType.values = ${MaterialListType.values}');
//    return MaterialListType.values.firstWhere((mlt) =>
//        mlt.toString() == jsonValue
//    , orElse: () {
//      _log.fine('materialListTypeFromString() no MaterialListType match found for '
//          'value \'$jsonValue\', returning ${MaterialListType.threeLine}.');
//      return MaterialListType.threeLine;
//    });
//  }

  static HistoryRetention historyRetentionFromString(String jsonValue) {
//    _log.fine('historyRetentionFromString($jsonValue)');
//    _log.fine('historyRetentionFromString() MaterialListType.values = ${MaterialListType.values}');
    return HistoryRetention.values.firstWhere((hr) =>
        hr.toString() == jsonValue
    , orElse: () {
//      _log.fine('historyRetentionFromString() no HistoryRetention match found for '
//          'value \'$jsonValue\', returning ${HistoryRetention.neverDelete}.');
      return HistoryRetention.neverDelete;
    });
  }
}
