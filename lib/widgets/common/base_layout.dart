import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono_app/common/constants/constant.dart';

enum BaseLayoutTheme { v1, v2 }

enum BaseLayoutAppBarTheme { v1, v2 }

class BaseLayoutAppBar extends StatelessWidget {
  final String? title;
  final VoidCallback? onBackTap;
  final List<Widget>? actions;
  final EdgeInsets padding;
  final Widget? titleWidget;
  final Widget? bottom;
  final Widget? top;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final BaseLayoutAppBarTheme baseLayoutAppBarTheme;
  final Color? backgroundColor;
  final CrossAxisAlignment? crossAxisAlignmentAppBar;
  final Color? titleColor;
  final Color? backButtonColor;

  const BaseLayoutAppBar({
    Key? key,
    this.title,
    this.onBackTap,
    this.actions,
    this.padding = const EdgeInsets.only(top: 14, left: 20, right: 20),
    this.systemUiOverlayStyle,
    this.bottom,
    this.top,
    this.baseLayoutAppBarTheme = BaseLayoutAppBarTheme.v1,
    this.backgroundColor,
    this.crossAxisAlignmentAppBar,
    this.titleColor,
    this.backButtonColor,
  })  : titleWidget = null,
        super(key: key);

  const BaseLayoutAppBar.v2(
      {Key? key,
      this.title,
      this.onBackTap,
      this.actions,
      this.padding = const EdgeInsets.only(top: 14, left: 20, right: 20),
      this.systemUiOverlayStyle,
      this.bottom,
      this.top,
      this.baseLayoutAppBarTheme = BaseLayoutAppBarTheme.v2,
      this.backgroundColor,
      this.crossAxisAlignmentAppBar,
      this.titleColor,
      this.backButtonColor})
      : titleWidget = null,
        super(key: key);

  const BaseLayoutAppBar.customTitleWidget(
      {Key? key,
      required this.titleWidget,
      this.actions,
      this.padding = const EdgeInsets.only(top: 14, left: 20, right: 20),
      this.systemUiOverlayStyle,
      this.bottom,
      this.top,
      this.baseLayoutAppBarTheme = BaseLayoutAppBarTheme.v1,
      this.backgroundColor,
      this.crossAxisAlignmentAppBar,
      this.titleColor,
      this.backButtonColor})
      : title = null,
        onBackTap = null,
        super(key: key);

  setConfigByVersion<T>(T configV1, T configV2) {
    if (configV1.runtimeType == Color || configV2.runtimeType == Color) {
      return baseLayoutAppBarTheme == BaseLayoutAppBarTheme.v1
          ? configV1
          : configV2;
    }
    if (configV1.runtimeType == String || configV2.runtimeType == String) {
      return baseLayoutAppBarTheme == BaseLayoutAppBarTheme.v1
          ? configV1
          : configV2;
    }
  }

