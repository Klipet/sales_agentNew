
import 'package:sales_agent/data/providers/api_provider/splash_api.dart';

abstract class SplashState{}

class SplashInitial extends SplashState{

}
class SplashLoad extends SplashState{}
class SplashLoaded extends SplashState{}
class SplashSuccess extends SplashState{}

class SplashError extends SplashState{
  final String errorMessage;
  SplashError(this.errorMessage);
}