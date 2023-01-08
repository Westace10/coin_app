import 'package:coin_app/app/app.logger.dart';
import 'package:coin_app/core/constants/hive_boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:logger/logger.dart';

abstract class LocalStorageService {
  LocalStorageService(this.box, String logString)
      : logger = getLogger(logString);

  final Box<dynamic> box;
  final Logger logger;

  Future<void> saveData(String key, dynamic value) async {
    logger.v('Saving data to local storage');
    await box.put(key, value);
  }

  dynamic getData(String key) {
    logger.v('Getting data from local storage');
    return box.get(key);
  }

  Future<void> deleteData(String key) async {
    logger.v('Deleting data from local storage');
    await box.delete(key);
  }

  Future<void> deleteAllData() async {
    logger.v('Deleting all data from local storage');
    await box.clear();
  }

  Future<void> close() async {
    logger.v('Closing local storage');
    await box.close();
  }
}

Future<void> openHiveBoxes() async {
  final log = getLogger('openHiveBoxes');

  log.v('Opening Hive boxes');
  await Hive.initFlutter();

  for (final box in boxInitializers.entries) {
    final boxName = box.key;
    log.v('Opening $boxName');

    final boxInitialiser = box.value;
    boxInitialiser(await Hive.openBox(boxName));
  }
}

Future<void> clearHiveBoxes() async {
  final log = getLogger('clearHiveBoxes');

  await Hive.deleteFromDisk();
  log.v('Hive boxes cleared');

  await openHiveBoxes();
}
