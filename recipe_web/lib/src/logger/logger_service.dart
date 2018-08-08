// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

import 'package:recipe_web/src/common/model.dart';

/// LoggerService interface definition
///
class LoggerService {

//  LoggerService(Recipes3Logger logger, BrowserClient http, Recipes3AppConfig config) : super(logger, http, config);

  Future<Null> log(String loggerName, DateTime logTime, String level, message, Object error, StackTrace stackTrace) => new Future(() => null);
}

/// LoggerService implementation
///
@Injectable()
class WebLoggerService extends LoggerService {
  final BrowserClient _http;

  final Recipes3AppConfig _config;

  static final _headers = {'Content-Type': 'application/json'};

  WebLoggerService(this._http, this._config);

  @override
  Future<Null> log(String loggerName, DateTime logTime, String level, message, Object error, StackTrace stackTrace) async {
    var theUrl = _config.serverUrl + _config.contextPath + _config.servletPath + '/logger';

    var temp = new LogModel.fromValues(loggerName, logTime, level, message);
//    print('WebLoggerService.log temp = $temp');
//    print('WebLoggerService.log temp.toJson() = ${temp.toJson()}');
//    print('WebLoggerService.log JSON.encode(temp) = ${JSON.encode(temp)}');

    _http.post(theUrl, headers: _headers, body: json.encode(temp));
  }
}
