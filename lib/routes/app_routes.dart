import 'package:flutter/material.dart';
import 'package:new_islamy/features/hadeth_details/presntation/pages/hadeth_details_screen.dart';
import '../features/home/presntation/data/models/hadeth_model.dart';
import '../features/home/presntation/pages/home_screen.dart';
import '../features/on_boarding/presentation/pages/on_boarding_screen.dart';
import '../features/sura_detials/presntation/pages/sura_details_screen.dart';
abstract class AppRoutes {
  static const String home = '/';
  static const String onBoarding = '/f';
  static const String suraDetails = '/suraDetails';
  static const String hadethDetails = '/hadethDetails';
}
class Rotes {
  static MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {


      
      case AppRoutes.home:

        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case AppRoutes.suraDetails:
        return MaterialPageRoute(
          builder: (context) {
            return SuraDetailsScreen(suraIndex: settings.arguments as int);
          },
        );
      case AppRoutes.hadethDetails:
        return MaterialPageRoute(
          builder: (context) => HadethDetailsScreen(
            hadethModel: settings.arguments as HadethModel,
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => const ErrorScreen());
    }
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(color: Colors.white, child: Text("Error")),
    );
  }
}
