// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:angular/angular.dart';
import 'package:http/http.dart';

import 'package:recipe_web/src/logger/logger.dart';
import 'package:recipe_web/src/common/model.dart';
import 'package:recipe_web/src/common/common_services.dart';

/// RecipeService interface definition
///
abstract class RecipeService extends WebService {

  RecipeService(Recipes3Logger logger, Client http, Recipes3AppConfig config) : super(logger, http, config);

  Future<Recipe> getRecipe(int id);
  Future<Recipe> getRecipeWithHistory(int id);
  Future<Recipe> saveRecipe(Recipe recipe);
  Future<Recipe> createRecipe(Recipe recipe);
  Future<bool> deleteRecipe(int recipeId);
  Future<List<RecipeTag>> getAllRecipeTags();
  Future<List<Recipe>> findAddedRecently(int count);
  Future<List<Recipe>> findMostViewed(int count);
  Future<List<Recipe>> recipeSearch(SearchCriteria criteria);
}

/// RecipeService implementation
///
@Injectable()
class WebRecipeService extends RecipeService {
  final Recipes3Logger _log;

  WebRecipeService(this._log, Client http, Recipes3AppConfig config) : super(_log, http, config) {
    _log.loggerName = 'WebRecipeService';
  }

  @override
  Future<List<Recipe>> findMostViewed(int count) async {
    final response = await makeTheCall('findMostViewed', count);

    var recipes = Recipe.fromList(response);
    _log.finer('findMostViewed() recipes = $recipes');
    return recipes;
  }

  @override
  Future<List<Recipe>> findAddedRecently(int count) async {
    final response = await makeTheCall('findAddedRecently', count);

    var recipes = Recipe.fromList(response);
    _log.finer('findAddedRecently() recipes = $recipes');
    return recipes;
  }

  @override
  Future<Recipe> getRecipe(int id) async {
    final response = await makeTheCall('getRecipe', id);

    var recipe = new Recipe.fromJson(response);
    _log.finer('getRecipe() recipe = $recipe');
    return recipe;
  }

  @override
  Future<Recipe> getRecipeWithHistory(int id) async {
    final response = await makeTheCall('getRecipeWithHistory', id);

    var recipe = new Recipe.fromJson(response);
    _log.finer('getRecipeWithHistory() recipe = $recipe');
    return recipe;
  }

  @override
  Future<Recipe> saveRecipe(Recipe recipe) async {
    final response = await makeTheCall('saveRecipe', recipe);

    var savedRecipe = new Recipe.fromJson(response);
    _log.finer('saveRecipe() savedRecipe = $savedRecipe');
    return savedRecipe;
  }

  @override
  Future<Recipe> createRecipe(Recipe recipe) async {
    final response = await makeTheCall('createRecipe', recipe);

    var createdRecipe = new Recipe.fromJson(response);
    _log.finer('createRecipe() createdRecipe = $createdRecipe');
    return createdRecipe;
  }

  @override
  Future<bool> deleteRecipe(int recipeId) async {
    final response = await makeTheCall('deleteRecipe', recipeId);

    _log.finer('deleteRecipe() response = $response');
    return response;
  }

  @override
  Future<List<RecipeTag>> getAllRecipeTags() async {
    final response = await makeTheCall('getAllRecipeTags', null);

    var tags = RecipeTag.fromList(response);
    _log.finer('getAllRecipeTags() tags = $tags');
    return tags;
  }

  @override
  Future<List<Recipe>> recipeSearch(SearchCriteria criteria) async {
    final response = await makeTheCall('recipeSearch', criteria);

    var recipes = Recipe.fromList(response);
    _log.finer('recipeSearch() recipes = $recipes');
    return recipes;
  }
}
