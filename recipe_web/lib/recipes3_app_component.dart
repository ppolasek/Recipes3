// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:recipe_web/src/common/components/dialog/dialog.dart';
import 'package:recipe_web/src/common/components/recipe_view/recipe_view.dart';
import 'package:recipe_web/src/common/components/selector_directive.dart';
import 'package:recipe_web/src/common/model.dart';
import 'package:recipe_web/src/common/recipes3_app_events.dart';
import 'package:recipe_web/src/logger/logger.dart';
import 'package:recipe_web/src/logger/logger_service.dart';
import 'package:recipe_web/src/cookbook/cookbook_service.dart';
import 'package:recipe_web/src/common/components/added_recently/added_recently.dart';
import 'package:recipe_web/src/common/components/default_view/default_view.dart';
import 'package:recipe_web/src/common/components/most_viewed/most_viewed.dart';
import 'package:recipe_web/src/recipe/ui/recipe_form/recipe_form.dart';
import 'package:recipe_web/src/recipe/common/recipe_service.dart';
import 'package:recipe_web/src/recipe/ui/recipe_tag/recipe_tag.dart';
import 'package:recipe_web/src/common/components/search/search.dart';

@Component(
  selector: 'recipes-app',
  styleUrls: const ['recipes3_app_component.css'],
  templateUrl: 'recipes3_app_component.html',
  directives: const [
    CORE_DIRECTIVES,
    ROUTER_DIRECTIVES,
    RecipeFormComponent,
    RecipeTagComponent,
    RecipeViewComponent,
    AddedRecentlyComponent,
    MostViewedComponent,
    RecipeSearchComponent,
    DefaultViewComponent,
    DialogComponent,
  ],
  providers: const [
    const Provider(CookbookService, useClass: WebCookbookService),
    const Provider(RecipeService, useClass: WebRecipeService),
    const Provider(LoggerService, useClass: WebLoggerService),
    const Provider(Recipes3Logger, useClass: Recipes3Logger),
    const Provider(RecipesAppEvents, useClass: RecipesAppEvents),
    const Provider(SelectorDirective, useClass: SelectorDirective),
  ],
)
@RouteConfig(const [
  const Redirect(path: '/', redirectTo: const ['Home']),
  const Route(path: '/home', name: 'Home', component: DefaultViewComponent),
  const Route(path: '/search', name: 'Search', component: RecipeSearchComponent),
  const Route(path: '/detail/:id', name: 'Detail', component: RecipeViewComponent),
  const Route(path: '/hover/:id', name: 'Hover', component: RecipeViewComponent),
])
class Recipes3AppComponent implements OnInit {
  RecipeTag sampleTag = new RecipeTag.fromValues('Mexican');

  @ViewChild('addRecipeDialog')
  DialogComponent addRecipeDialogComp;

  Recipe recipe;

  final Recipes3Logger _log;

  Recipes3AppComponent(this._log) {
    _log.loggerName = 'Recipes3AppComponent';
  }

  ngOnInit() {
    _log.fine('ngOnInit()');
  }

  void onAddClick() {
    recipe = new Recipe();
    addRecipeDialogComp.visible = true;
  }
}
