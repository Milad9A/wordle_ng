import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wordle_ng/app/app_colors.dart';

enum LetterStatus { initial, notInWord, inWord, correct }

class Letter extends Equatable {
  final LetterStatus status;
  final String val;

  factory Letter.empty() => const Letter(val: '');

  const Letter({
    required this.val,
    this.status = LetterStatus.initial,
  });

  Color get backgroundColor {
    switch (status) {
      case LetterStatus.initial:
        return Colors.transparent;
      case LetterStatus.notInWord:
        return notInWordColor;
      case LetterStatus.inWord:
        return inWordColor;
      case LetterStatus.correct:
        return correctColor;
    }
  }

  Color get borderColor {
    switch (status) {
      case LetterStatus.initial:
        return Colors.grey;
      default:
        return Colors.transparent;
    }
  }

  Letter copyWith({
    String? val,
    LetterStatus? status,
  }) {
    return Letter(
      status: status ?? this.status,
      val: val ?? this.val,
    );
  }

  @override
  List<Object?> get props => [val, status];
}
