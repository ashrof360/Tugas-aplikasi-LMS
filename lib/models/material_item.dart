class MaterialItem {
  const MaterialItem({
    required this.title,
    required this.type,
    required this.sizeLabel,
  });

  final String title;
  final String type; // PDF / Video / PPT
  final String sizeLabel;
}
