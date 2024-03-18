import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { apiUrl } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class JsonDataService {


  constructor(private http: HttpClient) { }

  getProducts(): Observable<any[]> {
    return this.http.get<any[]>('assets/products.json');
  }

  getCategories(): Observable<any[]> {
    return this.http.get<any[]>('assets/category.json');
  }

  getdeepSearchProduct(searchKeyword:any): Observable<any> {
    return this.http.get<any[]>(apiUrl+'deep_search_product.php?query='+searchKeyword);
  }
}