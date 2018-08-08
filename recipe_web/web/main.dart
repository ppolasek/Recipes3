// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:logging/logging.dart';
import 'package:http/browser_client.dart';

// ignore: uri_has_not_been_generated
import 'package:recipe_web/recipes3_app_component.template.dart' as recipes3;
import 'package:recipe_web/src/common/model.dart';
import 'package:recipe_web/src/routes.dart';

// ignore: uri_has_not_been_generated
import 'main.template.dart' as self;

@GenerateInjector([
  routerProvidersHash, // You can use routerProviders in production
  //ClassProvider(BrowserClient),
  // OLDER Provider(BrowserClient, useFactory: () => BrowserClient(), deps: []),
  // OLD const ClassProvider<BrowserClient>(BrowserClient),
  const FactoryProvider<BrowserClient>(BrowserClient, getBrowserClient),
  const FactoryProvider<Recipes3AppConfig>(Recipes3AppConfig, getRecipes3AppConfig),
  const ClassProvider(Routes),
])
final InjectorFactory injector = self.injector$Injector;

Recipes3AppConfig _recipes3AppConfig;
Recipes3AppConfig getRecipes3AppConfig() => _recipes3AppConfig;

BrowserClient _client;
BrowserClient getBrowserClient() => _client;

Future<Null> main() async {
  print('main.main()');

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.time} ${rec.level.name} ${rec.loggerName} ${rec.message}');
  });
  
//  const serverUrl = 'http://localhost:9191';
//  const contextPath = '/Recipes3';
//  const servletPath = '/services';
  
  _recipes3AppConfig = new Recipes3AppConfig('http://localhost:8191', '/Recipes3', '/services');
  _client = new BrowserClient();
  
  runApp(recipes3.Recipes3AppComponentNgFactory, createInjector: injector);
//  bootstrap(Recipes3AppComponent, [
//    provide(BrowserClient, useFactory: () => new BrowserClient(), deps: []),
//    provide(Recipes3AppConfig,
//        useFactory: () => new Recipes3AppConfig('http://localhost:8191',
//            '/Recipes3',
//            '/services'),
//        deps: []),
//    ROUTER_PROVIDERS,
//    // Remove next line in production
//    provide(LocationStrategy, useClass: HashLocationStrategy),
//  ]);
}
