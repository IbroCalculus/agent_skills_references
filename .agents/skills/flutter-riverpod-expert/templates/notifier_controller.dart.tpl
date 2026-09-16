import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Feature State Model
class FeatureState {
  final bool isSubmitting;
  final String? error;

  const FeatureState({this.isSubmitting = false, this.error});

  FeatureState copyWith({bool? isSubmitting, String? error}) {
    return FeatureState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error,
    );
  }
}

// 2. Notifier Definition
class FeatureNotifier extends AutoDisposeNotifier<FeatureState> {
  @override
  FeatureState build() {
    return const FeatureState();
  }

  Future<void> submitAction(String payload) async {
    state = state.copyWith(isSubmitting: true, error: null);
    try {
      // Execute repository / service action
      state = state.copyWith(isSubmitting: false);
    } catch (e) {
      state = state.copyWith(isSubmitting: false, error: e.toString());
    }
  }
}

// 3. Provider Definition
final featureProvider =
    NotifierProvider.autoDispose<FeatureNotifier, FeatureState>(
  FeatureNotifier.new,
);
