import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoaderPage extends StatelessWidget {
  static const route = "/loader";
  const LoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset("assets/images/ss_bg.svg", fit: BoxFit.fill),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset("assets/images/ss_banner.svg"),
              CircularProgressIndicator(
                color: Colors.white,
                strokeCap: StrokeCap.round,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
