part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In Page")),
      body: Center(
        child: ElevatedButton(
          child: Text("Sign In"),
          onPressed: () {
            AuthServices.signIn("juan@gmail.com", "123456");
          },
        ),
      ),
    );
  }
}
