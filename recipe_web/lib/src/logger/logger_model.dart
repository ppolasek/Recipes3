// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of recipe_web.common_model;

class LogModel {

  DateTime logTime;
  String level;
  String loggerName;
  String message;

  LogModel();
  LogModel.fromValues(this.loggerName, this.logTime, this.level, this.message);

  @override
  String toString() {
    return 'LogModel[ '
        'logTime: $logTime, '
        'level: $level, '
        'loggerName: $loggerName, '
        'message: $message'
        ' ]';
  }

  Map toJson() {
    var jsonMap = {};
    RecipeUtil.addIfNotNull(jsonMap, "level",      level);
    RecipeUtil.addIfNotNull(jsonMap, "loggerName", loggerName);
    RecipeUtil.addIfNotNull(jsonMap, "message",    message);

    RecipeUtil.addDateTimeIfNotNull(jsonMap, "logTime", logTime);

    return jsonMap;
  }
}
