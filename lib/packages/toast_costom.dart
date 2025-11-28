import 'package:flutter/material.dart';

class CustomToast {
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  /// Показать custom toast
  static void showCustom({
    required BuildContext context,
    required Widget Function(BuildContext, VoidCallback) builder,
    AlignmentGeometry alignment = Alignment.bottomRight,
    Duration autoCloseDuration = const Duration(seconds: 5),
    Duration animationDuration = const Duration(milliseconds: 300),
    EdgeInsets margin = const EdgeInsets.all(16),
    double? width,
    double? height,
    VoidCallback? onDismiss,
  }) {
    // Закрываем предыдущий toast если он есть
    if (_isVisible) {
      dismiss();
    }

    final overlay = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (context) => _ToastWidget(
        builder: builder,
        alignment: alignment,
        animationDuration: animationDuration,
        autoCloseDuration: autoCloseDuration,
        margin: margin,
        width: width,
        height: height,
        onDismiss: () {
          dismiss();
          onDismiss?.call();
        },
      ),
    );

    _isVisible = true;
    overlay.insert(_overlayEntry!);
  }

  /// Закрыть текущий toast
  static void dismiss() {
    if (_isVisible && _overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _isVisible = false;
    }
  }

  /// Показать toast с успехом
  static void showSuccess({
    required BuildContext context,
    required String message,
    Duration autoCloseDuration = const Duration(seconds: 5),
    AlignmentGeometry alignment = Alignment.bottomRight,
    double? width,
    double? height,
  }) {
    showCustom(
      context: context,
      alignment: alignment,
      autoCloseDuration: autoCloseDuration,
      width: width,
      height: height,
      builder: (context, dismiss) {
        return _DefaultToastContent(
          message: message,
          icon: Icons.check_circle,
          iconColor: Colors.green,
          onClose: dismiss,
        );
      },
    );
  }

  /// Показать toast с ошибкой
  static void showError({
    required BuildContext context,
    required String message,
    Duration autoCloseDuration = const Duration(seconds: 5),
    AlignmentGeometry alignment = Alignment.bottomRight,
    double? width,
    double? height,
  }) {
    showCustom(
      context: context,
      alignment: alignment,
      autoCloseDuration: autoCloseDuration,
      width: width,
      height: height,
      builder: (context, dismiss) {
        return _DefaultToastContent(
          message: message,
          icon: Icons.error,
          iconColor: Colors.red,
          onClose: dismiss,
        );
      },
    );
  }

  /// Показать toast с предупреждением
  static void showWarning({
    required BuildContext context,
    required String message,
    Duration autoCloseDuration = const Duration(seconds: 5),
    AlignmentGeometry alignment = Alignment.bottomRight,
    double? width,
    double? height,
  }) {
    showCustom(
      context: context,
      alignment: alignment,
      autoCloseDuration: autoCloseDuration,
      width: width,
      height: height,
      builder: (context, dismiss) {
        return _DefaultToastContent(
          message: message,
          icon: Icons.warning,
          iconColor: Colors.orange,
          onClose: dismiss,
        );
      },
    );
  }

  /// Показать toast с информацией
  static void showInfo({
    required BuildContext context,
    required String message,
    Duration autoCloseDuration = const Duration(seconds: 5),
    AlignmentGeometry alignment = Alignment.bottomRight,
    double? width,
    double? height,
  }) {
    showCustom(
      context: context,
      alignment: alignment,
      autoCloseDuration: autoCloseDuration,
      width: width,
      height: height,
      builder: (context, dismiss) {
        return _DefaultToastContent(
          message: message,
          icon: Icons.info,
          iconColor: Colors.blue,
          onClose: dismiss,
        );
      },
    );
  }
}

/// Внутренний виджет для отображения toast
class _ToastWidget extends StatefulWidget {
  final Widget Function(BuildContext, VoidCallback) builder;
  final AlignmentGeometry alignment;
  final Duration animationDuration;
  final Duration autoCloseDuration;
  final EdgeInsets margin;
  final double? width;
  final double? height;
  final VoidCallback onDismiss;

  const _ToastWidget({
    required this.builder,
    required this.alignment,
    required this.animationDuration,
    required this.autoCloseDuration,
    required this.margin,
    required this.onDismiss,
    this.width,
    this.height,
  });

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    // Автоматическое закрытие
    Future.delayed(widget.autoCloseDuration, () {
      if (mounted) {
        _close();
      }
    });
  }

  void _close() async {
    await _controller.reverse();
    widget.onDismiss();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = widget.builder(context, _close);

    // Применяем размеры если они заданы
    if (widget.width != null || widget.height != null) {
      content = SizedBox(
        width: widget.width,
        height: widget.height,
        child: content,
      );
    }

    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: widget.alignment,
        child: Padding(
          padding: widget.margin,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: content,
            ),
          ),
        ),
      ),
    );
  }
}

/// Дефолтный контент для toast
class _DefaultToastContent extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onClose;

  const _DefaultToastContent({
    required this.message,
    required this.icon,
    required this.iconColor,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: onClose,
            child: Icon(
              Icons.close,
              size: 20,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
