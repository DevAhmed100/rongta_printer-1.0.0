import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// The default width used for creating an image from a widget.
const double _kDefaultWidth = 500.0;

/// The default height used for creating an image from a widget.
const double _kDefaultHeight = 3000.0;

/// Creates an image from the given widget.
///
/// The [context] parameter represents the build context.
/// The [widget] parameter is the widget to create an image from.
/// The [docWidth] parameter (optional) specifies the width of the document. Default is [_kDefaultWidth].
/// The [docHeight] parameter (optional) specifies the height of the document. Default is [_kDefaultHeight].
///
/// Returns a [Future] that completes with a [Uint8List] containing the image data.
Future<Uint8List> createImageFromWidget(
  BuildContext context,
  Widget widget, {
  double docWidth = _kDefaultWidth,
  double docHeight = _kDefaultHeight,
}) async {
  final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();

  final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());

  final RenderObjectToWidgetElement<RenderBox> rootElement = RenderObjectToWidgetAdapter<RenderBox>(
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

  ui.FlutterView view = View.of(context);

  final RenderView renderView = RenderView(
    view: view,
    child: RenderPositionedBox(
      alignment: Alignment.center,
      child: repaintBoundary,
    ),
    configuration: ViewConfiguration(
      size: Size(docWidth, docHeight),
      devicePixelRatio: view.devicePixelRatio,
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

  Uint8List? result = byteData?.buffer.asUint8List();

  return result!;
}
