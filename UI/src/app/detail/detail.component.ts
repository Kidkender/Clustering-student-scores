import { AfterViewInit, Component } from '@angular/core';
import { APIservicesService } from '../Services/data.service';

@Component({
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  styleUrl: './detail.component.scss'
})
export class DetailComponent implements AfterViewInit {
  constructor(private service: APIservicesService){

  }

  ngAfterViewInit(): void {
    setTimeout(() => { this.Init() }, 0)
  }

  Init(): void { 
    var id = parseInt(window.location.href.split('/').reverse()[0])
    this.code = id
    this.service.getAllSubjectById(id)
    .subscribe({
      next: (re : any) => {
        this.subject = re
      }
    })

    this.service.getAllRateById(id)
    .subscribe({
      next: (re : any) => {
        this.point = re
      }
    })

    this.service.getAllTop10GroupById(id)
    .subscribe({
      next: (re : any) => {
        this.grouptop10 = re
      }
    })

    this.service.getFindGroupSubject(id)
    .subscribe({
      next: (re : any) => {
        this.findgroup = re.result
      }
    })

    this.service.getRecommendGroup(id)
    .subscribe({
      next: (re : any) => {
        this.recommendLV1 = re.result.level_1
        this.recommendLV2 = re.result.level_2
        this.recommendLV3 = re.result.level_3
      }
    })
  }

  code: any
  subject : any
  point : any
  subjecttop5: any
  grade : any = ""
  grouptop10 : any
  groupsubject: any
  findgroup: string[] = []
  recommendLV1: any 
  recommendLV2: any 
  recommendLV3: any 

  changTop5() {
    this.service.getAllTop5SubjectById(this.code, this.grade)
    .subscribe({
      next: (re : any) => {
        this.subjecttop5 = re
      }
    })
  }

  reverse(subjects3: any) {
    this.service.getGroupBy3Subject(subjects3)
    .subscribe({
      next: (re : any) => {
        this.groupsubject = re.result
      },
      error: (er :any) => {
        this.groupsubject = "Không có"
      }
    })
  }
}
