import 'package:farmgo/models/field.dart';
import 'package:farmgo/models/source.dart';

import '../models/article.dart';

class DummyData {
  static final List<Field> fields = [
    Field(
        id: '1',
        fieldName: 'Field 1',
        latitude: 0,
        longitude: 0,
        ownerName: 'Ahmad',
        ownerId: '1',
        address: "i8 Markaz Ranchers",
        imgUrl:
            "https://media.istockphoto.com/id/1342189104/photo/aerial-view-of-tea-field.jpg?s=2048x2048&w=is&k=20&c=Tzoru0XYjF9kWQzhfTFNGbfUR8_siLCDS6v7Rd047LA=",
        city: 'Islamabad'),
    Field(
        id: '1',
        fieldName: 'Field 2',
        latitude: 0,
        longitude: 0,
        ownerName: 'Haider',
        ownerId: '2',
        address: "i8 Markaz Ranchers",
        imgUrl:
            "https://media.istockphoto.com/id/1293479700/photo/prairie.jpg?s=2048x2048&w=is&k=20&c=5o64w71YZ_eRSWGPoZrbyUyodY6PHUN8LXmZdkHtNlQ=",
        city: 'Islamabad'),
    Field(
        id: '1',
        fieldName: 'Field 3',
        latitude: 0,
        longitude: 0,
        ownerName: 'Amna',
        ownerId: '3',
        address: "i8 Markaz Ranchers",
        imgUrl:
            "https://media.istockphoto.com/id/1349772438/photo/thoroughbred-horses-grazing-at-sunset-in-a-field.jpg?s=2048x2048&w=is&k=20&c=onjiVOyNmmYEwxlQgKk7m1KDS-B5NcNV4Hgv7mDQKWw=",
        city: 'Islamabad'),
    Field(
        id: '1',
        fieldName: 'Field 4',
        latitude: 0,
        longitude: 0,
        ownerName: 'Hassam',
        ownerId: '4',
        address: "i8 Markaz Ranchers",
        imgUrl:
            "https://media.istockphoto.com/id/1293479700/photo/prairie.jpg?s=2048x2048&w=is&k=20&c=5o64w71YZ_eRSWGPoZrbyUyodY6PHUN8LXmZdkHtNlQ=",
        city: 'Islamabad'),
    Field(
        id: '1',
        fieldName: 'Field 5',
        latitude: 0,
        longitude: 0,
        ownerName: 'Hamza',
        ownerId: '5',
        address: "i8 Markaz Ranchers",
        imgUrl:
            "https://media.istockphoto.com/id/1349772438/photo/thoroughbred-horses-grazing-at-sunset-in-a-field.jpg?s=2048x2048&w=is&k=20&c=onjiVOyNmmYEwxlQgKk7m1KDS-B5NcNV4Hgv7mDQKWw=",
        city: 'Islamabad'),
    Field(
        id: '1',
        fieldName: 'Field 6',
        latitude: 0,
        longitude: 0,
        ownerName: 'Ayesha',
        ownerId: '6',
        address: "i8 Markaz Ranchers",
        imgUrl:
            "https://media.istockphoto.com/id/1293479700/photo/prairie.jpg?s=2048x2048&w=is&k=20&c=5o64w71YZ_eRSWGPoZrbyUyodY6PHUN8LXmZdkHtNlQ=",
        city: 'Islamabad'),
    Field(
        id: '1',
        fieldName: 'Field 7',
        latitude: 0,
        longitude: 0,
        ownerName: 'Hasher',
        ownerId: '7',
        address: "i8 Markaz Ranchers",
        imgUrl:
            "https://media.istockphoto.com/id/1349772438/photo/thoroughbred-horses-grazing-at-sunset-in-a-field.jpg?s=2048x2048&w=is&k=20&c=onjiVOyNmmYEwxlQgKk7m1KDS-B5NcNV4Hgv7mDQKWw=",
        city: 'Islamabad'),
  ];

  static List<Article> article = [
    Article(
        source: Source(name: 's1'),
        author: 'Ahmad',
        title: "Title",
        description:
            "Lorem Epsum lfdhsgjknj fdsjab n dscbl dsvbauj ,sdj csdujk nusdb fusd fubdsv bui svdbui fsdj ubsdj cubfdsnv jbfdv jibsddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddj h djs j",
        url:
            'https://avatars.githubusercontent.com/u/89170825?s=400&u=8e761122356d99efa9fe5a556da871471ae7dc97&v=4',
        urlToImage:
            'https://avatars.githubusercontent.com/u/89170825?s=400&u=8e761122356d99efa9fe5a556da871471ae7dc97&v=4',
        content: 'Content')
  ];
}
