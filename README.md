# Coin App - A Wallet app

## Description
Coin App is a mobile application developed to connect friends and family status feeds and information. It also has a wallet functionality which allows saving cash, sharing cash and also access to a crypto wallet from Coinbase. 

## Repo structure
This repository makes use of [stacked](https://pub.dev/packages/stacked) and it's architecture, which is an MVVM pattern.

# Running the Flutter app

1. Install and setup Flutter https://flutter.dev/docs/get-started/install
2. Clone the repo and run `git checkout dev`
3. Run `flutter pub get` from the root of the project to fetch all dependencies
4. Run `flutter run` to start the app

NB: This was build with flutter version 3.3.8

## File structure

The app is generally split up into three layers:

1. View layer - Flutter widgets
2. ViewModels
3. Services

View: Shows the UI to the user. Single widgets also qualify as views (for consistency in terminology) a view, in this case, is not a "Page" it's just a UI representation.

ViewModel: Manages the state of the View, business logic, and any other logic as required from user interaction. It does this by making use of the services

Services: A wrapper of a single functionality/feature set. This is commonly used to wrap things like showing a dialog, wrapping database functionality, integrating an API, etc.

Before continuing I'd recommend reading the official docs on state management as the concepts and packages used are very similar to the ones used in this app. https://flutter.dev/docs/development/data-and-backend/state-mgmt/intro

### View layer

The View layer is built using Flutter widgets. Ensure that all widgets are stateless and that all state is managed by the view models. As described by stacked architecture, the UI layer should only be concerned with displaying data and handling user input. The UI layer should not be concerned with how the data is fetched or how the user input is handled.

Views are located in the `lib/ui/views` folder. Each view is split up into two files, a view and a view model. The view model is responsible for managing the state of the view and the view is responsible for displaying the state.

To get a grasp of the lifecycle of a widget I'd recommend reading https://programmingpot.com/flutter/flutter-stateful-widget-lifecycle/ and the official documentation https://flutter.dev/docs/development/ui/widgets-intro

### ViewModels

ViewModels are responsible for managing the state of a view. They are located in the `lib/ui/views/..viewmodel.dart` folder. Each view model is responsible for managing the state of a single view.

ViewModels are built using the stacked architecture. Stacked is a state management architecture that is built on top of the provider package. It is a very simple architecture that is easy to understand and use. It is also very flexible and can be used with any other state management architecture.

#### Services

Services are a wrapper of a single functionality/feature set, third-party packages. This is commonly used to wrap things like showing a dialog, wrapping database functionality, integrating an API, etc. Services are located in the `lib/core/services` folder. Services are injected into the view models using the locator pattern.


## Code Generation

The app uses code generation to generate boilerplate code. This is done using the build_runner package. To generate the code run `flutter pub run build_runner build` from the root of the project. This will generate the code and place it in the `lib/core/app.dart` file. This file is not to be edited manually.

`json_serializable` takes an annotated data class and creates a `fromJson` and `toJson` function used to automatically convert between a dart class and it's corresponding json equivalent.

`freezed` is used to create immutable data classes. It also creates a `copyWith` function that can be used to create a copy of the class with some of the properties changed. 

## Debugging

### Logging

The app uses the `logger` package to log messages. The logger is configured already with stacked architecture and can be used by injecting the logger into the view model. The logger is located in the `lib/core/app_logger.dart` file.

The use of the logger is optional. It is recommended to use the logger for debugging purposes only. The logger should not be used to display messages to the user. For that, use the `snackbar_service` package.

## Style Guide
 ### Button Guidelines
  According to our design style guide, We have two types of customized button:
  - Elevated Button - This is the defualt button that we generally use, by calling `AppButton()`. 
  - Outlined Button - This is another type of button that is used when you need just the outlined border, it is called by `AppButton.outlined`.
  - Circular Button - This is another type of button that is used when you need just a circular border with label, it is called by `AppButton.circularWithLabel`.

  Each of these button can be easily customize by already added properties.

### Color 
According to the color style, when you want to use the Primary color, it is called by `AppColor.kPrimaryColor`.
When you want to add a shade to it, it is called by `AppColor.kPrimaryColor.shade100`.

You can go throught the `colors.dart` file to see the kind of color you need.

### Text Style
According to the text style, it is called by `kHeading1TextStyle` it can be used according to the style you want to implement.

You can go throught the `text_styles.dart` file to see the kind of text styles you need.

### Spacing Style 
According to the text style, it is called by `horizontalSpaceLarge` for horizontal spacing and `verticalSpaceLarge` for vertical spacing.

You can go throught the `spacing.dart` file to see the kind of spacing you need.

### Edge insets Style (Padding)
According to the text style, it is called by `kEdgeInsetsHorizontalNormal` for horizontal padding and `kEdgeInsetsVerticalNormal` for vertical spacing.

You can go throught the `edge_insets.dart` file to see the kind of padding you need.

## Links

For seamless operation and flow on appetize, kindly change the android version to Android 12.0

=> Appetize URL: https://appetize.io/app/jve6fs5igbty7fe5o3n6l66bju?device=pixel4&osVersion=11.0&scale=75

=> APK file: https://drive.google.com/drive/folders/1AJKAnYZn6HCVz0kHlbbWX020_TifV5Zu?usp=share_link

