// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:platform_project/config/routes/auto_route/router.gr.dart';
// import 'package:platform_project/features/home/presentation/widgets/universal_search/universal_search.dart';
// import '../../../../root_material_app.dart';
//
// class UniversalSearchComponent extends StatefulWidget {
//   const UniversalSearchComponent({Key? key}) : super(key: key);
//
//   @override
//   State<UniversalSearchComponent> createState() =>
//       _UniversalSearchComponentState();
// }
//
// class _UniversalSearchComponentState extends State<UniversalSearchComponent> {
//   @override
//   Widget build(BuildContext context) {
//     return UniversalSearch(
//       searchItems: [
//         UniversalSearchItem(
//           tags: ['dark, dark'],
//           widget: ListTile(
//             leading: SizedBox(
//               height: double.infinity,
//               child: Icon(
//                 Icons.dark_mode,
//               ),
//             ),
//             title: Text('Dark Mode'),
//             trailing: Switch(
//               value: RootMaterialApp.of(context).themeMode == ThemeMode.dark,
//               onChanged: (value) {
//                 RootMaterialApp.of(context)
//                     .changeTheme(themeMode: ThemeMode.dark);
//               },
//             ),
//             //tileColor: Colors.grey,
//             shape: RoundedRectangleBorder(
//               side: BorderSide.none,
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//         ),
//         UniversalSearchItem(
//           tags: ['light, Light', 'bright', 'ពន្លឺ'],
//           widget: ListTile(
//             leading: SizedBox(
//               height: double.infinity,
//               child: Icon(
//                 Icons.light_mode,
//               ),
//             ),
//             title: Text('Light Mode'),
//             trailing: Switch(
//               value: RootMaterialApp.of(context).themeMode == ThemeMode.light,
//               onChanged: (value) {
//                 RootMaterialApp.of(context)
//                     .changeTheme(themeMode: ThemeMode.light);
//               },
//             ),
//             //tileColor: Colors.grey,
//             shape: RoundedRectangleBorder(
//               side: BorderSide.none,
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//         ),
//         UniversalSearchItem(
//           tags: ['item, Item'],
//           widget: ListTile(
//             leading: SizedBox(
//               height: double.infinity,
//               child: Icon(
//                 Icons.category,
//                 color: Colors.red,
//               ),
//             ),
//             title: Text('Item'),
//             onTap: () {
//               AutoRouter.of(context).push(
//                 ItemWrapperRoute(),
//               );
//             },
//             shape: RoundedRectangleBorder(
//               side: BorderSide.none,
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//         ),
//         UniversalSearchItem(
//           tags: [
//             'add item',
//             'Add Item',
//             'Create',
//             'create',
//             'Insert',
//             'insert'
//           ],
//           widget: ListTile(
//             leading: SizedBox(
//               height: double.infinity,
//               child: Icon(
//                 Icons.category,
//                 color: Colors.red,
//               ),
//             ),
//             title: Text('Add Item'),
//             onTap: () {
//               AutoRouter.of(context).push(
//                 AddItemRoute(),
//               );
//             },
//             shape: RoundedRectangleBorder(
//               side: BorderSide.none,
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
