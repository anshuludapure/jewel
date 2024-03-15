import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { IonicModule, IonicRouteStrategy } from '@ionic/angular';
import { JsonDataService } from './services/json-data.service';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SearchComponent } from './pages/search/search.component';
import { SearchresultComponent } from './pages/searchresult/searchresult.component';
import { ViewcatComponent } from './pages/viewcat/viewcat.component';
import { CommonModule } from '@angular/common';
import { BycategoryComponent } from './pages/bycategory/bycategory.component';
import { PageloaderComponent } from './shared/pageloader/pageloader.component';

@NgModule({
  declarations: [AppComponent, SearchComponent, SearchresultComponent, ViewcatComponent, BycategoryComponent, PageloaderComponent],
  imports: [BrowserModule, CommonModule, IonicModule.forRoot(), AppRoutingModule, HttpClientModule, FormsModule],
  providers: [{ provide: RouteReuseStrategy, useClass: IonicRouteStrategy,  }, JsonDataService],
  bootstrap: [AppComponent],
})
export class AppModule {}
