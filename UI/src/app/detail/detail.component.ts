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

    this.service.getAllTop10GroupById(id,this.grade)
    .subscribe({
      next: (re : any) => {
        this.grouptop10 = re
      }
    })

    this.service.getRecommendGroup(id, this.grade2)
    .subscribe({
      next: (re : any) => {
        this.recommendLV1 = re.result.level_1
        this.recommendLV2 = re.result.level_2
        this.recommendLV3 = re.result.level_3
        this.recommendLOrder = re.result.other_recommend
        this.typeRecommend = re.type_recommend == "Main recommend" ? "Kiến nghị chính" : "Kiến nghị cần nỗ lực thêm"
      }
    })

    this.service.getAllTop5SubjectById(this.code, this.grade)
    .subscribe({
      next: (re : any) => {
        this.subjecttop5 = re
      }
    })
  }

  code: any
  subject : any
  point : any
  subjecttop5: any
  grade : any = 10
  grouptop10 : any
  groupsubject: any
  findgroup: string[] = []
  recommendLV1: any 
  recommendLV2: any 
  recommendLV3: any 
  recommendLOrder: any 
  grade2: any = 'GRADE_10'
  typeRecommend = ""

  changTop5() {
    this.service.getAllTop5SubjectById(this.code, this.grade)
    .subscribe({
      next: (re : any) => {
        this.subjecttop5 = re
      }
    })

    this.service.getAllTop10GroupById(this.code,this.grade)
    .subscribe({
      next: (re : any) => {
        this.grouptop10 = re
      }
    })
  }

  changeFindGroup()
  {
    this.service.getFindGroupSubject(this.code,this.grade2)
    .subscribe({
      next: (re : any) => {
        this.findgroup = re.result
      }
    })

    this.service.getRecommendGroup(this.code, this.grade2)
    .subscribe({
      next: (re : any) => {
        this.recommendLV1 = re.result.level_1
        this.recommendLV2 = re.result.level_2
        this.recommendLV3 = re.result.level_3
        this.recommendLOrder = re.result.other_recommend
        this.typeRecommend = re.type_recommend == "Main recommend" ? "Kiến nghị chính" : "Kiến nghị cần nỗ lực thêm"
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
