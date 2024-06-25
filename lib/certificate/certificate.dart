import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadrebk/profile/cubit.dart';
import 'package:tadrebk/profile/states.dart';
import 'package:tadrebk/shared/components.dart';
import 'package:tadrebk/shared/fonts.dart';
import '../shared/colors.dart';
import '../shared/header_widget.dart';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Certificate extends StatefulWidget {
  final String trainingName;
  const Certificate({required this.trainingName, Key? key}) : super(key: key);

  @override
  State<Certificate> createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStatus>(
      builder: (context, state) {
        final model = context.read<ProfileCubit>().userModel;
        var firstName = model?.firstName ?? 'First Name';
        var lastName = model?.lastName ?? 'Last Name';

        final windowWidth = MediaQuery.of(context).size.width;
        final windowHeight = MediaQuery.of(context).size.height;

        return windowWidth >= 1100 && windowHeight >= 600
            ? Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(index: 1),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.17,
                  color: mainColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Certificate verification',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: mainFont,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                'This certificate is accredited by tadrebk platform, and in order to obtain it, you must complete your training in its entirety',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: mainFont,
                                    color: Colors.white),
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset(
                            'assets/images/img_38.png',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.8,
                          ),
                          Text(
                            '$firstName $lastName',
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: mainFont,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.8 / 1.5,
                            right: MediaQuery.of(context).size.width / 2.15,
                            child: Text(
                              widget.trainingName,
                              style: TextStyle(fontSize: 25, fontFamily: mainFont),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.8 / 1.3,
                            left: MediaQuery.of(context).size.width / 2.7,
                            child: Text(
                              '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}',
                              style: TextStyle(fontSize: 14, fontFamily: mainFont),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.8 / 1.3,
                            right: MediaQuery.of(context).size.width / 2.63,
                            child: Text(
                              'Tadrebk',
                              style: TextStyle(fontSize: 14, fontFamily: mainFont),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      MaterialButton(
                        color: mainColor,
                        onPressed: () async {
                          final ByteData imageData = await rootBundle.load('assets/images/img_38.png');
                          final Uint8List bytes = Uint8List.view(imageData.buffer);

                          final pdf = pw.Document();

                          final ByteData fontData = await rootBundle.load('assets/fonts/Poppins-Regular.ttf');
                          final Uint8List fontBytes = fontData.buffer.asUint8List();
                          final pw.Font ttf = pw.Font.ttf(fontBytes.buffer.asByteData());

                          pdf.addPage(pw.Page(
                            build: (pw.Context context) {
                              return pw.Center(
                                child: pw.Stack(
                                  alignment: pw.Alignment.center,
                                  children: [
                                    pw.Image(pw.MemoryImage(bytes)),
                                    pw.Center(
                                      child: pw.Text(
                                        '$firstName $lastName',
                                        style: pw.TextStyle(
                                          font: ttf,
                                          fontSize: 30,
                                          color: PdfColors.black,
                                        ),
                                      ),
                                    ),
                                    pw.Positioned(
                                      top: 420,
                                      left: 220,
                                      child: pw.Text(
                                        widget.trainingName,
                                        style: pw.TextStyle(
                                          font: ttf,
                                          fontSize: 15,
                                          color: PdfColors.black,
                                        ),
                                      ),
                                    ),
                                    pw.Positioned(
                                      top: 450,
                                      left: 128,
                                      child: pw.Text(
                                        '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}',
                                        style: pw.TextStyle(fontSize: 10, font: ttf),
                                      ),
                                    ),
                                    pw.Positioned(
                                      top: 450,
                                      right: 135,
                                      child: pw.Text(
                                        'Tadrebk',
                                        style: pw.TextStyle(fontSize: 10, font: ttf),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ));

                          final blob = html.Blob([await pdf.save()], 'application/pdf');
                          final url = html.Url.createObjectUrlFromBlob(blob);
                          final anchor = html.AnchorElement(href: url)
                            ..setAttribute("download", "certificate.pdf")
                            ..click();
                          html.Url.revokeObjectUrl(url);
                        },
                        child: Text(
                          'Download PDF',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                footerPage(context),
              ],
            ),
          ),
        )
            : Container();
      },
    );
  }
}
