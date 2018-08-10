// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of recipe_web.common_model;

enum RecipeTagEvent {
  TYPE,
  ADD,
  DELETE,
  TAG
}

class Recipe extends DomainCommon {
  String recipeName = '';
  String notes = '';
  Cookbook cookbook;
  String pageNrs = '';
  String recipeUrl = '';
  String assetName = '';
  bool isFavorite = false;
  List<RecipeTag> recipeTags = <RecipeTag>[];
  List<RecipeTag> get recipeTagsSorted {
    if (recipeTags != null && recipeTags.length > 1) {
      recipeTags.sort((r1, r2) => r1.tagName.toLowerCase().compareTo(r2.tagName.toLowerCase()));
    }
    return recipeTags;
  }

  bool get isValid => recipeName != null && recipeName.isNotEmpty &&
      (cookbook != null || recipeUrl != null);
  bool get isNew => id == null || id < 0;

  Recipe();

  @override
  String toString() {
    return 'Recipe[ '
        'id: $id, '
        'version: $version, '
        'recipeName: $recipeName, '
        'cookbook: $cookbook, '
        'pageNrs: $pageNrs, '
        'recipeUrl: $recipeUrl, '
        'assetName: $assetName, '
        'isFavorite: $isFavorite, '
        'isValid: $isValid, '
        'notes: $notes, '
        'recipeTags: $recipeTags'
        ' ]';
  }

  Map toJson() {
    var jsonMap = {};
    RecipeUtil.addIfNotNull(jsonMap, "recipeName", recipeName);
    RecipeUtil.addIfNotNull(jsonMap, "notes",      notes);
    RecipeUtil.addIfNotNull(jsonMap, "cookbook",   cookbook != null ? cookbook.toJson() : null);
    RecipeUtil.addIfNotNull(jsonMap, "pageNrs",    pageNrs);
    RecipeUtil.addIfNotNull(jsonMap, "recipeUrl",  recipeUrl);
    RecipeUtil.addIfNotNull(jsonMap, "assetName",  assetName);
    RecipeUtil.addIfNotNull(jsonMap, "recipeTags", recipeTags != null ? RecipeTag.toJsonList(recipeTags) : null);

    RecipeUtil.addIntIfNotNull(jsonMap,  "id", id);
    RecipeUtil.addIntIfNotNull(jsonMap,  "version", version);
    RecipeUtil.addBoolIfNotNull(jsonMap, "isFavorite", isFavorite);

    return jsonMap;
  }

//  Recipe.fromJson(Map<dynamic, dynamic> jsonMap) {
  Recipe.fromJson(dynamic jsonMap) {
    if (jsonMap['id'] != null)      this.id      = jsonMap['id'];
    if (jsonMap['version'] != null) this.version = jsonMap['version'];
    if (jsonMap['recipeName'] != null) this.recipeName = jsonMap['recipeName'];
    if (jsonMap['notes'] != null)      this.notes      = jsonMap['notes'];
    if (jsonMap['cookbook'] != null)   this.cookbook   = new Cookbook.fromJson(jsonMap['cookbook']);
    if (jsonMap['pageNrs'] != null)    this.pageNrs    = jsonMap['pageNrs'];
    if (jsonMap['recipeUrl'] != null)  this.recipeUrl  = jsonMap['recipeUrl'];
    if (jsonMap['assetName'] != null)  this.assetName  = jsonMap['assetName'];
    if (jsonMap['isFavorite'] != null) this.isFavorite = jsonMap['isFavorite'].toLowerCase() == 'true';
    if (jsonMap['recipeTags'] != null) this.recipeTags = RecipeTag.fromList(jsonMap['recipeTags']);
  }

//  static List<Recipe> fromList(List<Map<dynamic, dynamic>> jsonList) {
  static List<Recipe> fromList(dynamic jsonList) {
    var returnList = <Recipe>[];
    if (jsonList is List) {
      jsonList.forEach((map) => returnList.add(new Recipe.fromJson(map)));
    }

    return returnList;
  }
}

class RecipeTag extends DomainCommon {
  String tagName;

  RecipeTag();
  RecipeTag.fromValues(this.tagName);

  @override
  String toString() {
    return 'RecipeTag[ '
        'id: $id, '
        'version: $version, '
        'tagName: $tagName'
        ' ]';
  }

  Map toJson() {
    var jsonMap = {};
    RecipeUtil.addIfNotNull(jsonMap, "tagName", tagName);

    RecipeUtil.addIntIfNotNull(jsonMap,  "id", id);
    RecipeUtil.addIntIfNotNull(jsonMap,  "version", version);

    return jsonMap;
  }

//  RecipeTag.fromJson(Map jsonMap) {
  RecipeTag.fromJson(dynamic jsonMap) {
    if (jsonMap['id'] != null)      this.id      = jsonMap['id'];
    if (jsonMap['version'] != null) this.version = jsonMap['version'];
    if (jsonMap['tagName'] != null) this.tagName = jsonMap['tagName'];
  }

//  static List<RecipeTag> fromList(List<Map<dynamic, dynamic>> jsonList) {
  static List<RecipeTag> fromList(dynamic jsonList) {
    var returnList = <RecipeTag>[];
    if (jsonList is List) {
      jsonList.forEach((map) => returnList.add(new RecipeTag.fromJson(map)));
    }

    return returnList;
  }

  static List toJsonList(List<RecipeTag> tags) {
    var list = <Map>[];

    if (tags != null && tags.isNotEmpty) {
      tags.forEach((recipeTag) => list.add(recipeTag.toJson()));
    }

    return list;
  }
}

class SearchCriteria {
  String searchText = '';
  List<RecipeTag> tags = <RecipeTag>[];
  List<int> cookbookIds;

  SearchCriteria({searchText: '', tags: const <RecipeTag>[], cookbookId: -1});

  bool get isValid => ((searchText != null && searchText.isNotEmpty) ||
      (tags != null && tags.isNotEmpty) ||
      (cookbookIds != null && cookbookIds.isNotEmpty));

  Map toJson() {
    var jsonMap = {};
    RecipeUtil.addIfNotNull(jsonMap, "searchText",  searchText);
    RecipeUtil.addIfNotNull(jsonMap, "tags",        tags != null ? RecipeTag.toJsonList(tags) : null);
    RecipeUtil.addIfNotNull(jsonMap, "cookbookIds", cookbookIds);

    return jsonMap;
  }

  @override
  String toString() {
    return 'SearchCriteria[ '
        'searchText: $searchText, '
        'tags: $tags, '
        'cookbookIds: $cookbookIds, '
        'isValid: $isValid'
        ']';
  }
}
