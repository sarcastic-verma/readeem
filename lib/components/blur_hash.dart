import 'dart:io';
import 'dart:typed_data';

import 'package:blurhash/blurhash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readeem/utilities/constants.dart';
import 'package:shimmer/shimmer.dart';

class BlurHashImage extends StatefulWidget {
  static Future<String> blurHashEncode(File image) async {
    final pixels = await image.readAsBytes();
    return await BlurHash.encode(pixels, 4, 3);
  }

  BlurHashImage(
      {Key key,
      @required this.blurHash,
      @required this.image,
      this.width,
      this.height,
      this.fit = BoxFit.cover})
      : super(key: key);

  final String blurHash;
  final String image;
  final double width;
  final double height;
  final BoxFit fit;

  _BlurHashImageState createState() => _BlurHashImageState();
}

class _BlurHashImageState extends State<BlurHashImage> {
  Uint8List _imageDataBytes;

  @override
  void initState() {
    super.initState();
    blurHashDecode();
  }

  Future blurHashDecode() async {
    Uint8List imageDataBytes;

    try {
      imageDataBytes = await BlurHash.decode(widget.blurHash, 32, 32);
    } on PlatformException catch (e) {
      print(e.message);
    }

    setState(() {
      _imageDataBytes = imageDataBytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _imageDataBytes == null
        ? Shimmer.fromColors(
            child: Container(width: widget.width, height: widget.height),
            baseColor: Colors.white,
            highlightColor: Colors.grey[300])
        : Stack(
            children: <Widget>[
              FractionallySizedBox(
                widthFactor: 1,
                child: Image.memory(
                  _imageDataBytes,
                  width: widget.width,
                  height: widget.height,
                  fit: widget.fit,
                ),
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: widget.image,
                  width: widget.width,
                  height: widget.height,
                  fit: widget.fit,
                ),
              )
            ],
          );
  }
}
