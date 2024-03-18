import { Component, CUSTOM_ELEMENTS_SCHEMA, OnInit, ViewChild } from '@angular/core';
import { IonSearchbar } from '@ionic/angular';
import { HttpClient } from '@angular/common/http';
import { Observable, Subject } from 'rxjs';
import { map, catchError, distinctUntilChanged, debounceTime, switchMap } from 'rxjs/operators';
import { NO_ERRORS_SCHEMA } from '@angular/compiler';
import { Router } from '@angular/router';
import { forkJoin } from 'rxjs';

import { JsonDataService } from 'src/app/services/json-data.service';


@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.scss']
})
export class SearchComponent  implements OnInit {
  @ViewChild('searchBar') searchBar: IonSearchbar | undefined;
  apiUrl = 'http://localhost/jewel_api/search_product';
  searchTerm: string = '';
  products: any[] = [];
  categories : any = [];
  combinedList : any = [];
  constructor(private router:Router, private dataService: JsonDataService) {}

  searchProducts(event: any) {
    console.log(event);
    const searchTerm = event.target.value.toLowerCase();
    if(searchTerm) { 
/*      this.dataService.getCategories().subscribe((data:any) => {
        console.log(data);
        this.categories = data.filter( (category:any) => category.cat_name.toLowerCase().includes(searchTerm))
        this.combinedList.push(this.categories);
      })
      this.dataService.getProducts().subscribe(data => {
        this.products = data.filter(product =>
          product.product_name.toLowerCase().includes(searchTerm)          
        );
        this.combinedList.push(this.products);
      });
      */
     const $categories = this.dataService.getCategories();
     const $products = this.dataService.getProducts();
     // All data available
  forkJoin([$categories, $products]).subscribe(([$categories, $products]) => {
      this.products = $products.filter(product =>
        product.product_name.toLowerCase().includes(searchTerm)          
      );
      this.categories = $categories.filter(category =>
        category.cat_name.toLowerCase().includes(searchTerm)          
      );
      });
     } else { 
      this.products = [];
    }

    /* implement search result page on enter key */

    if(event.keyCode === 13){
		//Need to check replacement for enter keyword in ionic
    let searchobj = { 'product_name':event.target.value};
      this.router.navigateByUrl('/searchresult', { state: searchobj });
    }
  }

  clearSearch() { 
    this.products = [];
  }

  gotTODeepSearch(product_info: any){
   console.log(product_info);
   this.router.navigateByUrl('/searchresult', { state: product_info });
  }
  // searchProducts(event: any) {
  //   console.log(event.target.value);
  // }


  ngOnInit() {
  }

  ionViewDidEnter() {
    this.searchBar?.setFocus();
  }

}
