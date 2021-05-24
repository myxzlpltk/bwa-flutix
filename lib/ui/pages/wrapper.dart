part of 'pages.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);

    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        BlocProvider.of<PageBloc>(context).add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        BlocProvider.of<UserBloc>(context).add(LoadUser(firebaseUser.uid));

        prevPageEvent = GoToMainPage();
        BlocProvider.of<PageBloc>(context).add(prevPageEvent);
      }
    }

    return BlocBuilder<PageBloc, PageState>(builder: (_, pageState) {
      if (pageState is OnSplashPage) {
        return SplashPage();
      } else if (pageState is OnLoginPage) {
        return SignInPage();
      } else if (pageState is OnRegistrationPage) {
        return SignUpPage(pageState.registrationData);
      } else if (pageState is OnPreferencePage) {
        return PreferencePage(pageState.registrationData);
      } else if (pageState is OnAccountConfirmationPage) {
        return AccountConfirmationPage(pageState.registrationData);
      } else if (pageState is OnMovieDetailPage) {
        return MovieDetailPage(pageState.movie);
      } else {
        return MainPage();
      }
    });
  }
}
