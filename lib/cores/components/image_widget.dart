import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartmetermobile/cores/components/loading_indicator.dart';

import '../constants/color.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.imageTypes,
    this.imageUrl,
    this.useIconColor = false,
    this.fit = BoxFit.fill,
    this.height,
    this.width,
    this.color,
  });

  final String? imageUrl;
  final ImageTypes imageTypes;
  final bool useIconColor;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Color backGroundColor = kcGrey200;

    if (context.isDarkMode) {
      backGroundColor = kcPrimaryColor;
    } else {
      backGroundColor = kcGrey200;
    }

    if (imageUrl == null || imageUrl!.isEmpty) {
      return Container(
        height: height,
        width: width,
        color: backGroundColor,
        child: Center(
          child: Icon(
            imageTypes == ImageTypes.profile
                ? Icons.person
                : Icons.broken_image_rounded,
          ),
        ),
      );
    }

    // log(imageUrl);

    switch (imageTypes) {
      case ImageTypes.network:
        return Container(
          height: height,
          width: width,
          color: color ?? Colors.black,
          child: CachedNetworkImage(
            imageUrl: imageUrl!,
            fit: fit,
            errorWidget: (_, __, ___) => Container(
              color: backGroundColor,
              child: const Center(
                child: Icon(Icons.error),
              ),
            ),
            placeholder: (_, __) => const Center(
              child: LoadingIndicatorWidget(),
            ),
          ),
        );

      case ImageTypes.file:
        return SizedBox(
          height: height,
          width: width,
          child: Image.file(
            File(imageUrl!),
            fit: fit,
            errorBuilder: (_, __, ___) => Container(
              color: backGroundColor,
              child: const Center(
                child: Icon(Icons.error),
              ),
            ),
          ),
        );

      case ImageTypes.memory:
        return SizedBox(
          height: height,
          width: width,
          child: Image.memory(
            base64Decode(imageUrl!),
            fit: fit,
            errorBuilder: (_, __, ___) => Container(
              color: backGroundColor,
              child: const Center(child: Icon(Icons.error)),
            ),
          ),
        );

      case ImageTypes.asset:
        return SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            imageUrl!,
            color: useIconColor ? color : null,
            fit: fit,
            errorBuilder: (_, __, ___) {
              // log(e.toString());
              return Container(
                color: backGroundColor,
                child: const Center(child: Icon(Icons.error)),
              );
            },
          ),
        );

      case ImageTypes.none:
        return SizedBox(
          height: height,
          width: width,
          child: const Placeholder(),
        );

      case ImageTypes.profile:
        return CachedNetworkImage(
          height: height,
          width: width,
          imageUrl: imageUrl!,
          fit: fit,
          errorWidget: (_, __, ___) => Container(
            color: backGroundColor,
            child: const Center(child: Icon(Icons.person)),
          ),
          placeholder: (_, __) => const Center(child: LoadingIndicatorWidget()),
        );

      case ImageTypes.svg:
        return SizedBox(
          height: height,
          width: width,
          child: SvgPicture.asset(
            imageUrl!,
            // ignore: deprecated_member_use
            color: useIconColor ? color : null,
          ),
        );
    }
  }
}

enum ImageTypes { network, file, asset, profile, none, svg, memory }
