// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

@Tags(const ['aot'])

@TestOn('browser')

import 'package:angular/angular.dart';
import 'package:angular_test/angular_test.dart';
import 'package:pageloader/objects.dart';
import 'package:recipe_web/src/logger/logger.dart';
import 'package:test/test.dart';

import 'package:recipe_web/src/common/components/recipe_view/recipe_view.dart';
import 'recipe_view_component_PO.dart';

NgTestFixture<RecipeViewComponent> fixture;
RecipeViewComponentPO appPO;

//final mockRecipes3Logger = new MockRecipes3Logger();

// class MockRouter extends Mock implements Router {}
//class MockRecipes3Logger extends Mock implements Recipes3Logger {}

@AngularEntrypoint()
void main() {
  print("in main()");
  final testBed = new NgTestBed<RecipeViewComponent>();

  setUp(() async {
    fixture = await testBed.create();
    appPO = await fixture.resolvePageObject(RecipeViewComponentPO);
  });

  tearDown(disposeAnyRunningTest);

  test('title', () async {
    expect(await appPO.title, 'My First AngularDart App');
  });

  // Testing info: https://webdev.dartlang.org/angular/guide/testing
}
