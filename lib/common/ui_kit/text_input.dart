import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInput extends StatefulWidget {
  final void Function(String)? onTextChange;
  final String? label;
  final String? hint;
  final Color color;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final bool enabled;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool? autocorrect;
  final bool? autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final List<String>? autofillHints;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final AutovalidateMode? autovalidateMode;
  final bool? hasPrefixIcon;
  final void Function()? onTap;

  const TextInput({
    Key? key,
    this.onTextChange,
    this.label,
    this.hint,
    required this.color,
    this.backgroundColor,
    this.controller,
    this.enabled = true,
    this.keyboardType,
    this.focusNode,
    this.validator,
    this.obscureText = false,
    this.autocorrect = true,
    this.autofocus = false,
    this.inputFormatters,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.autofillHints,
    this.textInputAction,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.autovalidateMode,
    this.hasPrefixIcon = false,
    this.onTap,
  }) : super(key: key);
  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final clearButtonVisibilityNotifier = ValueNotifier(false);
  final prefixIconVisibilityNotifier = ValueNotifier(true);
  TextEditingController? controller;
  FocusNode? handleFocus;
  FocusNode? clearButtonFocusNode;

  Widget? prefixIcon;
  Widget? suffixIcon;

  var isErrored = false;

  var radiusIn = const Radius.elliptical(10, 10);
  var radius = 1.0;
  double? initialHeight;

  final key = GlobalKey();
  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    if (widget.enabled) {
      controller?.addListener(controllerListener);
    }
    if (controller?.text != null) {
      controllerListener();
    }
    handleFocus = widget.focusNode ?? FocusNode();

    clearButtonFocusNode = FocusNode(
      canRequestFocus: false,
      skipTraversal: true,
    );

    handleFocus?.addListener(handleFocusChange);

    suffixIcon = widget.enabled
        ? ValueListenableBuilder(
            valueListenable: clearButtonVisibilityNotifier,
            builder: (context, isVisible, child) =>
                isVisible ? child! : const SizedBox.shrink(),
            child: IconButton(
              focusNode: clearButtonFocusNode,
              icon: Icon(
                isErrored ? Icons.error : Icons.cancel,
                color: isErrored ? Colors.red : widget.color.withOpacity(0.55),
              ),
              onPressed: isErrored ? null : controller?.clear,
            ),
          )
        : const SizedBox.shrink();

    prefixIcon = widget.enabled
        ? ValueListenableBuilder(
            valueListenable: prefixIconVisibilityNotifier,
            builder: (context, isVisible, child) =>
                isVisible ? child! : const SizedBox.shrink(),
            child: Icon(
              isErrored ? Icons.error : Icons.search,
              color: isErrored ? Colors.red : widget.color?.withOpacity(0.2),
            ),
          )
        : null;

    WidgetsBinding.instance.addPostFrameCallback((_) => updateRadius());
    super.initState();
  }

  @override
  void dispose() {
    if (widget.controller != null) {
      controller?.removeListener(controllerListener);
    } else {
      controller?.dispose();
    }
    clearButtonVisibilityNotifier?.dispose();
    if (widget.focusNode == null) {
      handleFocus?.dispose();
    } else {
      handleFocus?.removeListener(handleFocusChange);
    }
    prefixIconVisibilityNotifier.dispose();
    clearButtonFocusNode?.dispose();
    super.dispose();
  }

  void handleFocusChange() {
    prefixIconVisibilityNotifier.value = !handleFocus!.hasFocus;
  }

  void controllerListener() {
    widget.onTextChange?.call(controller!.text);
    clearButtonVisibilityNotifier.value = controller!.text.isNotEmpty;
  }

  String? validatorWrapper(String? value) {
    final validatorResult = widget.validator?.call(value);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isErrored = validatorResult != null;
      });
    });
    return validatorResult;
  }

  void updateRadius() {
    if (widget.maxLines == null || widget.maxLines! > 1) {
      final size = key.currentContext?.size;
      if (size != null) {
        initialHeight ??= size.height;
        if (controller!.text.isEmpty) {
          initialHeight = size.height;
        }
        radius = 25 * (initialHeight! / size.height);
      }
    } else {
      radius = 25;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (notification) {
        WidgetsBinding.instance.addPostFrameCallback((_) => updateRadius());
        return true;
      },
      child: Builder(
        builder: (_) => SizeChangedLayoutNotifier(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 10 / 12,
            ),
            child: TextFormField(
              key: key,
              onTap: widget.onTap,
              maxLength: widget.maxLength,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              autovalidateMode: widget.autovalidateMode,
              validator: validatorWrapper,
              focusNode: handleFocus,
              smartQuotesType: SmartQuotesType.disabled,
              smartDashesType: SmartDashesType.disabled,
              enabled: widget.enabled,
              keyboardType: widget.keyboardType,
              controller: controller,
              cursorColor: widget.color,
              obscureText: widget.obscureText!,
              autocorrect: widget.autocorrect!,
              autofocus: widget.autofocus!,
              inputFormatters: widget.inputFormatters,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: widget.color,
                  ),
              autofillHints: widget.autofillHints,
              textInputAction: widget.textInputAction,
              decoration: InputDecoration(
                labelText: widget.label,
                labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isErrored ? Colors.red : widget.color,
                    ),
                hintText: widget.hint,
                hintStyle: TextStyle(color: widget.color.withOpacity(0.3)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(radiusIn),
                  borderSide: BorderSide(
                    color: widget.color.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(radiusIn),
                  borderSide: BorderSide(
                    color: widget.color,
                    width: 1,
                  ),
                ),
                suffixIcon: suffixIcon,
                prefixIcon: widget.hasPrefixIcon! ? prefixIcon : null,
                focusColor: widget.color,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.color.withOpacity(0.55),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(radiusIn),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.all(radiusIn),
                ),
                contentPadding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 14,
                  bottom: 12,
                ),
                errorMaxLines: 3,
                filled: widget.backgroundColor != null,
                fillColor: widget.backgroundColor,
              ),
              onEditingComplete: widget.onEditingComplete,
              onFieldSubmitted: widget.onFieldSubmitted,
            ),
          ),
        ),
      ),
    );
  }
}
