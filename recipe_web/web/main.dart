// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:logging/logging.dart';

// ignore: uri_has_not_been_generated
import 'package:recipe_web/recipes3_app_component.template.dart' as recipes3;

// ignore: uri_has_not_been_generated
import 'main.template.dart' as self;

@GenerateInjector(
  routerProvidersHash, // You can use routerProviders in production
)
final InjectorFactory injector = self.injector$Injector;

void main() {
  print('main.main()');

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.time} ${rec.level.name} ${rec.loggerName} ${rec.message}');
  });

//  const serverUrl = 'http://localhost:9191';
//  const contextPath = '/Recipes3';
//  const servletPath = '/services';
  
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
