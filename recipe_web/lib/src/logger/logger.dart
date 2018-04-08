// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular/angular.dart';
import 'package:logging/logging.dart';

import 'package:recipe_web/src/logger/logger_service.dart';
@Injectable()
class Recipes3Logger {
  Logger _logger;
  String _loggerName = '';
  LoggerService _loggerService;

  Recipes3Logger(this._loggerService) : super() {
    log(Level.FINE, 'Recipes3Logger() _loggerService = $_loggerService');
  }

  void set loggerName(String newName) {
    _logger = new Logger(newName);
    _loggerName = newName;
    log(Level.FINE, 'Recipes3Logger() set loggerName = $newName');
  }

  bool isLoggable(Level value) => _logger.isLoggable(value);
  
  void log(Level level, message, [Object error, StackTrace stackTrace]) {
//    print('send this to the database: $level, $message');
    _loggerService?.log(_loggerName, new DateTime.now(), level.toString(), message, error, stackTrace);
    _logger?.log(level, message, error, stackTrace);
  }

  void config(message, [Object error, StackTrace stackTrace]) {
    log(Level.CONFIG, message, error, stackTrace);
  }

  void fine(message, [Object error, StackTrace stackTrace]) {
    log(Level.FINE, message, error, stackTrace);
  }

  void finer(message, [Object error, StackTrace stackTrace]) {
    log(Level.FINER, message, error, stackTrace);
  }

  void finest(message, [Object error, StackTrace stackTrace]) {
    log(Level.FINEST, message, error, stackTrace);
  }

  void info(message, [Object error, StackTrace stackTrace]) {
    log(Level.INFO, message, error, stackTrace);
  }

  void warning(message, [Object error, StackTrace stackTrace]) {
    log(Level.WARNING, message, error, stackTrace);
  }

  void severe(message, [Object error, StackTrace stackTrace]) {
    log(Level.SEVERE, message, error, stackTrace);
  }

  void shout(message, [Object error, StackTrace stackTrace]) {
    log(Level.SHOUT, message, error, stackTrace);
  }

  String toString() {
    return 'Recipes3Logger($_loggerName) level: ${_logger.level} fullName: ${_logger.fullName}';
  }
}