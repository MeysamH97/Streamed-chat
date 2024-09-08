import 'dart:math';
import 'package:flutter/cupertino.dart';

class CustomSize {
  CustomSize(this.context,){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    size = sqrt(pow(width, 2) + pow(height, 2));
  }

  final BuildContext context;
  late double width;
  late double height;
  late double size;

  double _sizeForFactor(double factor) {
    return size / factor;
  }
  //  بخش مربوط به فاصله افقی
  double horizontalSpaceLevel1() => width/5;
  double horizontalSpaceLevel2() => width/8;
  double horizontalSpaceLevel3() => width/13;
  double horizontalSpaceLevel4() => width/21;
  double horizontalSpaceLevel5() => width/34;
  double horizontalSpaceLevel6() => width/55;
  double horizontalSpaceLevel7() => width/89;
  double horizontalSpaceLevel8() => width/144;

  //  بخش مربوط به فاصله عمودی
  double verticalSpaceLevel1() => height/5;
  double verticalSpaceLevel2() => height/8;
  double verticalSpaceLevel3() => height/13;
  double verticalSpaceLevel4() => height/21;
  double verticalSpaceLevel5() => height/34;
  double verticalSpaceLevel6() => height/55;
  double verticalSpaceLevel7() => height/89;
  double verticalSpaceLevel8() => height/144;

  // بخش مربوط به اندازه‌های متن
  double textLevel1() => _sizeForFactor(5);
  double textLevel2() => _sizeForFactor(8);
  double textLevel3() => _sizeForFactor(13);
  double textLevel4() => _sizeForFactor(21);
  double textLevel5() => _sizeForFactor(34);
  double textLevel6() => _sizeForFactor(55);
  double textLevel7() => _sizeForFactor(72);
  double textLevel8() => _sizeForFactor(89);

  // بخش مربوط به اندازه‌های شکل
  double shapeLevel1() => _sizeForFactor(3);
  double shapeLevel2() => _sizeForFactor(5);
  double shapeLevel3() => _sizeForFactor(8);
  double shapeLevel4() => _sizeForFactor(13);
  double shapeLevel5() => _sizeForFactor(21);
  double shapeLevel6() => _sizeForFactor(34);
  double shapeLevel7() => _sizeForFactor(55);
}