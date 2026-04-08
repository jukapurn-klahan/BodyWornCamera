import 'package:dropdown_search2/dropdown_search2.dart';
import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_theme_new.dart';

class DropDownPriority extends StatelessWidget {
  static const String allPriorityFilter = 'ทั้งหมด';
  static const List<String> priorityOptions = [allPriorityFilter, 'สำคัญมาก', 'เร่งด่วน', 'ปกติ', 'ต่ำ'];

  const DropDownPriority({
    super.key,
    required this.selectItem,
    required this.onChangeds,
    required this.checkErrorIcon,
    this.validators,
    this.textHint,
    this.hintColor,
    this.setColor,
    this.popupTitleText,
    this.showSearchBox = false,
  });

  final String? textHint;
  final Color? hintColor;
  final Color? setColor;
  final String? selectItem;
  final bool checkErrorIcon;
  final String? Function(String?)? validators;
  final void Function(String?)? onChangeds;
  final String? popupTitleText;
  final bool showSearchBox;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowThemeNew.of(context);
    final resolvedHintText = textHint ?? 'กรุณาเลือก';
    final resolvedHintColor = hintColor ?? theme.secondaryText;
    final resolvedSetColor = setColor ?? theme.primaryText;

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: DropdownSearch<String>(
        dropDownButton: Icon(Icons.keyboard_arrow_down_rounded, color: theme.secondaryText, size: 20.0),
        showAsSuffixIcons: true,
        isFilteredOnline: false,
        showClearButton: false,
        showSearchBox: showSearchBox,
        dropdownBuilderSupportsNullItem: true,
        selectedItem: selectItem,
        validator: validators,
        items: priorityOptions,
        itemAsString: (item) => item ?? '',
        compareFn: (item, selectedItem) => item == selectedItem,
        maxHeight: MediaQuery.sizeOf(context).height * 0.4,
        dropdownSearchDecoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: theme.secondaryBackground,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.alternate, width: 1.0),
            borderRadius: BorderRadius.circular(18.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.primary, width: 1.0),
            borderRadius: BorderRadius.circular(18.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.error, width: 1.0),
            borderRadius: BorderRadius.circular(18.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.error, width: 1.0),
            borderRadius: BorderRadius.circular(18.0),
          ),
          prefixIconConstraints: const BoxConstraints(),
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 12.0, end: 10.0),
            child: checkErrorIcon ? const Icon(Icons.warning_rounded, color: Colors.red, size: 20.0) : const Icon(Icons.flag_outlined, size: 20.0),
          ),
          hintText: resolvedHintText,
          hintStyle: theme.bodyMedium.override(
            fontFamily: theme.bodyMediumFamily,
            color: checkErrorIcon ? theme.error : resolvedHintColor,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.0,
            useGoogleFonts: !theme.bodyMediumIsCustom,
          ),
        ),
        dropdownBuilder: (context, selectedItem) => selectedItem != null
            ? Text(
                selectedItem,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.bodyMedium.override(
                  fontFamily: theme.bodyMediumFamily,
                  fontWeight: FontWeight.w600,
                  color: resolvedSetColor,
                  letterSpacing: 0.0,
                  useGoogleFonts: !theme.bodyMediumIsCustom,
                ),
              )
            : const SizedBox.shrink(),
        popupShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        popupTitle: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: Container(
                      width: 80.0,
                      height: 8.0,
                      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    popupTitleText ?? 'กรุณาเลือกระดับความสำคัญ',
                    style: theme.bodyLarge.override(
                      fontFamily: theme.bodyLargeFamily,
                      color: theme.primaryText,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.0,
                      useGoogleFonts: !theme.bodyLargeIsCustom,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 5,
              child: TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(overlayColor: theme.error.withValues(alpha: 0.1)),
                child: Text(
                  'ยกเลิก',
                  style: theme.bodyMedium.override(
                    fontFamily: theme.bodyMediumFamily,
                    color: theme.error,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.0,
                    useGoogleFonts: !theme.bodyMediumIsCustom,
                  ),
                ),
              ),
            ),
          ],
        ),
        searchFieldProps: TextFieldProps(
          cursorColor: theme.tertiary,
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          style: theme.titleSmall.override(fontFamily: theme.titleSmallFamily, letterSpacing: 0.0, useGoogleFonts: !theme.titleSmallIsCustom),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
            hintText: 'ค้นหา',
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            hintStyle: theme.bodySmall.override(
              fontFamily: theme.bodySmallFamily,
              color: theme.secondaryText,
              fontWeight: FontWeight.w100,
              letterSpacing: 0.0,
              lineHeight: 1.0,
              useGoogleFonts: !theme.bodySmallIsCustom,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0x00000000), width: 1.0),
              borderRadius: BorderRadius.circular(100.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0x00000000), width: 1.0),
              borderRadius: BorderRadius.circular(100.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0x00000000), width: 1.0),
              borderRadius: BorderRadius.circular(100.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0x00000000), width: 1.0),
              borderRadius: BorderRadius.circular(100.0),
            ),
            prefixIcon: Icon(Icons.search_rounded, color: theme.secondaryText, size: 24.0),
          ),
        ),
        popupItemBuilder: (context, item, isSelected) => Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Text(
                      item,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: theme.bodyMedium.override(
                        fontFamily: theme.bodyMediumFamily,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.0,
                        useGoogleFonts: !theme.bodyMediumIsCustom,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(color: Colors.grey[300], height: 1),
            ),
          ],
        ),
        mode: Mode.BOTTOM_SHEET,
        onChanged: onChangeds,
      ),
    );
  }
}
