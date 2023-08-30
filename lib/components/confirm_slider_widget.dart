import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../base/hex_color.dart';
import '../gen/assets.gen.dart';
import 'app_action_slider_widget.dart';

class ConfirmSliderWidget extends StatefulWidget {
  final VoidCallback confirmSuccessCallback;

  const ConfirmSliderWidget({Key? key, required this.confirmSuccessCallback})
      : super(key: key);

  @override
  State<ConfirmSliderWidget> createState() => _ConfirmSliderWidgetState();
}

class _ConfirmSliderWidgetState extends State<ConfirmSliderWidget> {
  final controller = ActionSliderController();
  var backgroundColor = HexColor('25C869');
  double opacity = 0;
  var isBuilt = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isBuilt = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 74,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: HexColor('E6E6E6'))),
        ActionSlider.standard(
            reverseSlideAnimationCurve: Curves.linear,
            reverseSlideAnimationDuration: const Duration(milliseconds: 300),
            slideAnimationCurve: Curves.easeOut,
            controller: controller,
            toggleWidth: 74,
            toggleColor: opacity <= 0.02
                ? HexColor('C4C4C4')
                : HexColor('1C8D4B').withOpacity(opacity),
            boxShadow: const [],
            rolling: true,
            icon: SvgPicture.asset(Assets.svg.icLogo,
                color: opacity <= 0.02
                    ? HexColor('E6E6E6')
                    : HexColor('1BB65C').withOpacity(opacity),
                width: 30),
            backgroundColor: HexColor('25C869').withOpacity(opacity),
            height: 74,
            stateChangeCallback: (z, x, controller) {
              opacity = x.position;
              if (mounted && isBuilt) setState(() {});
            },
            movementCurve: Curves.ease,
            action: (controller) async {})
      ],
    );
  }
}
