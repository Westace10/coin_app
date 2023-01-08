import 'package:coin_app/core/services/api_services.dart';
import 'package:coin_app/core/services/local_storage/persistent_storage_service.dart';
import 'package:coin_app/ui/views/authentication/auth_view.dart';
import 'package:coin_app/ui/views/dashboard/dashboard_view.dart';
import 'package:coin_app/ui/views/dashboard/homeview/createposts/createposts_view.dart';
import 'package:coin_app/ui/views/dashboard/homeview/viewposts/viewposts_view.dart';
import 'package:coin_app/ui/views/onboarding/onboarding_view.dart';
import 'package:coin_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: AuthView),
    MaterialRoute(page: OnBoardingView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: CreatepostView),
    MaterialRoute(page: ViewpostView)
  ],
  dependencies: [
    // core services
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: APIService),

    // local storage services
    LazySingleton(classType: PersistentStorageService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
