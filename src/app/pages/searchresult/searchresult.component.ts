import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { setThrowInvalidWriteToSignalError } from '@angular/core/primitives/signals';
import { ActivatedRoute, Router } from '@angular/router';
import { JsonDataService } from 'src/app/services/json-data.service';


@Component({
  selector: 'app-searchresult',
  templateUrl: './searchresult.component.html',
  styleUrls: ['./searchresult.component.scss'],
})
export class SearchresultComponent  implements OnInit {

  categories:any[] = [];
  showLoader:boolean = true;
  category:any;
  productSearch: any[] = [];
  productSearchHeading:any='';
  constructor(private http:HttpClient, private route: ActivatedRoute, private router:Router, private dataService: JsonDataService) {
  
    this.route.params.subscribe(params => {
      this.category = params['data'];
    });
  }

  
  ngOnInit() {
    console.log(history);
    if(history.state.product_name){
      var searchTerm = history.state.product_name;
    }else{
      var searchTerm = history.state.cat_name;
    }
    console.log(searchTerm);

    this.productSearchHeading = "List of products with keyword : " + searchTerm;
    if(searchTerm) { 
      this.getDeepSearchProducts(searchTerm);       
    } else { 
      this.productSearch = [];
    }

    this.getCategories();
 
  }

  getDeepSearchProducts(searchTerm:any){
    console.log(searchTerm);
    this.dataService.getdeepSearchProduct(searchTerm).subscribe(data => {
      console.log(data);
      this.productSearch = data.products;
      this.showLoader = false;
  })      
  }

  navigateLink(id:any) { 
    this.router.navigate(['viewCategory', id]);
  }


  getCategories() { 
    this.http.get<any>('http://localhost/jewel_api/browse/category').subscribe(data => {
      this.categories = data.products;
      this.showLoader = false;
  })      
  }

}