  Widget _buildTitle(BuildContext context) {
    if (title != null) {
      return baseLayoutAppBarTheme == BaseLayoutAppBarTheme.v2
          ? Stack(
              alignment: Alignment.centerLeft,
              children: [
                if (Navigator.canPop(context)) ...[
                  _buildBackButton(context)!,
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      title ?? '',
                      style: TextStyle(
                        color: titleColor ?? Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ] else
                  Align(
                    alignment: Alignment.center,
                    child: Expanded(
                      child: Text(
                        title ?? '',
                        style: TextStyle(
                          color: titleColor ?? Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
              ],
            )
          : Row(
              children: [
                if (Navigator.canPop(context)) ...[
                  _buildBackButton(context)!,
                  Flexible(
                    child: Text(
                      title ?? '',
                      style: TextStyle(
                        color: titleColor ?? Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ] else
                  Flexible(
                    child: Text(
                      title ?? '',
                      style: TextStyle(
                        color: titleColor ?? Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            );
    }
    if (titleWidget != null) {
      return titleWidget!;
    }
    return const SizedBox.shrink();
  }

  Widget? _buildBackButton(BuildContext context) {
    if (Navigator.canPop(context)) {
      return IconButton(
        onPressed: () {
          if (onBackTap == null) {
            Navigator.pop(context);
          } else {
            onBackTap?.call();
          }
        },
        iconSize: 18,
        icon: Icon(
          Icons.arrow_back_ios,
          color: backButtonColor ??
              setConfigByVersion<Color>(
                Colors.black26,
                Colors.grey,
              ),
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyle ?? SystemUiOverlayStyle.dark,
      child: Container(
        color: backgroundColor ??
            setConfigByVersion<Color>(Colors.grey, Colors.grey),
        alignment: Alignment.bottomLeft,
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // _backNavigator,
              if (top != null) top!,
              Container(
                padding: padding,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                      crossAxisAlignmentAppBar ?? CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 3,
                      child: _buildTitle(context),
                    ),
                  ],
                ),
              ),
              if (bottom != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: bottom!,
                )
            ],
          ),
        ),
      ),
    );
  }
}

enum BaseLayoutFooterPosition { floating, fixed }

class BaseLayout extends StatefulWidget {
  final String title;
  final VoidCallback? onBackTap;
  final Widget? bottomNavigationBar;
  final Widget body;
  final Widget? footer;
  final BaseLayoutFooterPosition footerPosition;
  final Function(String? value)? onSearch;
  final VoidCallback? onClear;
  final String? hintText;
  final EdgeInsets? footerPadding;
  final EdgeInsets? contentPadding;
  final Widget? appBar;
  final Color? backgroundColor;
  final Color? appBarBackgroundColor;
  final Widget? floatingActionButton;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final Widget? backgroundImage;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final BaseLayoutTheme baseLayoutTheme;

  const BaseLayout({
    Key? key,
    required this.title,
    this.onBackTap,
    this.bottomNavigationBar,
    this.footerPadding,
    this.contentPadding,
    this.backgroundColor,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.backgroundImage,
    required this.body,
    this.footer,
    this.footerPosition = BaseLayoutFooterPosition.fixed,
    this.appBarBackgroundColor,
    this.baseLayoutTheme = BaseLayoutTheme.v1,
  })  : onSearch = null,
        hintText = null,
        appBar = null,
        onClear = null,
        super(key: key);

  const BaseLayout.v2({
    Key? key,
    required this.title,
    this.onBackTap,
    this.bottomNavigationBar,
    this.footerPadding,
    this.contentPadding,
    this.backgroundColor,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.backgroundImage,
    required this.body,
    this.footer,
    this.footerPosition = BaseLayoutFooterPosition.fixed,
    this.appBarBackgroundColor,
    this.baseLayoutTheme = BaseLayoutTheme.v2,
  })  : onSearch = null,
        hintText = null,
        appBar = null,
        onClear = null,
        super(key: key);


  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  late FocusNode _searchFocusNode;
  late TextEditingController _searchController;

  @override
  initState() {
    super.initState();
    _searchController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    _searchFocusNode = FocusNode()
      ..addListener(() {
        setState(() {});
      });
  }

  Widget _buildTitle(BuildContext context) {
    switch (widget.baseLayoutTheme) {
      case BaseLayoutTheme.v2:
        return _buildTitleV2(context);
      default:
        return _buildTitleV1(context);
    }
  }

  Widget _buildTitleV1(BuildContext context) {
    return Row(
      children: [
        if (Navigator.canPop(context)) ...[
          _buildBackButton(context)!,
          Expanded(
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.grey,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ] else
          Expanded(
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.grey,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }

  Widget _buildTitleV2(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        if (Navigator.canPop(context)) ...[
          _buildBackButton(context)!,
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ] else
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
      ],
    );
  }

  PreferredSize? get _searchBar {
    if (widget.onSearch != null) {
      return PreferredSize(
          preferredSize: const Size(double.infinity, 64),
          child: widget.baseLayoutTheme == BaseLayoutTheme.v1
              ? SearchBar(
                  focusNode: _searchFocusNode,
                  onChanged: widget.onSearch,
                  controller: _searchController,
                  hintText: widget.hintText,
                )
              : Container());
    }
    return null;
  }

  Widget _buildIcon() {
    switch (widget.baseLayoutTheme) {
      case BaseLayoutTheme.v2:
        return const Icon(
          Icons.arrow_back_ios,
          color: Colors.blueGrey,
        );
      default:
        return const Icon(
          Icons.arrow_back_ios,
        );
    }
  }

  Widget? _buildBackButton(BuildContext context) {
    if (Navigator.canPop(context)) {
      return IconButton(
        onPressed: () {
          if (widget.onBackTap == null) {
            Navigator.pop(context);
          } else {
            widget.onBackTap?.call();
          }
        },
        iconSize: 18,
        icon: _buildIcon(),
      );
    }
    return null;
  }

  setConfigByVersion<T>(T configV1, T configV2) {
    if (configV1.runtimeType == Color || configV2.runtimeType == Color) {
      return widget.baseLayoutTheme == BaseLayoutTheme.v1 ? configV1 : configV2;
    }
    if (configV1.runtimeType == String || configV2.runtimeType == String) {
      return widget.baseLayoutTheme == BaseLayoutTheme.v1 ? configV1 : configV2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: widget.backgroundColor ?? Colors.grey,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      appBar: null,
      // widget.appBar == null
      //     ? AppBar(
      //         title: _buildTitle(context),
      //         backgroundColor: widget.appBarBackgroundColor ??
      //             setConfigByVersion<Color>(Colors.grey, Colors.grey),
      //         automaticallyImplyLeading: false,
      //         elevation: 0,
      //         centerTitle: false,
      //         bottom: _searchBar,
      //         systemOverlayStyle: SystemUiOverlayStyle.dark,
      //       )
      //     : null,
      bottomNavigationBar: widget.bottomNavigationBar,
      body: Stack(
        children: [
          Image.asset(LocalImages.background),
          widget.backgroundImage ?? Container(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.appBar != null) widget.appBar!,
              Expanded(
                child: Container(
                  // color: PColors.background.b100,
                  padding: widget.contentPadding ?? const EdgeInsets.all(12),
                  child: widget.body,
                ),
              ),
              if (widget.footer != null &&
                  widget.footerPosition == BaseLayoutFooterPosition.fixed) ...[
                // const Spacer(),
                Container(
                  width: double.infinity,
                  padding: widget.footerPadding ??
                      const EdgeInsets.symmetric(vertical: 12),
                  color: setConfigByVersion<Color>(Colors.grey, Colors.grey),
                  child: UnconstrainedBox(child: widget.footer),
                )
              ]
            ],
          ),
          if (widget.footer != null &&
              widget.footerPosition == BaseLayoutFooterPosition.floating)
            // const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: widget.footerPadding ??
                    const EdgeInsets.symmetric(vertical: 12),
                child: UnconstrainedBox(child: widget.footer),
              ),
            )
        ],
      ),
    );
  }
}
