// strings
import 'package:flutter/material.dart';

const String kAppName = 'Play Safe';
const String kNotesDescription =
    'Are you sure you want to clear this note? Cleared notes cannot be retrieved.';
const String passwordDescription =
    'Password created would be used to access saved servers in the application';
const String savePassword = 'Save password';

// integers
const int pinLength = 6;

// durations
const Duration shortDuration = Duration(milliseconds: 200);
const Duration mediumDuration = Duration(milliseconds: 500);
const Duration longDuration = Duration(seconds: 1);
const Duration veryLongDuration = Duration(seconds: 3);

//onboarding images
const List<String> kOnboardingImages = [
  "assets/images/onboarding_image_1.png",
  "assets/images/onboarding_image_2.png"
];

const topKeys = [
  ['1', '2', '3'],
  ['4', '5', '6'],
  ['7', '8', '9'],
  [Icon(Icons.keyboard_backspace), '0', 'Show'],
];
