import 'package:components/widgets/buttons/app_button.dart';
import 'package:components/widgets/buttons/app_check_box.dart';
import 'package:components/widgets/buttons/app_cupertino_switch.dart';
import 'package:components/widgets/buttons/app_radio.dart';
import 'package:components/widgets/dialogs/custom_cupertino_alert_dialog.dart';
import 'package:components/widgets/other_widgets/app_image_preloader.dart';
import 'package:components/widgets/text_fields/app_masked_text_field.dart';
import 'package:components/widgets/text_fields/phone_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello welcome to Jayson\'s Flutter Template',
            ),
            const ImagePreloadShimmer(),
            SizedBox(
              height: 20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => AppCheckBox(isChecked: index.isEven),
              ),
            ),
            SizedBox(
              height: 44,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => AppButton(
                  padding: const EdgeInsets.all(8),
                  onTap: () {
                    showCupertinoModalPopup(
                      semanticsDismissible: true,
                      context: context,
                      anchorPoint: Offset(100, 1000.0),
                      builder: (context) => CustomCupertinoAlertDialog(
                        title: 'Hello Title',
                        leftActionText: 'Cancel text',
                        rightActionText: 'Accept text',
                        rightAction: () {},
                        description: 'This is a description',
                        hasRedText: index.isEven,
                      ),
                    );
                  },
                  color: Color.fromRGBO(index * 20, index * 10, index * 5, 1),
                ),
              ),
            ),
            SizedBox(
              height: 27,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => AppCupertinoSwitch(
                        onChange: (value) {},
                        isSwitched: index.isEven,
                      )),
            ),
            SizedBox(
              height: 20,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => AppRadio(
                        activeColor: Colors.blue,
                        inactiveColor: Colors.grey,
                        onChanged: (value) {},
                        value: index.isOdd,
                        groupValue: false,
                      )),
            ),
            AppMaskedTextField(controller: TextEditingController()),
            PhoneTextField(controller: TextEditingController()),
          ],
        ),
      ),
    );
  }
}
