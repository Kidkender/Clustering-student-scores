import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { IntroductionComponent } from './introduction/introduction.component';
import { AboutComponent } from './about/about.component';
import { ClusterComponent } from './cluster/cluster.component';
import { DataComponent } from './data/data.component';
import { DetailComponent } from './detail/detail.component';

const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo:'home' },
  { path: 'home', component:HomeComponent },
  { path: 'introduction', component:IntroductionComponent },
  { path: 'about', component: AboutComponent },
  { path: 'cluster', component: ClusterComponent },
  { path: 'data', component: DataComponent },
  { path: 'detail/:id', component: DetailComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
