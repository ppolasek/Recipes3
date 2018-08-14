// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:recipe_web/src/route_paths.dart';

import 'package:recipe_web/src/common/components/recipe_list/recipe_list.dart';
import 'package:recipe_web/src/common/components/recipe_view/recipe_view.dart';
import 'package:recipe_web/src/common/model.dart';
import 'package:recipe_web/src/logger/logger.dart';
import 'package:recipe_web/src/recipe/common/recipe_service.dart';
import 'package:recipe_web/src/recipe/ui/recipe_tag/recipe_tag.dart';

@Component(
  selector: 'recipe-search',
  styleUrls: const ['search.css'],
  templateUrl: 'search.html',
  directives: const [
    coreDirectives,
    RecipeTagComponent,
    RecipeListComponent,
    RecipeViewComponent,
  ],
  providers: const [],
)
class RecipeSearchComponent implements OnInit {
  final Recipes3Logger _log;
  final RecipeService _recipeService;
  final Router _router;

  String searchText = '';
  List<RecipeTag> allTags;
  List<RecipeTag> recipeTags = <RecipeTag>[];
  List<Recipe> recipes = <Recipe>[];

  @ViewChild('recipeTagListRef')
  HtmlElement recipeTagListRef;

  Recipe hoveredRecipe;
  
  Timer _timer;
  SearchCriteria _criteria = new SearchCriteria();

  RecipeSearchComponent(this._log, this._recipeService, this._router);

  ngOnInit() {
    _log.loggerName = 'RecipeSearchComponent';
    _loadRecipeTags();
  }

  onRecipeHovered(event) {
    _log.fine('onRecipeHovered() event = $event');
    if (event != null && event['recipe'] != null) {
      hoveredRecipe = event['recipe'];
    }
  }
  
  void onCloseSearchClick() {
//    _recipeEvents.closeSearch();
      _router.navigate(RoutePaths.home.toUrl()); 
  }

  onKey(String value) {
    searchText = value;
    _log.fine('onKey() value = $value, searchText = $searchText');

    if (value != null && value.isNotEmpty) {
      // perform a search on the text after a half-second delay
      if (_timer != null && _timer.isActive) {
        _timer.cancel();
      }
      _timer = new Timer(new Duration(milliseconds: 500), _doSearch);
    } else {
      _timer?.cancel();
    }
  }

  void onTagInput(String value) {
    _log.fine('onTagInput() value = $value');
//    _log.fine('onTagInput() event.target.value = ${event.target.value}');
//    _log.fine('onTagInput() recipeTagListRef.nativeElement.value = ${recipeTagListRef.nodeValue}');

    if (allTags != null && allTags.isNotEmpty) {
      var tempTag = allTags.firstWhere((rtag) => rtag.tagName == value, orElse: () => null);
      _log.fine('onTagInput() tempTag = $tempTag');

      if (tempTag != null) {

        // this is a tag from the dropdown list, so keep it as the selected item
        recipeTags.add(tempTag);
        // perform a search when a tag has been selected
        _doSearch();

        // and remove the tag from the selection
        allTags.remove(tempTag);
      }
    }
  }

  /// handle events related to tags being added & removed from this recipe.
  void onTagEvent(var event) {
    _log.fine('onTagEvent() event = $event');

    // remove this tag from the list of tags
    if (RecipeTagEvent.DELETE == event[RecipeTagEvent.TYPE]) {
      var eventTag = new RecipeTag.fromJson(event[RecipeTagEvent.TAG]);
      _log.finest('onTagEvent() eventTag = $eventTag');

      // if the tag was pre-existing,
      // add the deleted tag back to the 'allTags' list
      if (!eventTag.isNew) {
        allTags.add(eventTag);
        allTags.sort((a, b) => a.tagName.compareTo(b.tagName));
      }

      if (eventTag.isNew) {
        _log.finer('onTagEvent() removing tag by name');
        recipeTags?.removeWhere((tag) => tag.tagName == eventTag.tagName);
        // perform a search when a tag has been removed
        _doSearch();
      } else {
        _log.finer('onTagEvent() removing tag by id');
        recipeTags?.removeWhere((tag) => tag.id == eventTag.id);
        // perform a search when a tag has been removed
        _doSearch();
      }
    }
  }

  void _doSearch() {
    _log.fine('_doSearch()');

    _criteria.searchText = searchText;
    _criteria.tags = recipeTags;
    _log.fine('_doSearch() _criteria = $_criteria');

    // if there's no search criteria then skip the search
    if (_criteria.isValid) {
      _recipeService.recipeSearch(_criteria)
          .then((list) => recipes = list);

      _log.fine('_doSearch() recipes.length = ${recipes.length}');
    } else {
      recipes = <Recipe>[];
    }
  }

  _loadRecipeTags() async {
    _recipeService.getAllRecipeTags()
        .then((list) {
      allTags = list;
      allTags.sort((a, b) => a.tagName.compareTo(b.tagName));
      _log.fine('_loadRecipeTags() allTags = $allTags');
    });
  }

}
