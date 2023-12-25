import 'package:flutter/material.dart';
import 'package:tobeto/constants/text_const.dart';
import 'package:tobeto/widget/drawer_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(isDarkMode ? darkLogoImage : lightLogoImage,
              fit: BoxFit.contain, height: 32),
        ]),
      ),
      endDrawer: const DrawerWidget(isDarkMode: false),
      body: Card(
        semanticContainer: true,
        surfaceTintColor: isDarkMode ? Colors.black : Colors.white,
        margin: const EdgeInsets.all(5),
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: size.width * 0.85,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                        color: isDarkMode ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(passwordReset,
                                style: TextStyle(
                                    color: Colors.indigo[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40)),
                          ),
                          SizedBox(height: size.height * 0.05),
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Bu alan boş bırakılamaz";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: resetPassword,
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Gönder Butonu
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // sumbit() gönder işlevi gelcek;
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          240, 153, 51, 255),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(60)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 15)),
                                  child: const Text(
                                    sendButton,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
