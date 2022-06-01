import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            'Terms And Conditions',
            style: TextStyle
              (color: Colors.black54, fontSize: 16),
          )),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(padding: EdgeInsets.only(top: 10),
                    height: 100,
                    width: 100,
                    child: Image.asset("image/Cha.png"),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ข้อตกลงเเละเงื่อนไข ชาไทย ครับ',
                      style: TextStyle(fontSize: 15, color: Colors.red),
                      maxLines: 3,
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '1. ข้อตกลง',
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'การเข้าถึงข้อมูลด้วยการใช้แอพพลิเคชั่น ชาไทย ครับ หรือ เว็บไซต์ Chathai.com และบริการทั้งหมดที่ให้บริการโดย ชาไทย ครับ หรือบริการเสริม ชาไทย ครับ รวมถึงบริการ บุคคล หรือ องค์กรเข้าร่วมเงื่อนไขในการเป็นผู้ใช้บริการรวมถึงผู้ใช้ทั้งหมดที่ใช้แอพพลิเคชั่นเว็บไซต์ หรือบริการในนามของผู้ใช้เหล่านั้นรวมถึง “คุณ” หรือ “ผู้ใช้" ยอมรับ และตกลงในข้อผูกพันของเงื่อนไขในการใช้เงื่อนไขผู้ใช้ต้องใช้แอพพลิเคชั่น เว็บไซต์ และบริการให้สอดคล้องกับเงื่อนไขเหล่านี้ ชาไทย ครับ ขอสงวนลิขสิทธิ์ต่อผู้ใช้ในเงื่อนไขเหล่านี้อย่างชัดเจน',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'เงื่อนไขเหล่านี้ใช้กับการใช้แอพพลิเคชั่น เว็บไซต์ (รวมถึงการใช้แบบชำระค่าบริการ) และ บริการทดลองใช้ฟรี',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Text(
                    '2. การไม่ปฏิบัติตามเงื่อนไขเหล่านี้',
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                      child: AutoSizeText(
                        'หากผู้ใช้ไม่ปฏิบัติตามเงื่อนไขเหล่านี้  ชาไทย ครับ อาจใช้ดุลยพินิจตามเหมาะสม และไม่แจ้งให้ทราบล่วงหน้าต่อการยกเลิกหรือระงับบัญชีผู้ใช้ชั่วคราว และปฏิเสธการให้บริการกับผู้ใช้นั้น ๆ',
                        style: TextStyle(fontSize: 13),
                      ))
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child:AutoSizeText(
                      '3. การแก้ไข',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ชาไทย ครับ ขอสงวนสิทธิ์ในการแก้ไข หรือปรับปรุงเงื่อนไข และแอพพลิเคชั่น เว็บไซต์ และ/หรือบริการที่ให้บริการได้ทุกเมื่อโดยแจ้ง หรือไม่แจ้งให้ผู้ใช้ทราบก็ได้และอาจทำการเพิ่มคุณสมบัติใหม่ซึ่งจะมีผลต่อเงื่อนไข ผู้ใช้ใด ๆ ที่ใช้แอพพลิเคชั่น เว็บไซต์ หรือบริการต่อหลังจากมีการเปลี่ยนแปลงจะยอมรับข้อตกลงต่อการเปลี่ยนแปลงเหล่านั้นผู้ใช้ควรทำการตรวจสอบเงื่อนไขก่อนอย่างสม่ำเสมอ เวอร์ชั่นใหม่ของเงื่อนไขเหล่านี้จะลงวันที่ตามวันที่ที่มีผลบังคับใช้',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Text(
                    '4. แอพพลิเคชั่น',
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'แอพพลิเคชั่น เว็บไซต์ และบริการ ที่มีให้นั้นให้บริการบนพื้นฐานของ “ตามสภาพ” และ “ตามที่มีอยู่”และคุณรับทราบว่าการใช้บริการนั้นเป็นความเสี่ยงของคุณแต่เพียงผู้เดียว ชาไทย ครับ ไม่ขอรับผิดใด ๆ และรับผิดชอบทั้งหมด หรือความปลอดภัย หรือความน่าเชื่อถือของแอพพลิเคชั่น',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ชาไทย ครับ  ขอสงวนสิทธิ์ในการเปลี่ยนแปลง ยกเลิกชั่วคราว หรือหยุดแอพพลิเคชั่นเว็บไซต์ หรือบริการ (หรือส่วนใดส่วนหนึ่ง)มีการแจ้งเตือน หรือไม่เมื่อใดก็ได้ พวกเราจะไม่รับผิดชอบต่อคุณ หรือบุคคลที่สามจากการเปลี่ยนแปลง ราคาเปลี่ยนแปลง การหยุดชั่วคราว หรือหยุดแอพพลิเคชัน เว็บไซต์ หรือบริการ',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ในนามของผู้ให้บริการ และผู้ให้บริการบุคคลที่สาม ชาไทย ครับ แยกการรับประกันที่อาจมีผลกระทบ หรือ อีกนัยหนึ่งอาจมีผลบังคับใช้ภายใต้พระราชบัญญัติ หรืออีกนัยหนึ่งภายใต้การบังคับใช้ของกฎหมายต่อขอบเขตสูงสุดของกฏหมาย',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '5. ข้อมูลบัญชี',
                style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ในการเข้าถึงข้อมูล และการใช้แอพพลิเคชั่น เว็บไซต์/หรือบริการ ผู้ใช้จำเป็นต้อง: ให้ข้อมูลที่ชัดเจนเกี่ยวกับผู้ใช้ รวมถึงชื่อเต็มทางกฏหมาย และที่อยู่อีเมลล์ (ตามที่เว็บไซต์ระบุไว้) (“ข้อมูลบัญชี”) และบุคคลธรรมดาเช่น บัญชี และผู้ใช้เข้าระบบต้องไม่ทำการลงทะเบียน หรือเข้าถึงข้อมูลผ่านทางวิธีอัตโนมัติ',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ผู้ใช้ทุกคนยอมรับต่อการให้ข้อมูลบัญชีที่เป็นจริง ชัดเจน และสมบูรณ์ และรักษา ปรับปรุงข้อมูลบัญชีของผู้ใช้อย่างรวดเร็วเพื่อให้มั่นใจว่าข้อมูลยังคงเป็นความจริง ชัดเจน เป็นปัจจุบัน และสมบูรณ์',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '6. มีความรับผิดชอบ',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ผู้ใช้แต่ละคนจะต้องรับผิดชอบต่อกิจกรรมที่เกิดจากการใช้บริการ ชาไทย ครับ ไม่ขอรับผิดชอบต่อข้อบกพร่องใด ๆ ที่เกี่ยวข้องกับผู้ใช้แต่ละคนในการใช้บริการ และจะไม่รับผิดชอบหากผู้ใช้ประสบกับการสูญเสีย หรือเสียหายอันเกิดจากการใช้บริการ รวมถึง (แต่ไม่จำกัดแค่นั้น)การสูญเสีย หรือเสียหายใด ๆ อันเกิดจากการลดเกรดของบริการที่ผู้ใช้อาจเลือกใช้ผ่านทางเว็บไซต์ และการยกเลิกบัญชีใด ๆ ของผู้ใช้',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '7. ไม่ผิดกฎหมาย',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ผู้ใช้ต้องไม่ใช้แอพพลิเคชั่น เว็บไซต์ หรือบริการ เพื่อวัตถุประสงค์ในการทำผิดกฏหมาย หรือไม่ได้รับอนุญาต หรืออัพโหลดข้อมูลใด ๆ ที่ผิดต่อสัญญาอันเป็นความลับ ลิขสิทธิ์ เครื่องหมายการค้า หรือทรัพย์สินทางปัญญา หรือกรรมสิทธิ์ในทรัพย์สินของบุคคล หรือ หน่วยงาน หรือองค์กรใด ๆ',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ชาไทย ครับ ขอสงวนสิทธิ์ แต่ไม่มีข้อผูกพัน ต่อการตรวจสอบการใช้งานแอพพลิเคชั่น เว็บไซต์ หรือบริการของคุณ เพื่อทำการค้นหาการฝ่าฝืนเงื่อนไขที่ได้เกิดขึ้น หรือเพื่อการปฏิบัติให้สอดคล้องตามกฏหมาย ข้อบังคับ กระบวนการด้านกฏหมาย หรือคำขอร้องจากรัฐบาล',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '8. ไม่มีอันตรายจากมัลแวร์',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ผู้ใช้ต้องทำการเข้าถึงข้อมูลผ่านทางตัวเชื่อมแอพพลิเคชั่น เว็บไซต์ และบริการที่ ชาไทย ครับจัดไว้ให้เท่านั้น และจะต้องไม่ใช้แอพพลิเคชั่น เว็บไซต์ หรือบริการเพื่อวิธีมัลแวร์ ข่มเหง ก่อกวน ข่มขู่ คุกคาม หรือปลอมแปลงผู้ใช้แอพพลิเคชั่น เว็บไซต์ หรือบริการคนอื่น ๆ',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '9. ใช้งานโดยชอบธรรม',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      ' ชาไทย ครับ ขอสงวนสิทธิ์ในการเฝ้าดู และบังคับใช้เงื่อนไขของนโยบายการใช้งานที่เหมาะสมได้ทุกเมื่อ ชาไทย ครับ ขอสงวนสิทธิ์ในการยกเลิก หรือระงับบัญชีผู้ใช้ชั่วคราวได้ทุกเมื่อหาก  ชาไทย ครับ รู้สึกว่าผู้ใช้มีการทำผิดนโยบายการใช้งานที่เหมาะสม',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
          Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '10. การชำระเงิน/การเเลกเเต้มคะเเนน',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'บริการมีการที่มีการเเลกเเต้มคะเเนน เพื่อใช้สิทธิ ไม่มีการใช้บริการในบัญชีที่เปิดไว้ มูลค่าของสมาชิกที่ใช้ไป หรือการคืนเงินเเละเเต้มอื่น ๆ ที่เกี่ยวข้องกับบัญชีของคุณนั้นไม่สามารถรับเงินคืนได้',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ชาไทย ครับ จะไม่รับผิดชอบต่อการคืนเงินในกรณีที่การเชื่อมต่อกับบริการไม่เสถียร',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '11. การยกเลิกบัญชี',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ชาไทย ครับ ขอสงวนสิทธิ์ในการยกเลิก หรือระงับบัญชีผู้ใช้ชั่วคราวได้ทุกเมื่อตาม ดุลยพินิจ ไม่มีตัวเลือกให้ผู้ใช้ทำการยกเลิกบัญชีภายในแอพพลิเคชั่น หรือบนเว็บไซต์ ในการยกเลิกบัญชี ผู้ใช้ต้องหยุดใช้แอพพลิเคชั่น อีเมลล์ หรือโทรศัพท์ขอยกเลิกกับ ชาไทย ครับ ไม่ถือว่าเป็นการยกเลิก',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ข้อมูล และเนื้อหาของคุณอาจถูกจัดเก็บในเซิร์ฟเวอร์ของเราเป็นเวลา 3 เดือนหลังจากการหยุดใช้แอพพลิเคชั่น หรือเว็บไซต์ เนื้อหานี้สามารถกู้คืนได้เมื่อบัญชีของคุณเปิดใช้งานขึ้นอีกครั้งชาไทย ครับ ไม่รับผิดชอบต่อการสูญเสีย หรือเสียหายใด ๆ หรือมีผลมากจากการยกเลิกบัญชีของคุณ หรือการหยุดใช้แอพพลิเคชั่น และมันเป็นความรับผิดชอบของคุณแต่เพียงผู้เดียวเพื่อให้มั่นใจว่าเนื้อหา หรือข้อมูลใด ๆ ของคุณจำเป็นต้องทำการสำรองข้อมูล หรือทำสำเนาก่อนการยกเลิก หรือหยุดใช้แอพพลิเคชั่น ',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'การยกเลิกทั้งหมดจะมีผลในการเปิดใช้งานของบัญชีผู้ใช้อีกครั้ง',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '12. นโยบายการเป็นสมาชิก',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'คุณอยู่ภายใต้นโยบายการสมัครสมาชิกของเราจากการสมัครสมาชิกบริการ ซึ่งสามารถพบนโยบายได้ทุกเมื่อในเอกสารนี้กรุณาอ่านนโยบายการสมัครสมาชิกอย่างระมัดระวังโดยเริ่มจากการคืนเงิน การยกเลิก และนโยบายการตั้งราคา และข้อมูลอื่น ๆ ที่สำคัญ เราขอสงวนสิทธิ์ต่อการเปลี่ยนแปลงนโยบายเหล่านี้ได้ทุกเมื่อ และคุณควรติดตามนโยบายอย่างสม่ำเสมอเพื่อให้แน่ใจว่าคุณรับทราบถึงนโยบายที่เป็นปัจจุบัน',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '13. ความรับผิดชอบ',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ชาไทย ครับ จะไม่รับผิดชอบในความเสียหายทั้งทางตรง ทางอ้อม ค่าเสียหายอันเนื่องมาจากการผิดสัญญา ความเสียหายเฉพาะ ผลกระทบจากความเสียหาย หรือค่าปรับ รวมถึงไม่รับผิดชอบต่อความเสียหายจากการสูญเสียผลกำไร ชื่อเสียง การใช้งาน ข้อมูล หรือการสูญเสียอื่น ๆ ที่จับต้องไม่ได้ (ถึงแม้ว่า ชาไทย ครับได้ทำการแนะนำถึงความเป็นไปได้ต่อความเสียหายดังกล่าวแล้วก็ตาม)ผลอันเนื่องมาจาก:',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '(a) ความสามารถในการใช้บริการ หรือไม่สามารถใช้บริการได้',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '(b) ค่าใช้จ่ายจากการซื้อสินค้า และบริการทดแทนของสินค้า ข้อมูล ข่าวสาร หรือบริการที่ได้ทำการซื้อ หรือรับมา หรือรับข้อความมา หรือนำเข้าความเคลื่อนไหวผ่านบริการ หรือจากบริการ ',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '(c) การไม่ได้รับอนุญาตให้เข้าถึงข้อมูล หรือผลจากการเปลี่ยนแปลงแก้ไขการรับส่ง หรือข้อมูลของคุณ ',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '(d) คำแถลง หรือ การจัดการ ของบุคคลที่สามที่เกี่ยวข้องกับบริการ',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '(e) เรื่องอื่น ๆ ที่เกี่ยวข้องกับการบริการ',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ความรับผิดชอบโดยรวมของ ชาไทย ครับ ภายใต้ หรือสอดคล้องกันกับข้อตกลงนี้จะถูกจำกัดความรับผิดชอบ ',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '14. การป้องกัน',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ผู้ใช้แต่ละคนจะต้องจ่ายค่าชดเชย และคุ้มครองค่าเสียหายให้กับ ชาไทย ครับ ในทุกรูปแบบของหนี้สิน การกระทำ การดำเนินงาน ความต้องการ ต้นทุน ค่าธรรมเนียม และค่าใช้จ่ายที่อาจจะเกิดขึ้น กับชาไทย ครับ หรือทำให้เกิดขึ้น หรืออันเป็นผลเนื่องมาจากการใช้บริการของผู้ใช้',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '15. ทรัพย์สินทางปัญญา',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ผู้ใช้ทั้งหมดยอมรับว่า ชาไทย ครับ เป็นเจ้าของสิทธิในทรัพย์สินทางปัญญาทั้งหมด ที่มีอยู่ในแอพพลิเคชั่น เว็บไซต์ และบริการ อย่างไรก็ตาม  ชาไทย ครับ ไม่มีสิทธิในทรัพย์สินทางปัญญาของข้อมูล หรือเนื้อหา ที่ผู้ใช้ทำการอัพโหลดไปยังแอพพลิเคชั่นหรือ เว็บไซต์',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '16. การสร้างเครื่องหมายการค้าของ ชาไทย ครับ',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ห้ามผู้ใช้ทำการเผยแพร่ หรือใช้เครื่องหมายการค้า การสร้างเครื่องหมายการค้า หรือ โลโก้ของ  ชาไทย ครับ ยกเว้นแต่  ชาไทย ครับ ได้มีการอนุญาตเป็นลายลักษณ์อักษรไว้ก่อนหน้าแล้ว',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '17. การสนับสนุนทางเทคนิค และ การไม่สามารถทำงานได้อย่างปกติ',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ชาไทย ครับ มีความมุ่งมั่นที่จะให้บริการอันดีเยี่ยมแก่ลูกค้า ชาไทย ครับ จะพยายามแก้ปัญหาทางเทคนิคทั้งหมดที่เกิดขึ้นบนแอพพลิเคชั่น เว็บไซต์ หรือการเชื่อมต่อกับบริการในทันที (ในช่วงเวลาทำการปกติ) อย่างไรก็ตามชาไทย ครับ จะไม่รับผิดชอบต่อการสูญเสียอันเป็นผลมาจากการใช้บริการได้บางส่วน หรือไม่สามารถใช้บริการได้ทั้งหมด (ไม่ว่าจะทั้งหมด หรือบางส่วน) คุณยินยอมให้ทีมสนับสนุนของ ชาไทย ครับ เข้าถึงข้อมูลบัญชีของคุณได้เป็นระยะ เพื่อการวิเคราะห์ และแก้ปัญหาต่าง ๆ',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '18. ความปลอดภัย',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ผู้ใช้เป็นผู้รับผิดชอบต่อการรักษาความปลอดภัยของบัญชี และรหัสผู้ใช้ของตนเองบนแอพพลิเคชั่น และ/หรือเว็บไซต์ชาไทย ครับ จะไม่มีส่วนรับผิดชอบต่อการสูญเสียหรือเสียหายใด ๆ อันเนื่องมากจากความผิดพลาดในการเก็บรักษาชื่อผู้ใช้ หรือรหัสผู้ใช้',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'ชาไทย ครับ พยายามเก็บรักษาเนื้อหาที่ผู้ใช้ได้ทำการอัพโหลด แต่จะไม่รับผิดชอบต่อการสูญเสีย หรือเสียหายที่อาจเป็นผลเนื่องมาจากการละเมิดใด ๆ ต่อระบบรักษาความปลอดภัย หรือการไม่ได้รับอนุญาตให้เข้าถึงข้อมูล หรือไม่อนุญาตให้ใช้เนื้อหานั้น ๆ',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '19. บทบัญญัติทั่วไป ',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'เงื่อนไขเหล่านี้ทั้งหมดเป็นข้อตกลงระหว่าง ชาไทย ครับ กับคุณเกี่ยวกับการใช้บริการ และใช้แทนข้อตกลงก่อนหน้า ความเข้าใจ หรือการจัดการระหว่างบุคคลสองฝ่ายที่เกี่ยวกับบริการ ไม่ว่าจะด้วยวาจา หรือลายลักษณ์อักษร',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'คุณต้องไม่ทำการมอบหมาย หรือถ่ายโอน หรือยอมรับการมอบหมาย หรือยอมรับการถ่ายโอนสิทธิ และข้อผูกพันใด ๆ ของคุณที่เกี่ยวข้องกับบริการ และ/หรือเงื่อนไขเหล่านี้ให้กับบุคคลอื่นโดยปราศจากการอนุญาตเป็นลายลักษณ์อักษรจาก ชาไทย ครับ ก่อน',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'หากส่วนใดส่วนหนึ่ง หรือข้อกำหนดของเงื่อนไขเหล่านี้ถูกพบโดยศาลหรือผู้มีอำนาจอื่น ๆ เพื่อให้ เป็นโมฆะ ไม่มีผลบังคับใช้ หรือขัดต่อกฎหมาย ส่วนนั้น ๆ หรือ ข้อกำหนดนั้น ๆ จะถูกแทนที่ด้วยข้อกำหนดที่ เหมาะสมที่สุดเท่าที่จะเป็นไปได้ วัตถุประสงค์ต้นฉบับที่สมบูรณ์ของส่วนนั้น ๆ หรือข้อกำหนดนั้น ๆ ในส่วนที่เหลือของเงื่อนไขจะยังคงมีผลผูกพันกับคู่สัญญา',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'หาก ชาไทย ครับ ยกเลิกการละเมิดใด ๆ ของเงื่อนไขเหล่านี้ การยกเลิกนี้จะไม่รวมถึงการยกเลิกต่อการละเมิดในเงื่อนไขอื่น ๆ การยกเลิกจะไม่มีผลบังคับใช้เว้นแต่มีการทำเอกสารเป็นลายลักษณ์อักษร',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'บุคคลที่ไม่ใช่คู่สัญญาของเงื่อนไขเหล่านี้จะไม่มีสิทธิภายใต้ผลประโยชน์ หรือต่อกฎหมายบังคับใช้ชั่วคราวของเงื่อนไขเหล่านี้',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      '20. กฎหมายที่ใช้บังคับ และขอบเขตของอำนาจศาล',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'เงื่อนไขเหล่านี้จะถูกควบคุมโดยกฏหมายของประเทศสหรัฐอเมริกา และผู้ใช้ยอมให้ศาลของประเทศสหรัฐอเมริกาบังคับใช้อำนาจพิเศษต่อเรื่องใด ๆ หรือข้อพิพาทที่เกิดขึ้นในความสัมพันธ์กับข้อตกลงเหล่านี้',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}


