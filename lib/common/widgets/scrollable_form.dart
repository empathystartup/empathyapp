import 'package:empathyapp/common/widgets/unfocus_wrapper.dart';
import 'package:flutter/material.dart';

class ScrollableForm extends StatefulWidget {
  final Widget child;

  const ScrollableForm({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  ScrollableFormState createState() => ScrollableFormState();
}

class ScrollableFormState extends State<ScrollableForm> {
  final formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  bool validate() {
    final valid = formKey.currentState!.validate();
    if (!valid) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }

    return valid;
  }

  @override
  Widget build(BuildContext context) {
    return UnfocusWrapper(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: widget.child,
        ),
      ),
    );
  }
}
