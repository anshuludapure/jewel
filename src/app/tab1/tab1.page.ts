import { Component, OnInit } from '@angular/core';
import { ProductfilterPipe } from './productfilter.pipe';

import {HttpClient} from '@angular/common/http';

interface groupByCategory {
  category: string;
  products: any;
}


@Component({
  selector: 'app-tab1',
  templateUrl: 'tab1.page.html',
  styleUrls: ['tab1.page.scss']
})


export class Tab1Page  implements OnInit {
  products1: any = [];
  data:any;
  searchBoxTxt: string = '';
  selectedProduct: string= '';
  checkEmpty: boolean= true;
  myData: any[]= [{
        "productCode": "876544",
        "productName": "T shirt",
        "productQuantity":21,
        "productPrice": 19.99
    }, {
        "productCode": "946765",
        "productName": "Coat",
        "productQuantity": 16,
        "productPrice": 99.97
    }, {
        "productCode": "340542",
        "productName": "Hoody",
        "productQuantity": 34,
        "productPrice": 29.99
    }, {
        "productCode": "230945",
        "productName": "Belt",
        "productQuantity": 9,
        "productPrice": 9.97
    }, {
        "productCode": "981875",
        "productName": "Pant",
        "productQuantity": 6,
        "productPrice": 69.99
    }, {
        "productCode": "999876",
        "productName": "Shirt",
        "productQuantity": 12,
        "productPrice": 16.99
    }, {
        "productCode": "109876",
        "productName": "Socks",
        "productQuantity": 43,
         "productPrice": 9.98
    }, {
        "productCode": "762341",
        "productName": "Sweater",
        "productQuantity": 23,
        "productPrice": 43.99
    }, {
        "productCode": "873445",
        "productName": "Shoe",
        "productQuantity": 10,
        "productPrice": 31.97
    }];

    
  products = [
    {
      "id": 1,
      "name": "Product 1",
      "category": "Category A",
      "description": "Description of product 1",
      "price": 9.99
    },
    {
      "id": 2,
      "name": "Product 2",
      "category": "Category B",
      "description": "Description of product 2",
      "price": 19.99
    },
    {
      "id": 3,
      "name": "Product 3",
      "category": "Category A",
      "description": "Description of product 3",
      "price": 29.99
    },
    {
      "id": 4,
      "name": "Product 4",
      "category": "Category C",
      "description": "Description of product 4",
      "price": 39.99
    },
    {
      "id": 5,
      "name": "Product 5",
      "category": "Category B",
      "description": "Description of product 5",
      "price": 49.99
    },
    {
      "id": 6,
      "name": "Product 6",
      "category": "Category A",
      "description": "Description of product 6",
      "price": 59.99
    },
    {
      "id": 7,
      "name": "Product 7",
      "category": "Category C",
      "description": "Description of product 7",
      "price": 69.99
    },
    {
      "id": 8,
      "name": "Product 8",
      "category": "Category B",
      "description": "Description of product 8",
      "price": 79.99
    },
    {
      "id": 9,
      "name": "Product 9",
      "category": "Category A",
      "description": "Description of product 9",
      "price": 89.99
    },
    {
      "id": 10,
      "name": "Product 10",
      "category": "Category C",
      "description": "Description of product 10",
      "price": 99.99
    }
  ]
  httpClient: any;
  categories: groupByCategory[] = [];

  constructor(httpClient: HttpClient) {
    this.httpClient = httpClient;
  }

  getProductDetail(productName:any){
    console.log(productName);
    this.selectedProduct = productName;
    this.searchBoxTxt = productName;
  }
  ngOnInit(){
    this.httpClient.get('https://fakestoreapi.com/products/category/jewelery').subscribe((data:any )=> {

      if (data){
         this.data = data;
        console.log(data);
        data.forEach( (prd : any ) => {
          console.log(prd.title);
           this.products1.push(prd.title);
        })
      }
    });
  }

  public sortProductsDesc(): void {
    this.products = this.products.sort((a, b) => a.price - b.price);
  }

  public sortProductsAsc() {
    this.products = this.products.sort((a, b) => b.price - a.price);
  }

  filterBy(nameInput:any) {
    if (nameInput.value) {
      this.products = this.products.filter(p => p.name === nameInput.value)
    }
  }

  filterBySearch(nameInput:any){
    console.log(nameInput.value);
  }
  showGroup() {
    //First, group the products by category
    const group = this.products.reduce((acc: any, curr) => {
      let key = curr.category;
      if (!acc[key]) {
        acc[key] = [];
      }
      acc[key].push(curr);
      return acc;
    }, {});

    //Get the categories and product related.
    this.categories = Object.keys(group ).map(key => ({
      category: key,
      products: group[key]
    }));

  }

}
