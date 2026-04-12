import 'package:flutter/material.dart';
import 'package:validation/validation.dart';

class TextFormValidationField extends TextFormField {
  TextFormValidationField({
    super.key,
    super.controller,
    required ValidationField<String> validationField,
    required ValidationController validationController,
    InputDecoration decoration = const InputDecoration(),
    super.autofocus,
    super.autofillHints,
    super.maxLength,
    super.maxLengthEnforcement,
    super.keyboardType,
    super.textInputAction,
    super.maxLines,
    super.minLines,
    super.onTap,
    super.onTapOutside,
    super.textCapitalization,
    ValueChanged<String>? onChanged,
    VoidCallback? onEditingComplete,
    super.focusNode,
    super.style,
    super.autocorrect,
    super.enableSuggestions,
    super.textAlign,
    super.buildCounter,
    super.enabled,
    super.contextMenuBuilder,
    super.cursorColor,
    super.cursorHeight,
    super.cursorRadius,
    super.cursorWidth,
    super.enableIMEPersonalizedLearning,
    super.enableInteractiveSelection,
    super.expands,
    super.initialValue,
    super.inputFormatters,
    super.keyboardAppearance,
    super.magnifierConfiguration,
    super.mouseCursor,
    super.obscureText,
    super.obscuringCharacter,
    super.onFieldSubmitted,
    super.onSaved,
    super.readOnly,
    super.restorationId,
    super.scrollController,
    super.scrollPadding,
    super.scrollPhysics,
    super.selectionControls,
    super.showCursor,
    super.smartDashesType,
    super.smartQuotesType,
    super.spellCheckConfiguration,
    super.strutStyle,
    super.toolbarOptions,
    super.textAlignVertical,
    super.textDirection,
  }) : super(
          onChanged: (value) {
            validationController.validateField(validationField, value);
            onChanged?.call(value);
          },
          onEditingComplete: () {
            validationController.addFieldWithVisibleError(
              validationField,
            );
            onEditingComplete?.call();
          },
          decoration: decoration.copyWith(
            errorText: validationController.getFieldVisibleError(
              validationField,
            ),
          ),
        );
}
