import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { HomeComponent } from './home/home.component';
import { IntroductionComponent } from './introduction/introduction.component';
import { AboutComponent } from './about/about.component';
import { ClusterComponent } from './cluster/cluster.component';
import { DataComponent } from './data/data.component';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DetailComponent } from './detail/detail.component';
import { ChartModule } from 'angular-highcharts';
import { EvaluateComponent } from './evaluate/evaluate.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    IntroductionComponent,
    AboutComponent,
    ClusterComponent,
    DataComponent,
    DetailComponent,
    EvaluateComponent
  ],
  imports: [
    BrowserModule,
    ChartModule,
    NgbModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule, 
    ReactiveFormsModule,
  ],
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
