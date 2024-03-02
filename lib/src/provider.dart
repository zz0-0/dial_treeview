import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nodeExpandedProvider =
    StateProvider.family<bool, Key>((ref, arg) => false);
