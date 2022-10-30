import 'package:booktickets/screens/ticket_view.dart';
import 'package:booktickets/utils/app_info_list.dart';
import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/widgets/column_layout.dart';
import 'package:booktickets/widgets/dot_layout_builder.dart';
import 'package:booktickets/widgets/tabs.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: Stack(children: [
        ListView(
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(20),
              vertical: AppLayout.getHeight(20)),
          children: [
            Gap(AppLayout.getHeight(40)),
            Text(
              "Tickets",
              style: Styles.headLineStyle,
            ),
            Gap(AppLayout.getHeight(20)),
            const Tabs(firstTab: "Upcoming", secondTab: "Previous"),
            Gap(AppLayout.getHeight(20)),
            Container(
              padding: EdgeInsets.only(left: AppLayout.getWidth(15)),
              child: TicketView(ticket: ticketList[0], isColor: true),
            ),
            const SizedBox(height: 1),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ColumnLayout(
                        firstText: "Flutter DB",
                        secondText: "Passenger",
                        alignment: CrossAxisAlignment.start,
                        isColor: true,
                      ),
                      ColumnLayout(
                        firstText: "5221 345678",
                        secondText: "passport",
                        alignment: CrossAxisAlignment.end,
                        isColor: true,
                      )
                    ],
                  ),
                  Gap(AppLayout.getHeight(20)),
                  const DotLayoutBuilder(sections: 15, isColor: true, width: 5),
                  Gap(AppLayout.getHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ColumnLayout(
                        firstText: "0055 444 77147",
                        secondText: "Number of E-ticket",
                        alignment: CrossAxisAlignment.start,
                        isColor: true,
                      ),
                      ColumnLayout(
                        firstText: "B2SG28",
                        secondText: "Booking code",
                        alignment: CrossAxisAlignment.end,
                        isColor: true,
                      )
                    ],
                  ),
                  Gap(AppLayout.getHeight(20)),
                  const DotLayoutBuilder(sections: 15, isColor: true, width: 5),
                  Gap(AppLayout.getHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/visa.png",
                                scale: 11,
                              ),
                              Text(
                                " *** 2462",
                                style: Styles.headLineStyle3,
                              )
                            ],
                          ),
                          Gap(AppLayout.getWidth(5)),
                          Text(
                            "Payment method",
                            style: Styles.headLineStyle4,
                          )
                        ],
                      ),
                      const ColumnLayout(
                        firstText: "\$249.99",
                        secondText: "Price",
                        alignment: CrossAxisAlignment.end,
                        isColor: true,
                      )
                    ],
                  ),
                  const SizedBox(height: 1),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                child: BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: 'https://github.com/martinovovo',
                  drawText: false,
                  color: Styles.textColor,
                  width: double.infinity,
                  height: 70,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}