import 'package:flutter/material.dart';

List<Map<String, dynamic>> items = [
  {
    "id": 1,
    "item": "Shirt",
    "price": "BDT 15",
    "url":
        "https://res.cloudinary.com/dpsu6lwgv/image/upload/v1699274052/laundryWala/items/kexn80txc65vjperiaxg.png",
    "quantity": 0,
  },
  {
    "id": 2,
    "item": "T-shirt",
    "price": "BDT 15",
    "url":
        "https://res.cloudinary.com/dpsu6lwgv/image/upload/v1699275481/laundryWala/items/k8ljlba8mndnpqucnize.png",
    "quantity": 4,
  },
  {
    "id": 3,
    "item": "Pajama",
    "price": "BDT 15",
    "url":
        "https://res.cloudinary.com/dpsu6lwgv/image/upload/v1699274051/laundryWala/items/lqvrxlf3cfqbemzwfvpk.png",
    "quantity": 2,
  },
  {
    "id": 4,
    "item": "Pant",
    "price": "BDT 15",
    "url":
        "https://res.cloudinary.com/dpsu6lwgv/image/upload/v1699288181/laundryWala/items/ccb34ebm4684gbfyqplv.png",
    "quantity": 0,
  },
  {
    "id": 5,
    "item": "Panjabi",
    "price": "BDT 15",
    "url":
        "https://res.cloudinary.com/dpsu6lwgv/image/upload/v1699274051/laundryWala/items/fligrktjuzulrtcfdvav.png",
    "quantity": 0,
  },
];

var offerNMore = [
  {
    "headline": "Laundry in Progress",
    "subHeader": "You can see \nin various stages",
  },
  {
    "headline": "30% OFF",
    "subHeader": "USE KAPOR30 TO \n GET 30% DISCOUNT",
  },
];

var priceChart = [
  'Wash + Iron combo: 3 T-Shirt + 3 Pants ➜ BDT-199',
  'Iron Only: 2 Shirt + 3 T-Shirt + 3 Pants ➜ BDT-105',
  'Iron Only: 2 Pajama + 2 Panjabi + 2 T-Shirt ➜ BDT-75',
  'Regular Wash: 3 Shirt + 3 Pants ➜ BDT-130',
];

var accountInfo = [
  {"headline": "Name", "info": "Muntasir Mahmud Saif"},
  {"headline": "Email", "info": "saifmahmud81@gmail.com"},
  {"headline": "Phone Number", "info": "+8801761264426"},
];

var address = [
  {
    'heading': 'home',
    'location': 'Dhanmondi 8/A, Dhaka-1209',
    'icon': const Icon(Icons.home_rounded)
  },
  {
    'heading': 'office',
    'location': 'Dhanmondi 27, Dhaka-1209',
    'icon': const Icon(Icons.home_work_rounded)
  },
  {
    'heading': 'other',
    'location': 'Dhanmondi 5, Dhaka-1209',
    'icon': const Icon(Icons.edit_location)
  },
];

int totalQuantity = 6;
int deliveryFee = 30;
