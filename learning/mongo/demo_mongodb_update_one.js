var MongoClient = require('mongodb').MongoClient;
var url = 'mongodb://localhost:27017/mydb';

MongoClient.connect(url, function(err, db) {
  if (err) throw err;

  var myquery = { address: "Valley 345"};
  var newValues = { name: 'Mickey', address: 'Canyon 123' };

  db.collection('customers').updateOne(myquery, newValues, function(err, result) {
    if (err) throw err;
    console.log('1 document updated');
    console.log(result);
    // output:
//{ result: { ok: 1, nModified: 1, n: 1 },
//  connection:
//   { domain: null,
//     _events:
//      { error: [Object],
//        close: [Object],
//        timeout: [Object],
//        parseError: [Object] },
//     _maxListeners: undefined,
//     options:
//      { host: 'localhost',
//        port: 27017,
//        size: 5,
//        connectionTimeout: 30000,
//        socketTimeout: 360000,
//        keepAlive: true,
//        keepAliveInitialDelay: 300000,
//        noDelay: true,
//        ssl: false,
//        checkServerIdentity: true,
//        ca: null,
//        crl: null,
//        cert: null,
//        key: null,
//        passPhrase: null,
//        rejectUnauthorized: false,
//        promoteLongs: true,
//        promoteValues: true,
//        promoteBuffers: false,
//        reconnect: true,
//        reconnectInterval: 1000,
//        reconnectTries: 30,
//        domainsEnabled: false,
//        disconnectHandler: [Object],
//        cursorFactory: [Object],
//        emitError: true,
//        socketOptions: {},
//        clientInfo: [Object],
//        readPreference: [Object],
//        promiseLibrary: [Function: Promise],
//        bson: {} },
//     id: 0,
//     logger: { className: 'Connection' },
//     bson: {},
//     tag: undefined,
//     messageHandler: [Function],
//     maxBsonMessageSize: 67108864,
//     port: 27017,
//     host: 'localhost',
//     family: 4,
//     keepAlive: true,
//     keepAliveInitialDelay: 300000,
//     noDelay: true,
//     connectionTimeout: 30000,
//     socketTimeout: 360000,
//     destroyed: false,
//     domainSocket: false,
//     singleBufferSerializtion: true,
//     serializationFunction: 'toBinUnified',
//     ca: null,
//     crl: null,
//     cert: null,
//     key: null,
//     passphrase: null,
//     ssl: false,
//     rejectUnauthorized: false,
//     checkServerIdentity: true,
//     responseOptions:
//      { promoteLongs: true,
//        promoteValues: true,
//        promoteBuffers: false },
//     flushing: false,
//     queue: [],
//     connection:
//      { _connecting: false,
//        _hadError: false,
//        _handle: [Object],
//        _parent: null,
//        _host: 'localhost',
//        _readableState: [Object],
//        readable: true,
//        domain: null,
//        _events: [Object],
//        _maxListeners: undefined,
//        _writableState: [Object],
//        writable: true,
//        allowHalfOpen: false,
//        destroyed: false,
//        bytesRead: 265,
//        _bytesDispatched: 454,
//        _pendingData: null,
//        _pendingEncoding: '',
//        _idleTimeout: 360000,
//        _idleNext: [Object],
//        _idlePrev: [Object],
//        _idleStart: 27785035,
//        read: [Function],
//        _consuming: true },
//     writeStream: null,
//     hashedName: '29bafad3b32b11dc7ce934204952515ea5984b3c',
//     workItems: [],
//     buffer: null,
//     sizeOfMessage: 0,
//     bytesRead: 0,
//     stubBuffer: null },
//  message:
//   { parsed: true,
//     index: 71,
//     raw: <Buffer 47 00 00 00 a7 57 00 00 02 00 00 00 01 00 00 00 08 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 23 00 00 00 10 6f 6b 00 01 00 00 00 10 6e ... >,
//     data: <Buffer 47 00 00 00 a7 57 00 00 02 00 00 00 01 00 00 00 08 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 23 00 00 00 10 6f 6b 00 01 00 00 00 10 6e ... >,
//     bson: {},
//     opts:
//      { promoteLongs: true,
//        promoteValues: true,
//        promoteBuffers: false },
//     length: 71,
//     requestId: 22439,
//     responseTo: 2,
//     responseFlags: 8,
//     cursorId: { _bsontype: 'Long', low_: 0, high_: 0 },
//     startingFrom: 0,
//     numberReturned: 1,
//     documents: [ [Object] ],
//     cursorNotFound: false,
//     queryFailure: false,
//     shardConfigStale: false,
//     awaitCapable: true,
//     promoteLongs: true,
//     promoteValues: true,
//     promoteBuffers: false,
//     hashedName: '29bafad3b32b11dc7ce934204952515ea5984b3c' },
//  modifiedCount: 1,
//  upsertedId: null,
//  upsertedCount: 0,
//  matchedCount: 1 }

    db.close();
  });
});
