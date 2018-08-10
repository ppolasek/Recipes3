// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

import 'package:recipe_web/src/logger/logger.dart';
import 'package:recipe_web/src/common/model.dart';

// -------------------- WebService methods -------------------- //
//
/// Base class for all webservices
///
class WebService {
  final Recipes3Logger _log;

  final BrowserClient _http;

  final Recipes3AppConfig _config;

  final _headers = {'Content-Type': 'application/json'};

  WebService(this._log, this._http, this._config) {
    _log.loggerName = 'WebService';
  }

  bool _isNumeric(String s) {
    if(s == null) {
      return false;
    }
    try {
      return double.parse(s) != null;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> makeTheCall(String method, Object payload) async {
//    _log.fine('makeTheCall() _config.serverUrl = ${_config.serverUrl}');
//    _log.fine('makeTheCall() _config.contextPath = ${_config.contextPath}');
//    _log.fine('makeTheCall() _config.servletPath = ${_config.servletPath}');
    var theUrl = _config.serverUrl + _config.contextPath + _config.servletPath + '/' + method;
    _log.fine('makeTheCall() theUrl = $theUrl');

    if (payload != null) {
      var newPayload = payload.toString();
//      _log.fine('makeTheCall() newPayload = ' + newPayload);
//      _log.fine('makeTheCall() isNumeric(newPayload) = ' + (_isNumeric(newPayload) ? 'true' : 'false'));
      if (_isNumeric(newPayload)) {
        payload = [ payload ];
//        _log.fine('makeTheCall() new payload = ' + payload.toString());
      }
    }

    var encodedPayload = json.encode(payload);
    _log.finest('makeTheCall() encodedPayload = $encodedPayload');

    try {
      Response response;
      if (payload != null) {
        response = await _http.post(theUrl, headers: _headers, body: encodedPayload);
      } else {
        response = await _http.post(theUrl, headers: _headers);
      }
//      _log.finest('makeTheCall() response = $response'); // only logs Instance of 'Response'
      _log.finest('makeTheCall() response.statusCode = ${response.statusCode}');
      _log.fine('makeTheCall() response.body = ${response.body}');
//      _log.finest('makeTheCall() response.contentLength = ${response.contentLength}');
      if (response.statusCode == 200) {
        final decoded = _extractData(response);

//        _log.fine('makeTheCall() decoded[result] = ${decoded['result']}');
//        _log.fine('makeTheCall() decoded[result][ok] = ${decoded['result']['ok']}');
//        _log.fine('makeTheCall() decoded[return_obj] = ${decoded['return_obj']}');
//        _log.fine('makeTheCall() decoded[return_obj][0] = ${decoded['return_obj'][0]}');

        if ('yes' == decoded['result']['ok']) {
          var returnobj = decoded['return_obj'];
          if (returnobj is List && returnobj.length > 0) {
            return returnobj[0];
          } else {
            return null;
          }
        } else {
          _handleStringError(theUrl, encodedPayload, decoded['err']['msg']);
        }
      } else {
        _handleStringError(theUrl, encodedPayload, response.body);
      }

      return null;
    } catch (e, stackTrace) {
      _handleError(theUrl, encodedPayload, e, stackTrace);
      return null;
    }
  }

  dynamic _extractData(Response resp) => json.decode(resp.body);
//  dynamic _extractData(Response resp) => JSON.decode(resp.body)['data'];

  _handleError(String theUrl, Object encodedPayload, Error e, StackTrace stackTrace) {
    _log.severe('_handleError() Error invoking $theUrl with $encodedPayload.\ne = $e\nstackTrace = $stackTrace', e, stackTrace);
  }

  _handleStringError(String theUrl, Object encodedPayload, String errMsg) {
    _log.severe('_handleStringError() Error invoking $theUrl with $encodedPayload.\nerrMsg = $errMsg');
  }
}
