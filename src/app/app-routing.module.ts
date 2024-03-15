import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { BycategoryComponent } from './pages/bycategory/bycategory.component';
import { SearchComponent } from './pages/search/search.component';
import { ViewcatComponent } from './pages/viewcat/viewcat.component';
import { SearchresultComponent } from './pages/searchresult/searchresult.component';


const routes: Routes = [
  {
    path: '',
    loadChildren: () => import('./tabs/tabs.module').then(m => m.TabsPageModule),
  },
  { path: 'search', component: SearchComponent },
  { path: 'categories/:data', component: ViewcatComponent },
  { path: 'viewCategory/:catId', component: BycategoryComponent },
  { path: 'searchresult', component: SearchresultComponent}
];
@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}
