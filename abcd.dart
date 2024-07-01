import 'dart:io';

Future<void> main() async {
  print(await checkDir('domain'));
}

Future<int> checkDir(String target, [int removeCount = 0]) async {
  Directory core = Directory.current;
  String path = core.path;

  if (removeCount > 0) {
    for (int i = 0; i < removeCount; i++) {
      final split = core.path.split('/');
      split.removeLast();

      path = split.join('/');
    }
  }

  for (final dir in Directory(path).listSync()) {
    if (!dir.path.contains(target)) {
      print(core.path);
      checkDir(target, removeCount + 1);
    }
  }

  return removeCount;
}
