import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  GradientButton(
      {@required this.child,
        this.colors,
        this.borderRadius,
        this.height,
        this.width,
        this.onPressed});

  // 渐变色数组
  final List<Color> colors;

  //圆角
  final BorderRadius borderRadius;

  //高宽
  final double width;
  final double height;

  final Widget child;

  //点击回调
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    //确保colors数组不空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];
    //背景渐变效果
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: _colors),
          borderRadius: borderRadius
      ),

      child: Material(
        type: MaterialType.transparency,
        //点击有涟漪效果
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

