import 'package:codez/core/const/base.dart';

/// Contains all the paths of image used across the project.
/// Every image path variable name must contain a name and its extension.
/// example :
///
/// for an image with name avatar.png,
/// a suitable variable can be [avatarImagePng].
/// ```dart
/// static const sampleImagePng = "$_base/image.png";
/// ```
/// can be used by doing
/// ```dart
/// ImageAssets.sampleImagePng
/// ```
class ImageAssets {
  static const _base = BasePaths.baseImagePath;

  static const btc = '$_base/btc.png';
  static const eth = '$_base/eth.png';
  static const xtz = '$_base/xtz.png';
  static const sol = '$_base/sol.png';
  static const musk = '$_base/musk.png';
  static const explore = '$_base/explore.png';
  static const peer = '$_base/peer.png';
  static const percent = '$_base/percent.png';
  static const spend = '$_base/spend.png';
  static const wallet = '$_base/wallet.png';
  static const scan = '$_base/scan.png';
  static const elon = '$_base/elon.png';
}

class SvgAssets {
  static const _base = BasePaths.baseSvgPath;

  static const explore = '$_base/explore.svg';
  static const peer = '$_base/peer_chain.svg';
  static const percent = '$_base/percent.svg';
  static const spend = '$_base/spend.svg';
  static const wallet = '$_base/wallet.svg';
}
