import 'package:flutter/material.dart';

class NothingWidget extends Widget {
  const NothingWidget({super.key});
  @override
  Element createElement() {
    return _NothingElement(this);
  }
}

class _NothingElement extends Element {
  _NothingElement(NothingWidget super.widget);

  @override
  void mount(Element? parent, dynamic newSlot) {
    assert(
    parent is! MultiChildRenderObjectElement,
    "You are using Nothing under a MultiChildRenderObjectElement.",
    );
    super.mount(parent, newSlot);
  }

  @override
  bool get debugDoingBuild => false;

  @override
  void performRebuild() {
    super.performRebuild();
    //nothing
  }
}