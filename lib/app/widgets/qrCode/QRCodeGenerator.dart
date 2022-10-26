import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:narwhale_mobile/app/routes/app_pages.dart';

import '../../../utils.dart';

class QRCodeGenerator extends StatefulWidget {
  final String data;
  final int maxChunkSize;
  final bool canBeExpanded;

  QRCodeGenerator({
    required this.data,
    this.maxChunkSize = 4,
    this.canBeExpanded = true
  });

  @override
  State<StatefulWidget> createState() {
    return QRCodeGeneratorState();
  }

}

class QRCodeGeneratorState extends State<QRCodeGenerator> {
  List<String> chunks = [];
  Timer? _timer;

  int currentChunkIdx = 0;
  int chunkDelayTimer = 300;

  @override
  void initState() {
    splitByChunks();
    if (chunks.length > 1) {
      _timer = Timer.periodic(Duration(milliseconds: chunkDelayTimer), (timer) {
        currentChunkIdx++;
        if (currentChunkIdx >= chunks.length) {
          currentChunkIdx = 0;
        }

        setState(() {
        });
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  void splitByChunks() {
    if (widget.maxChunkSize < 1) {
      chunks = [widget.data];
      return;
    }
    chunks = Utils.splitStringByChunk(widget.data, widget.maxChunkSize);
  }

  @override
  Widget build(BuildContext context) {
    String chunkData = chunks[currentChunkIdx];
    return InkWell(
      onTap: openQRCodePage,
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              padding: EdgeInsets.all(20),
              child: QrImage(
                data: chunkData,
                foregroundColor: Colors.black,
                version: QrVersions.auto
              )
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                child: widget.canBeExpanded?(
                  Text('Click to expand', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                ):null
              )
            )
          ]
        )
      ),
    );
  }

  void openQRCodePage() {
    Get.toNamed(Routes.EXPANDED_QR_CODE, arguments: {
      'data': widget.data
    });
  }
}