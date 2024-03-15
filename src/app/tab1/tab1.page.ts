import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';


@Component({
  selector: 'app-tab1',
  templateUrl: 'tab1.page.html',
  styleUrls: ['tab1.page.scss']
})
export class Tab1Page implements OnInit {
  
  goldProducts:any[] = [];;

  constructor(private router:Router, private http:HttpClient) {}

  ngOnInit(): void {
    this.getGold()
    console.log(this.goldProducts);
  }

  openSearch() { 
    this.router.navigate(['search']);
  }

  navigate(page:string) { 
    this.router.navigate([page]);
  }

  getGold() { 
    this.http.get<any>('http://localhost/jewel_api/browse/category?limit=4').subscribe(data => {
      this.goldProducts = data.products;
  })      
  }

}
