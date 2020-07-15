import 'package:flutter/material.dart';
import 'package:xyz_address_picker/xyz_address_picker.dart';

class XYZAddressPickerTestPage extends StatelessWidget {
  const XYZAddressPickerTestPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XYZAddressPickerTestPageContainer();
  }
}

class XYZAddressPickerTestPageContainer extends StatefulWidget {
  const XYZAddressPickerTestPageContainer({Key key}) : super(key: key);

  @override
  _XYZAddressPickerTestPageContainerState createState() => _XYZAddressPickerTestPageContainerState();
}

class _XYZAddressPickerTestPageContainerState extends State<XYZAddressPickerTestPageContainer> {
  String province = '';
  String city = '';
  String street = '';
  List<AddressModel> provinceList = [];
  List<AddressModel> cityList = [];
  List<AddressModel> streetList = [];

  @override
  void initState() {
    super.initState();
    provinceList.add(AddressModel(id: '1', name: '重庆市'));
    provinceList.add(AddressModel(id: '2', name: '四川省'));
    provinceList.add(AddressModel(id: '3', name: '湖南省'));
    provinceList.add(AddressModel(id: '4', name: '湖北省'));
    provinceList.add(AddressModel(id: '5', name: '安徽省'));
    cityList.add(AddressModel(id: '1', name: '巴南区'));
    streetList.add(AddressModel(id: '1', name: '花溪街道'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('地址选择器'),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xFFF7F7F7),
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.bottom - 60,
            child: Column(
              children: <Widget>[
                _buildChooseCity(
                  province: province,
                  city: city,
                  street: street,
                  provinceList: provinceList,
                  cityList: cityList,
                  streetList: streetList,
                  context: context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 选择省市区
  Widget _buildChooseCity({
    String province,
    String city,
    String street,
    List<AddressModel> provinceList,
    List<AddressModel> cityList,
    List<AddressModel> streetList,
    BuildContext context,
  }) {
    TextStyle labelStyle = TextStyle(
      color: Color(0xFF4A4A4A),
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _showBottomSheet(
        province: province,
        city: city,
        street: street,
        provinceList: provinceList,
        cityList: cityList,
        streetList: streetList,
        context: context,
      ),
      child: Container(
        height: 50,
        padding: EdgeInsets.only(left: 15, right: 15),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(width: 70, child: Text('收货地址：', style: labelStyle)),
                SizedBox(width: 30),
                Text('选择所在地区')
              ],
            ),
            Container(
              width: 50,
              child: Center(
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xFF000000),
                  size: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 省市区选择器
  void _showBottomSheet({
    String province,
    String city,
    String street,
    List<AddressModel> provinceList,
    List<AddressModel> cityList,
    List<AddressModel> streetList,
    BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      // 使用true则高度不受16分之9的最高限制
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AddressPicker(
          province: province,
          city: city,
          district: street,
          provinceList: provinceList,
          cityList: cityList,
          districtList: streetList,
          onChanged: (index, id, name) {
            print(index.toString() + ',' + id + ',' + name);
          },
        );
      },
    );
  }
}

class AddressModel {
  String name;
  String id;

  AddressModel({this.name, this.id});
}