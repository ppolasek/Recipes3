// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:angular/angular.dart';
import 'package:http/browser_client.dart';

import 'package:recipe_web/src/logger/logger.dart';
import 'package:recipe_web/src/common/model.dart';
import 'package:recipe_web/src/common/common_services.dart';

/// CookbookService interface definition
///
class CookbookService extends WebService {

  CookbookService(Recipes3Logger logger, BrowserClient http, Recipes3AppConfig config) : super(logger, http, config) {}

  Future<List<Cookbook>> getAllCookbooks() => new Future(() => null);
  Future<Cookbook> getCookbookById(int cookbookId) => new Future(() => null);
  Future<Cookbook> saveCookbook(Cookbook cookbookId) => new Future(() => null);
  Future<Cookbook> createCookbook(Cookbook cookbookId) => new Future(() => null);
  Future<bool> deleteCookbook(int cookbookId) => new Future(() => null);
}

/// CookbookService implementation
///
@Injectable()
class WebCookbookService extends WebService implements CookbookService {
  final Recipes3Logger _log;

  WebCookbookService(this._log, BrowserClient http, Recipes3AppConfig config) : super(_log, http, config) {
    _log.loggerName = 'WebCookbookService';
  }

  @override
  Future<List<Cookbook>> getAllCookbooks() async {
    final response = await makeTheCall('getAllCookbooks', null);
    _log.fine('getAllCookbooks() response = $response');

    List<Cookbook> returnList = Cookbook.fromList(response);
    _log.fine('getAllCookbooks() returnList = $returnList');
    return returnList;
  }

  @override
  Future<Cookbook> getCookbookById(int cookbookId) => new Future(() => null);

  @override
  Future<Cookbook> saveCookbook(Cookbook cookbookId) => new Future(() => null);

  @override
  Future<Cookbook> createCookbook(Cookbook cookbookId) => new Future(() => null);

  @override
  Future<bool> deleteCookbook(int cookbookId) => new Future(() => true);
}
