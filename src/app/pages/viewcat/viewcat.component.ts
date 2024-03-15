import { HttpClient } from '@angular/common/http';
import { Component, NO_ERRORS_SCHEMA, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-viewcat',
  templateUrl: './viewcat.component.html',
  styleUrls: ['./viewcat.component.scss'],
})
export class ViewcatComponent  implements OnInit {

  categories:any[] = [];
  showLoader:boolean = true;
  category:any;

  constructor(private http:HttpClient, private route: ActivatedRoute, private router:Router) { 
    this.route.params.subscribe(params => {
      this.category = params['data'];
    });
  }

  ngOnInit() {
    this.getCategories();
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
