import { AfterViewInit, Component } from '@angular/core';
import { APIservicesService } from '../Services/data.service';

@Component({
  selector: 'app-data',
  templateUrl: './data.component.html',
  styleUrl: './data.component.scss'
})
export class DataComponent implements AfterViewInit {
  constructor(private service: APIservicesService) {

  }

  ngAfterViewInit(): void {
    setTimeout(() => { this.Init() }, 0)
  }

  Init(): void { 
    this.service.getAllStudent()
    .subscribe({
      next: (re : any) => {
        this.listStudent = re
      }
    })
  }

  listStudent : any
  listscore : any
  grade: any = "1"
  group: any = "A00"
  
  changGroupGrade(){
    this.service.getScoreGroupBySemster(this.grade)
    .subscribe({
      next: (re : any) => {
        this.listscore = re
        console.log(re)
      }
    })
  }
}