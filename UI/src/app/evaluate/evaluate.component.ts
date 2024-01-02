import { AfterViewInit, Component } from '@angular/core';
import { APIservicesService } from '../Services/data.service';

@Component({
  selector: 'app-evaluate',
  templateUrl: './evaluate.component.html',
  styleUrl: './evaluate.component.scss'
})
export class EvaluateComponent implements AfterViewInit {
  constructor(private service: APIservicesService ) {

  }

  ngAfterViewInit(): void {
    setTimeout(() => { this.Init() }, 0)
  }

  Init() {
    this.service.getCompareModel(this.semester4, this.n)
    .subscribe({
      next: (re) => {
        this.image6 = re.model_plot
      }
    })
  }
  image6 = ''
  semester4 = 1
  n = 6
  compareModel(){
    this.service.getCompareModel(this.semester4,this.n)
    .subscribe({
      next: (re) => {
        this.image6 = re.model_plot
      }
    })
  }
}
