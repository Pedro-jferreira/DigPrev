class SliverAppBarHelper{
 static (double? collapsedHeight, double expandedHeight) calculateAppBarHeights(
      String title,
      bool hasLeading,
      ) {
    final double? maxValueCollapsed = hasLeading ? 80.0 : 80.0;
    final double maxExpandedHeight = hasLeading ? 180.0 : 130.0;
    final int length = title.length;

    double? finalValueCollapsed = maxValueCollapsed;
    double? finalValueExpanded = maxExpandedHeight;
    if (length <= 30) {
      finalValueCollapsed = hasLeading ? null : null;
      finalValueExpanded = hasLeading ? 100 : 100;
    } else if (length > 30 && length <= 40) {
      finalValueExpanded = hasLeading ? 170 : 120;
    }

    return (
    finalValueCollapsed,
    finalValueExpanded,
    );
  }

}