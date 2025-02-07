import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// The default width used for creating an image from a widget.
const double _kDefaultWidth = 500.0;

/// The default height used for creating an image from a widget.
const double _kDefaultHeight = 3000.0;

/// Creates an image from the given widget.
Future<Uint8List> createImageFromWidget(
  BuildContext context,
  Widget widget, {
  double docWidth = _kDefaultWidth,
  double docHeight = _kDefaultHeight,
}) async {
  final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();

  final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());

  final RenderObjectToWidgetElement<RenderBox> rootElement =
      RenderObjectToWidgetAdapter<RenderBox>(
    container: repaintBoundary,
    child: Directionality(
      textDirection: TextDirection.ltr,
      child: IntrinsicHeight(
        child: IntrinsicWidth(
          child: Container(
            color: Colors.white,
            child: widget,
          ),
        ),
      ),
    ),
  ).attachToRenderTree(buildOwner);

  buildOwner
    ..buildScope(rootElement)
    ..finalizeTree();

  // الحصول على FlutterView من السياق (قد يختلف على إصدارات مختلفة):
  ui.FlutterView view = View.of(context);

  final RenderView renderView = RenderView(
    // في Flutter 3.10+ ما زال يمكن تمرير view:
    view: view,
    child: RenderPositionedBox(
      alignment: Alignment.center,
      child: repaintBoundary,
    ),
    configuration: ViewConfiguration(
      // استبدل size بـ geometry:
      geometry: Rect.fromLTWH(0, 0, docWidth, docHeight),
      devicePixelRatio: view.devicePixelRatio,
      // قد يطلب منك أحيانًا إضافة window: view إذا كانت نسختك الأحدث جدًا
      // window: view,
    ),
  );

  final PipelineOwner pipelineOwner = PipelineOwner()..rootNode = renderView;
  renderView.prepareInitialFrame();

  pipelineOwner
    ..flushLayout()
    ..flushCompositingBits()
    ..flushPaint();

  ui.Image image = await repaintBoundary.toImage(pixelRatio: view.devicePixelRatio);
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  return byteData!.buffer.asUint8List();
}
