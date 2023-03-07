import 'package:flutter/material.dart';

const _defaultColor = Color(0xFF8D8B8B);

extension Typography on Text {
  Text semiRegular([Color? color]) {
    return Text(
      data!,
      key: key,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: color ?? _defaultColor,
      ),
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  Text regular([Color? color]) {
    return Text(
      data!,
      key: key,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color ?? _defaultColor,
      ),
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  Text regularMedium([Color? color]) {
    return Text(
      data!,
      key: key,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color ?? _defaultColor,
      ),
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  Text regularExtraBold([Color? color]) {
    return Text(
      data!,
      key: key,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: color ?? _defaultColor,
      ),
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  Text regularSemiBold([Color? color]) {
    return Text(
      data!,
      key: key,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: color ?? _defaultColor,
      ),
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  Text regularBold([Color? color]) {
    return Text(
      data!,
      key: key,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: color ?? _defaultColor,
      ),
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
