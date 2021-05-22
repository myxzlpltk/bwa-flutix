part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Splash Page")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go To Sign In Page"),
          onPressed: () {
            BlocProvider.of<PageBloc>(context).add(GoToLoginPage());
          },
        ),
      ),
    );
  }
}
