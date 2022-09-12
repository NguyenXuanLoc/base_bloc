import 'package:flutter/cupertino.dart';

mixin AdaptiveScreen {
  Widget phoneLayout(BuildContext context, [List<dynamic> params]);

  Widget tabletLayout(BuildContext context, [List<dynamic> params]);
}
