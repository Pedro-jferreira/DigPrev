 import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';

abstract class PageManage{
  List<Section>  pageStages(List<Section> sections, int pagezise);
  Section findPage(List<Section> sections, int index, {int? pageSize});
 }