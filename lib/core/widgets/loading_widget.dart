import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'custom_sized_box.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitThreeBounce(
      size: 50.0,
      color: Colors.black,
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('loading'),
              const CustomSizedBox(true, 1.0),
              SpinKitFadingCircle(
                color: color ?? Colors.blue,
                size: 50.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProgressHUD extends StatelessWidget {
  final Widget child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;

  const ProgressHUD({
    required Key key,
    required this.child,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = List<Widget>.empty(growable: true);
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          const Center(child: Loading()),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}

class Loader extends StatefulWidget {
  const Loader({
    Key? key,
    this.outerColor = Colors.blue,
    this.innerColor = Colors.white,
    this.strokeWidth = 3.0,
    this.duration = 4000,
    this.controller,
    this.height,
    this.width,
  }) : super(key: key);

  final Color outerColor;
  final Color innerColor;
  final double strokeWidth;
  final int duration;
  final LoaderController? controller;
  final double? height;
  final double? width;

  @override
  // ignore: library_private_types_in_public_api
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with TickerProviderStateMixin {
  Animation<double>? outerAnimation;
  Animation<double>? innerAnimation;
  AnimationController? outerController;
  AnimationController? innerController;

// controls the minimum size of the arc
  static const int minimumArcSize = 5;

  // final int durationPortion = 40;

  Timer? timer;
  // ignore: constant_identifier_names
  static const int TIME_PORTION = 10; // 40 milliseconds for each increment

  /// ranges are from 0-100
  /// it is returning back in the build method to 0-2 (to be multiplied by pi)
  double startRectSize = 0;
  double endRectSize = 0;
  double staticSizeCounter = 0;
  static const double staticStatePercent = 0.1;

  // static double SMOOTHNESS = 0.5; // 40 milliseconds for each increment

  // controls the smoothness of the arc animation
  // double arcIncrement;

  final double staticStateInvisibleSize = staticStatePercent * 100;
  bool reverseFlag = false;

  /// the state of the minimum or maximum arc size
  bool staticState = false;

  int i = 1;

  // controls the smoothness of the arc animation
  double? arcIncrement;

  /// this switch is controlled by start() and stop() functions
  /// it is used to wait till loader finishes full circle then stop
  bool isLoaderAskedToStop = false;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller?._awesomeLoaderState = this;
    }
    arcIncrement = 2 *
        2 *
        (100 - minimumArcSize + (100 * 0.1)) *
        (1 - staticStatePercent) *
        (TIME_PORTION / widget.duration);

    /// determines the size of the rect in initially [0-100]
    endRectSize = 100;

    outerController = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);

    innerController = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);

    /// rotates three times per duration
    outerAnimation = Tween<double>(begin: 0, end: 3).animate(CurvedAnimation(
        parent: outerController!,
        curve: const Interval(0.0, 1.0, curve: Curves.linear)));

    /// rotates three rotations per duration
    innerAnimation = Tween<double>(begin: 3.0, end: 0.0).animate(
        CurvedAnimation(
            parent: innerController!,
            curve: const Interval(0.0, 1.0, curve: Curves.linear)));

    /// if there is no controller, start the loader immediatly
    if (widget.controller == null) {
      start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: widget.height ?? 50.0,
        width: widget.width ?? 50.0,
        child: Stack(
          children: <Widget>[
            RotationTransition(
              turns: outerAnimation!,
              child: CustomPaint(
                //  /50 to return a range from  to 0-2
                painter: OuterArcPainter(
                    widget.outerColor,
                    startRectSize / 50.0,
                    endRectSize / 50.0,
                    widget.strokeWidth),
                child: const SizedBox(
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            ),
            RotationTransition(
              turns: innerAnimation!,
              child: CustomPaint(
                painter: InnerArcPainter(
                    widget.innerColor,
                    startRectSize / 50.0,
                    endRectSize / 50.0,
                    widget.strokeWidth),
                child: const SizedBox(
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    outerController?.dispose();
    innerController?.dispose();
    super.dispose();
  }

  void start() {
    isLoaderAskedToStop = false;
    if (!outerController!.isAnimating) outerController?.repeat();
    if (!innerController!.isAnimating) innerController?.repeat();
    _startRotation();
  }

  void stopWhenFull() {
    /// turn the switch on, then the animation loop will stop the timer when the loader is in a full circle shape
    isLoaderAskedToStop = true;
  }

  void stopNow() {
    outerController?.stop();
    innerController?.stop();
    _stopRotation();
  }

  _startRotation() {
    if (timer != null && timer!.isActive) timer?.cancel();
    timer =
        Timer.periodic(const Duration(milliseconds: TIME_PORTION), (Timer t) {
          if (mounted) {
            setState(() {
              if (!reverseFlag) {
                if (!staticState) {
                  /// modify size only if the staticState is FALSE
                  endRectSize = endRectSize + arcIncrement!;
                } else {
                  staticSizeCounter += arcIncrement!;
                  if (staticSizeCounter > staticStateInvisibleSize) {
                    staticSizeCounter = 0;
                    staticState = false;
                  }
                }
                if (endRectSize > 100) {
                  staticState = true;
                  reverseFlag = true;
                  startRectSize = 0;
                  //// check if loader is asked to stop, stop the timer
                  if (isLoaderAskedToStop) {
                    stopNow();
                  }
                }
              } else {
                if (!staticState) {
                  /// modify size only if the staticState is FALSE
                  startRectSize = startRectSize + arcIncrement!;
                  endRectSize = endRectSize - arcIncrement!;
                } else {
                  staticSizeCounter += arcIncrement!;
                  if (staticSizeCounter > staticStateInvisibleSize) {
                    staticSizeCounter = 0;
                    staticState = false;
                  }
                }

                if (startRectSize > 100 - minimumArcSize) {
                  staticState = true;
                  reverseFlag = false;
                }
              }
            });
          }
        });
  }

  _stopRotation() {
    timer?.cancel();
  }
}

class OuterArcPainter extends CustomPainter {
  OuterArcPainter(
      this.color, this.startRectSize, this.endRectSize, this.strokeWidth);

  final Color color;
  final double endRectSize;
  final double startRectSize;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint outerPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final Rect outerRect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    canvas.drawArc(
        outerRect, startRectSize * pi, endRectSize * pi, false, outerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class InnerArcPainter extends CustomPainter {
  InnerArcPainter(
      this.color,
      this.startRectSize,
      this.endRectSize,
      this.strokeWidth,
      );

  final Color color;
  final double endRectSize;
  final double startRectSize;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint innerPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final Rect innerRect = Rect.fromLTWH(
        0.0 + (0.35 * size.width) / 2,
        0.0 + (0.35 * size.height) / 2,
        size.width - 0.35 * size.width,
        size.height - 0.35 * size.height);

    canvas.drawArc(
        innerRect, -startRectSize * pi, -endRectSize * pi, false, innerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class LoaderController {
  LoaderController();

  _LoaderState? _awesomeLoaderState;

  void stopWhenFull() {
    _awesomeLoaderState?.stopWhenFull();
  }

  void start() {
    _awesomeLoaderState?.start();
  }

  void stopNow() {
    _awesomeLoaderState?.stopNow();
  }
}