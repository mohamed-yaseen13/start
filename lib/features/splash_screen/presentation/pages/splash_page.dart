// import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_function/helper_function.dart';
import 'package:flutter/material.dart';

// import '../../../../core/helper_function/image.dart';
// import '../provider/splash_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await delay(100);
      // Provider.of<SplashProvider>(context, listen: false).startApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: .35.sw,
                  height: .35.sw,
                  decoration: const BoxDecoration(
                    // image: DecorationImage(
                    // image: AssetImage(Images.logo),fit: BoxFit.contain
                    // )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
