import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/user/user.dart';
import 'package:digprev_flutter/ui/report/pdf/viewModels/pdf_ViewModel.dart';
import 'package:digprev_flutter/ui/report/pdf/widgets/report_PDF.dart';
import 'package:digprev_flutter/ui/report/reports/viewModels/Report_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

class SharedButton extends StatelessWidget {
  const SharedButton({
    required this.responseCardId,
    required this.viewModel,
    super.key,
    this.color,
  });

  final String responseCardId;
  final Color? color;
  final ReportPdfViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.share),
      color: color ?? Theme.of(context).colorScheme.primary,
      onPressed: () async {
        await viewModel.findData(responseCardId,).fold(
            ((ResponseCard, UserModel) onSuccess){
              final ReportPdf reportPdf = ReportPdf(
                responseCard: onSuccess.$1,
                userModel: onSuccess.$2,
              );
              reportPdf.generateReportPdf();
            },
            (Exception onError){});
      },
    );
  }
}
