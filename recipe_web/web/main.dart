// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/browser_client.dart';
import 'package:logging/logging.dart';

import 'package:recipe_web/recipes3_app_component.dart';
import 'package:recipe_web/src/common/model.dart';

void main() {
  print('main.main()');

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.time} ${rec.level.name} ${rec.loggerName} ${rec.message}');
  });

//  const serverUrl = 'http://localhost:9191';
//  const contextPath = '/Recipes3';
//  const servletPath = '/services';

  runApp(ng.AppComponentNgFactory, [
//  bootstrap(Recipes3AppComponent, [
    provide(BrowserClient, useFactory: () => new BrowserClient(), deps: []),
    provide(Recipes3AppConfig,
        useFactory: () => new Recipes3AppConfig('http://localhost:8191',
            '/Recipes3',
            '/services'),
        deps: []),
    ROUTER_PROVIDERS,
    // Remove next line in production
    provide(LocationStrategy, useClass: HashLocationStrategy),
  ]);
}
