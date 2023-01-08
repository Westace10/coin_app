import 'package:hive_flutter/hive_flutter.dart';

typedef BoxInitialiser = void Function(Box);

// Add all the box initializers here
late Box persistBox;
late Box authBox;

// Register all the box initializers here
final boxInitializers = <String, BoxInitialiser>{
  'persistBox': (box) => persistBox = box,
  'authBox': (box) => authBox = box,
};
