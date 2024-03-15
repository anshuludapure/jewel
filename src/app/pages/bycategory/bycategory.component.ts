import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-bycategory',
  templateUrl: './bycategory.component.html',
  styleUrls: ['./bycategory.component.scss'],
})
export class BycategoryComponent  implements OnInit {
  showLoader:boolean = true;
  categoryId:any;
  catName:string = 'Browse Category';
  categories:any[] = [];
  productCount:number = 0;

  constructor(private http:HttpClient, private route: ActivatedRoute) { 
    this.route.params.subscribe(params => {
      this.categoryId = params['catId'];
    });
  }

  ngOnInit() {
    this.getCategories();
  }

  getCategories() { 
    this.http.get<any>(`http://localhost/jewel_api/browse/productsByCat?catId=${this.categoryId}`).subscribe(data => {
      this.categories = data.products;
      this.catName = data.catName;
      this.productCount = data.found;
      this.showLoader = false;
    })      
  }

}
