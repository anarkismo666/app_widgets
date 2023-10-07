
import 'package:app_widgets/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<bool> isDarkmodeProvider = StateProvider((ref) => false);

// Listado de colores
final colorListProvider = Provider((ref) => colorList);